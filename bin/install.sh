#!/bin/bash

# Color

# Reset
export Color_Off="\033[0m"       # Text Reset

# Regular Colors
export Black="\033[0;30m"        # Black
export Red="\033[0;31m"          # Red
export Green="\033[0;32m"        # Green
export Yellow="\033[0;33m"       # Yellow
export Blue="\033[0;34m"         # Blue
export Purple="\033[0;35m"       # Purple
export Cyan="\033[0;36m"         # Cyan
export White="\033[0;37m"        # White

# Bold
export BBlack="\033[1;30m"       # Black
export BRed="\033[1;31m"         # Red
export BGreen="\033[1;32m"       # Green
export BYellow="\033[1;33m"      # Yellow
export BBlue="\033[1;34m"        # Blue
export BPurple="\033[1;35m"      # Purple
export BCyan="\033[1;36m"        # Cyan
export BWhite="\033[1;37m"       # White

# Underline
export UBlack="\033[4;30m"       # Black
export URed="\033[4;31m"         # Red
export UGreen="\033[4;32m"       # Green
export UYellow="\033[4;33m"      # Yellow
export UBlue="\033[4;34m"        # Blue
export UPurple="\033[4;35m"      # Purple
export UCyan="\033[4;36m"        # Cyan
export UWhite="\033[4;37m"       # White

# Background
export On_Black="\033[40m"       # Black
export On_Red="\033[41m"         # Red
export On_Green="\033[42m"       # Green
export On_Yellow="\033[43m"      # Yellow
export On_Blue="\033[44m"        # Blue
export On_Purple="\033[45m"      # Purple
export On_Cyan="\033[46m"        # Cyan
export On_White="\033[47m"       # White

# High Intensty
export IBlack="\033[0;90m"       # Black
export IRed="\033[0;91m"         # Red
export IGreen="\033[0;92m"       # Green
export IYellow="\033[0;93m"      # Yellow
export IBlue="\033[0;94m"        # Blue
export IPurple="\033[0;95m"      # Purple
export ICyan="\033[0;96m"        # Cyan
export IWhite="\033[0;97m"       # White

# Bold High Intensty
export BIBlack="\033[1;90m"      # Black
export BIRed="\033[1;91m"        # Red
export BIGreen="\033[1;92m"      # Green
export BIYellow="\033[1;93m"     # Yellow
export BIBlue="\033[1;94m"       # Blue
export BIPurple="\033[1;95m"     # Purple
export BICyan="\033[1;96m"       # Cyan
export BIWhite="\033[1;97m"      # White

# High Intensty backgrounds
export On_IBlack="\033[0;100m"   # Black
export On_IRed="\033[0;101m"     # Red
export On_IGreen="\033[0;102m"   # Green
export On_IYellow="\033[0;103m"  # Yellow
export On_IBlue="\033[0;104m"    # Blue
export On_IPurple="\033[10;95m"  # Purple
export On_ICyan="\033[0;106m"    # Cyan
export On_IWhite="\033[0;107m"   # White

# =============================================================


declare NEOVIM_REMOTE="https://github.com/Dominic-github/nvim-lua.git" 
declare ARCHINSTALL="sudo pacman -S --noconfirm "
declare YAYINSTALL="yay -S --noconfirm "
declare GOINSTALL="go install "
declare NPMINSTALL="sudo npm install -g"
declare ARGS_INSTALL_DEPENDENCIES=1
declare INTERACTIVE_MODE=1


# =============================================================

function main(){

	print_logo
  
	print_LICENSE

  detect_platform

  check_neovim_min_version


  ConfigContainer

  plugin

  print_enjoy

  #Done!!!!!
  # remove git clone 
  rm -rf ~/.dominic-nvim

}


# =============================================================


# $1 is text, "" if you dont want show text
# $2 is time delay , default is 5s
# using ex: SETTIMEOUT "abc" 2s
# using ex: SETTIMEOUT "" 2s
# using ex: SETTIMEOUT "asdasd" 

function SETTIMEOUT(){

	DefaultTime=5s

	if ! [ -z $2 ] ;then
		DefaultTime=$2
	fi
    
	if ! [ -z "$1" ] ;then
		msg "$1"
	fi
	timeout $DefaultTime bash <<EOT
	sleep 10


EOT
}


function msg() {

  local text="$1"
  local div_width="80"
  echo -e ${BPurple}$(printf "%${div_width}s\n" ' ' | tr ' ' -) ${Color_Off}
  echo -e ${BYellow}"[!] $(printf "%s\n" "$text")" ${Color_Off}
}

function checkGit(){
	echo -e ${BBlue}"\n[*] Installing Git ... \n" ${Color_Off}
	if ! [ $(which git) ]; then 
		$RECOMMEND_INSTALL git
	else
		SETTIMEOUT "" 1s
		echo -e ${BGreen}"[*] Git is successfully Installed.\n" ${Color_Off}
	fi

}


function detect_platform() {
  OS="$(uname -s)"
  case "$OS" in
    Linux)
      if [ -f "/etc/arch-release" ] || [ -f "/etc/artix-release" ]; then
        RECOMMEND_INSTALL="sudo pacman -S --noconfirm "
      elif [ -f "/etc/fedora-release" ] || [ -f "/etc/redhat-release" ]; then
        RECOMMEND_INSTALL="sudo dnf install -y"
      elif [ -f "/etc/gentoo-release" ]; then
        RECOMMEND_INSTALL="emerge -tv"
      else # assume debian based
        RECOMMEND_INSTALL="sudo apt install -y"
      fi
      ;;
    FreeBSD)
      RECOMMEND_INSTALL="sudo pkg install -y"
      ;;
    NetBSD)
      RECOMMEND_INSTALL="sudo pkgin install"
      ;;
    OpenBSD)
      RECOMMEND_INSTALL="doas pkg_add"
      ;;
    Darwin)
      RECOMMEND_INSTALL="brew install"
      ;;
    *)
	      echo -e ${BRed}"[!] Failed to install. OS $OS is not currently supported.\n" ${Color_Off}
      exit 1
      ;;
  esac
}




function check_neovim_min_version() {
  local verify_version_cmd='if !has("nvim-0.9") | cquit | else | quit | endif'
  
  if ! command -v nvim &>/dev/null; then
	  echo -e ${BYellow}"[!] Please install it first and re-run the installer. Try: $RECOMMEND_INSTALL neovim" ${Color_Off}
	exit 1

  	# exit with an error if min_version not found
  	if ! nvim --headless -u NONE -c "$verify_version_cmd"; then
    	echo -e  ${BYellow}"[!]: My Config requires at least Neovim v0.9 or higher" ${Color_Off}
   	 	exit 1
  	fi

  fi

}


function ConfigContainer(){
	if [ "$ARGS_INSTALL_DEPENDENCIES" -eq 1 ]; then
    	if [ "$INTERACTIVE_MODE" -eq 1 ]; then
      		if confirm "Would you like to REMOVE current nvim config file"; then
            removeCurentNeovim
            install
          else
            echo -e  ${BBlue}"[*] We will to change name nvim = nvim(old-config) on $HOME/.config" ${Color_Off}
            moveNameFile
            removeCache
            install
      		fi
      fi
  fi
}

function moveNameFile(){

	if [ -d $HOME/config/nvim ] ;then
		echo -e ${BBlue}"[*] Move nvim => nvim(old-config)...\n" ${Color_Off}

	 	mv $HOME/.config/nvim $HOME/.config/"nvim(old-config)"
		rm -rf $HOME/.config/nvim

		if [ -d $HOME/.config/"nvim(old-config)" ];then
			SETTIMEOUT "" 1s
			echo -e ${BGreen}"[*] Moving is successfully.\n" ${Color_Off}
 		else
			SETTIMEOUT "" 1s
			echo -e ${BRed}"[!] Failed to Moving. $HOME/.config/nvim(old-config) is exist \n" ${Color_Off}
			exit 1
		fi
	fi
}


function removeCurentNeovim(){
	if  [ -d  $HOME/.config/nvim ] ;then
		echo -e ${BBlue}"[*] Removing old nvim config files.\n" ${Color_Off}

		rm -rf $HOME/.config/nvim
		removeCache

		if ! [ -d $HOME/.config/nvim ];then
			SETTIMEOUT "" 1s
			echo -e ${BGreen}"[*] Removing is successfully.\n" ${Color_Off}
		else
			SETTIMEOUT "" 1s
			echo -e ${BRed}"[!] Failed to Removing.\n" ${Color_Off}
			exit 1
		fi
	fi
}


function removeCache(){
		echo -e ${BBlue}"[*] Removing cache nvim files.\n" ${Color_Off}
		rm -rf $HOME/.local/share/nvim
		rm -rf $HOME/.cache/nvim
		echo -e ${BGreen}"[*] Removing Cache is successfully.\n" ${Color_Off}
}


function install(){

  checkGit

	echo -e ${BBlue}"\n[*] Installing neovim-config...\n" ${Color_Off}
	SETTIMEOUT "" 1s

	if ! [ -d $HOME/.dominic-nvim ] ;then
		git clone $NEOVIM_REMOTE $HOME/.dominic-nvim --depth 1

		if [ -d $HOME/.dominic-nvim ];then
			SETTIMEOUT "" 1s
			echo -e ${BGreen}"[*] $HOME/.dominic-nvim is successfully Installed.\n" ${Color_Off}
		else
			echo -e ${BRed}"[!] Failed to install.\n" ${Color_Off}
			SETTIMEOUT "" 1s
			exit 1
		fi
	else
		echo -e ${BRed}"[!] Failed to clone repository. '~/.dominic-nvim' folder already exists.\n" ${Color_Off} 
		SETTIMEOUT "" 1s
		exit 1

	fi

  # Install Nvchad
	echo -e ${BBlue}"\n[*] Installing Nvchad...\n" ${Color_Off}
  git clone https://github.com/NvChad/NvChad ~/.config/nvim --depth 1 
	echo -e ${BGreen}"[*] Nvchad is successfully.\n" ${Color_Off}

}




function moveConfig(){
  
	echo -e ${BBlue}"\n[*] Move custom file...\n" ${Color_Off}
  # remove custom 
  rm -rf ~/.config/nvim/lua/custom/
  # copy custom
  cp -a ~/.dominic-nvim/custom ~/.config/nvim/lua/
	echo -e ${BGreen}"[*] Move custom is successfully.\n" ${Color_Off}

}


function plugin (){

  # Lazygit
echo -e ${BBlue}"\n[*] Installing Lazygit ...\n" ${Color_Off}
  git clone https://github.com/NvChad/NvChad ~/.config/nvim --depth 1 
  $RECOMMEND_INSTALL lazygit
echo -e ${BGreen}"[*] Lazygit is successfully.\n" ${Color_Off}

  # Copy paste 
echo -e ${BBlue}"\n[*] Installing Xclip ...\n" ${Color_Off}
  $RECOMMEND_INSTALL xclip
echo -e ${BGreen}"[*] Xclipis successfully.\n" ${Color_Off}

  # fix Error Pip
  if [ -f /usr/lib/python3.11/EXTERNALLY-MANAGED ]; then
    sudo rm -rf /usr/lib/python3.11/EXTERNALLY-MANAGED
  fi
}


function confirm() {

  local question="$1"
  while true; do
    msg "$question"
	SETTIMEOUT "Please read carefully before answering. You have 5 seconds"
    read -p "[y]es or [N]o (default: no) : " -r answer
    case "$answer" in
      y | Y | yes | YES | Yes)
        return 0
        ;;
      n | N | no | NO | No | *[[:blank:]]* | "")
        return 1
        ;;
      *)
         echo -e ${BYellow}"Please answer [y]es or [n]o.\n" ${Color_Off}

        ;;
    esac
  done

  echo $answer
}



function print_logo() {

	echo -e ${BPurple}"
	$(cat <<'EOF'

                        _           
  _ __   ___  _____   _(_)_ __ ___  
 | '_ \ / _ \/ _ \ \ / / | '_ ` _ \ 
 | | | |  __/ (_) \ V /| | | | | | |
 |_| |_|\___|\___/ \_/ |_|_| |_| |_|

                                                                       
# author: Dominic-github
# github: https://github.com/Dominic-github
# repo: https://github.com/Dominic-github/nvim-lua

EOF

)" ${Color_Off}

SETTIMEOUT "" 2s

}

function print_LICENSE(){

	SETTIMEOUT "MIT License

Copyright (c) 2023 Tan Hoang

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the 'Software'), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED 'AS IS', WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.

" 

}

function print_enjoy(){

	echo -e ${Green}"
	$(cat <<'EOF'
	
  _____ _   _     _  _____   __
 | ____| \ | |   | |/ _ \ \ / /
 |  _| |  \| |_  | | | | \ V / 
 | |___| |\  | |_| | |_| || |  
 |_____|_| \_|\___/ \___/ |_|  

                               
# author: Dominic-github
# github: https://github.com/Dominic-github


You need to run nvim to install plugin !!!

EOF

)" ${Color_Off}



}
# Run main function

main "$@"



