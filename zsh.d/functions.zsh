function enter {
	mkdir -p "$*" && cd "$*"
}

function venv {
  local vdir="${1}.venv"
	virtualenv "${vdir}";
	source "./${vdir}/bin/activate"
}

function genssh {
	ssh-keygen -a 1024 -b 4096 -t rsa -C "" -f "$1"
}

function memfree {
	local free_mem_before="$(free -mh | awk '/Mem:/{print $4}')"
	{
		echo 1 | sudo tee /proc/sys/vm/drop_caches
	} >&/dev/null
	local free_mem_after="$(free -mh | awk '/Mem:/{print $4}')"

	echo "[#] Before: ${free_mem_before}"
	echo "[#] After:  ${free_mem_after}"
}

function uniq_ips {
    local filename
    
    filename="$1"
    if [[ ! -z $filename ]]; then
        filename="targets.txt";
    fi

    cat "${filename}" |& xargs -I% host % |& grep -Po "([0-9]{1,3}\.){3}[0-9]{1,3}" | sort -u | uniq
}

function new_project {
    enter "$1"
    mkdir -p {burp,dirscan,files,nmap,notes}
    touch notes/{"Cleanup List","Findings","Point of Contact","Scoping Document","Targets"}.md
    cp -r ~/temp/.obsidian ./notes/
}

function magic_bytes {
	local magic
	local payload

	case "$1" in
		png) magic="\x89PNG\r\n\x1a\n\0\0\0\rIHDR\0\0\x03H\0\xs0\x03[" ;;
		jpg) magic="\xff\xd8\xff" ;;
		gif) magic="GIF87a" ;;
		*)   echo "[-] Unsupported filetype" && return 1
	esac
	
	if [[ ! -z "$2" ]]; then
		payload="$2";
	else
		payload="";
	fi

	printf "${magic}\n%s" "${payload}"
}
