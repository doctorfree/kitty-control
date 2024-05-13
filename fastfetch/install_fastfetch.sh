#!/usr/bin/env bash
#
# Linux: download release asset
# Mac:   install with Homebrew if available or download release asset
# SC2001,SC2016,SC2006,SC2086,SC2181,SC2129,SC2059,SC2164
# shellcheck disable=SC2181

export PATH="$HOME/.local/bin:$PATH"

have_brew=$(type -p brew)
have_wget=$(type -p wget)
have_curl=$(type -p curl)
have_jq=$(type -p jq)
platform=$(uname -s)
darwin=
[ "${platform}" == "Darwin" ] && darwin=1
arm=
mach=$(uname -m)
[ "${mach}" == "arm64" ] && arm=1

# Use a Github API token if one is set
[ "${GITHUB_TOKEN}" ] || {
  [ "${GH_API_TOKEN}" ] && export GITHUB_TOKEN="${GH_API_TOKEN}"
  [ "${GITHUB_TOKEN}" ] || {
    [ "${GH_TOKEN}" ] && export GITHUB_TOKEN="${GH_TOKEN}"
  }
}

if [ "${GITHUB_TOKEN}" ]; then
  AUTH_HEADER="-H \"Authorization: Bearer ${GITHUB_TOKEN}\""
else
  AUTH_HEADER=
fi

dl_asset() {
  if [ "${darwin}" ]; then
    name="fastfetch-macos-universal"
  else
    if [ "${arm}" ]; then
      name="fastfetch-linux-aarch64"
    else
      name="fastfetch-linux-amd64"
    fi
  fi

  OWNER=fastfetch-cli
  PROJECT=fastfetch
  API_URL="https://api.github.com/repos/${OWNER}/${PROJECT}/releases/latest"
  DL_URL=
  [ "${have_curl}" ] && [ "${have_jq}" ] && {
    DL_URL=$(curl --silent ${AUTH_HEADER} "${API_URL}" \
      | jq --raw-output '.assets | .[]?.browser_download_url' \
      | grep "${name}\.tar\.gz$")
  }

  [ "${DL_URL}" ] && {
    [ "${have_wget}" ] && {
      printf "\nDownloading fastfetch release asset ..."
      TEMP_ASS="$(mktemp --suffix=.tgz)"
      wget --quiet -O "${TEMP_ASS}" "${DL_URL}" >/dev/null 2>&1
      chmod 644 "${TEMP_ASS}"
      mkdir -p /tmp/fast$$
      tar -C /tmp/fast$$ -xzf "${TEMP_ASS}"
      [ -d /tmp/fast$$/${name} ] && {
        cd /tmp/fast$$/${name}
        if [ "${darwin}" ]; then
          sudo chown -R root:wheel usr
        else
          sudo chown -R root:root usr
        fi
        sudo tar cf /tmp/fastfetch$$.tar usr
        cd /
        sudo tar xf /tmp/fastfetch$$.tar
        sudo rm -f /tmp/fastfetch$$.tar
      }
      cd
      rm -f "${TEMP_ASS}"
      sudo rm -rf /tmp/fast$$
      printf " done"
    }
  }
}

have_fastfetch=$(command -v fastfetch)
[ "${have_fastfetch}" ] && {
  printf "\nFastfetch already installed as %s" "${have_fastfetch}"
  printf "\nRemove fastfetch and rerun this script to reinstall fastfetch"
  printf "\nExiting without installing\n"
  exit 0
}
if [ "${darwin}" ]
then
  if [ "${have_brew}" ]
  then
    brew install fastfetch >/dev/null 2>&1
  else
    dl_asset
  fi
else
  dl_asset
fi
