function enter {
  mkdir -p "$*" && cd "$*"
}

function tunip {
  /usr/bin/ip a s tun0 | /usr/bin/awk /inet/'{print $2}' | /usr/bin/cut -d"/" -f1 | /usr/bin/head -n1
}

function hx {
  od -tx1 "$1" | cut -c8- | sed 's/ /\\x/g'
}

function gitd {
  git clone --depth 1 "$@"
}

function proxify {

  PROXY_CONFIG="./proxychains.conf"
  if [[ ! -f $PROXY_CONFIG ]]; then
    echo "[-] Couldn't find \"proxychains.conf\" file."
    echo "\t Using the default."
    PROXY_CONFIG="/etc/proxychains.conf"
  fi

  proxychains -f "$PROXY_CONFIG" "$@"
}

function cheat {
  pushd
  cd ~/notes
  cat * | bat --file-name notes.md
  popd
}

function typora {
  setsid /usr/bin/typora "$@" >&/dev/null &
}

function mullvad_off {
  interface=$(ip a | grep -- '-wg-' | awk -F":" '/:/{print $2}' | tr -d ' ')
  echo "[+] Bringing ${interface} down..."
  sudo wg-quick down "${interface}"
}

function mullvad_on {
  connection=${wireguard_connections[$RANDOM % 394]}
  if [[ ! -z $1 ]]; then
    connection="$1"
  fi
  echo "[+] Connecting to ${connection}..."
  sudo wg-quick up "${connection}"
}

function install_burp {
  BURPSUITEPRO="${HOME}/BurpSuitePro"

  if [ -d "${BURPSUITEPRO}" ]; then

    current_burp_version=$(realpath "${BURPSUITEPRO}/burpsuite_pro.jar" | grep -Po '(?<=/burpsuite_pro_v)[0-9]+\.[0-9]+\.[0-9]+\.[0-9]+')
    latest_burp_version=$(curl -s https://portswigger.net/burp/releases | grep -Po '(?<=/burp/releases/professional-community-)[0-9]+\-[0-9]+\-[0-9]+\-[0-9]+' | head -n 1 | tr '-' '.' )

    echo "[*] Current version: ${current_burp_version}"
    echo "[*] Latest version: ${latest_burp_version}"

    if [[ $current_burp_version != $latest_burp_version ]]; then
        echo "Updating Burp Pro from $current_burp_version to $latest_burp_version"
        wget -q --show-progress --directory-prefix="${BURPSUITEPRO}" \
          -O "burpsuite_pro_v${latest_burp_version}.jar" \
          "https://portswigger-cdn.net/burp/releases/download?product=pro&version=&type=jar"
        echo "Removing old Burp Pro version"
        rm -f "${BURPSUITEPRO}/burpsuite_pro_v$current_burp_version.jar"
        echo "Symlinking new Burp Pro version"
        ln -f -s "${BURPSUITEPRO}/burpsuite_pro_v$latest_burp_version.jar" "${BURPSUITEPRO}/burpsuite_pro.jar"
    else
        echo "Burp Pro is already up to (date current version: $current_burp_version == latest version: $latest_burp_version)"
    fi

  fi
}

function python-env {
  TARGET_VENV=$(eval echo "${HOME}/.local/share/virtualenvs/python-env*")
  
  if [ -d ${TARGET_VENV} ]; then
    echo "[*] Using ${TARGET_VENV} as a virtualenv"
    . "${TARGET_VENV}/bin/activate"
  fi

}

function dotenv {
  if [ -f ~/.env ]; then
    set -o allexport
    source ~/.env
    set +o allexport
  fi
}

