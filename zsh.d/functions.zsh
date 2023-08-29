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
