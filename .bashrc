# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color|*-256color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# We have color support; assume it's compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
	color_prompt=yes
    else
	color_prompt=
    fi
fi

if [ "$color_prompt" = yes ]; then
    PS1='${debian_chroot:+($debian_chroot)}\[\033[00;32m\]\u\[\033[01;37m\]@\[\033[01;31m\]\h\[\033[00m\]:\[\033[0;33m\]\W\[\033[00m\]\$ '
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\W\$ '
fi
#unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# colored GCC warnings and errors
#export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'
export LS_COLORS='di=1;31:fi=36:ln=31;4:pi=5:so=5:bd=5:cd=5:or=31:mi=31;4;41:ex=35:*.tgz=95:*.zip=95'

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

alias clc='clear'
alias gpu_load='sudo modprobe amdgpu dpm=1'
alias powerconf='sudo ~/power.sh'
alias sourcebash='source ~/.bashrc'
alias swapscreen='xrandr  --output HDMI-1 --auto --left-of eDP-1'
alias setgamma='xrandr --output eDP-1 --gamma 2:2:2'

#ROS
export EDITOR='vim'
source /opt/ros/kinetic/setup.bash
alias sd='source devel/setup.bash'
export ROS_IP=`hostname -I`
export LD_LIBRARY_PATH=/usr/local/cuda-8.0/lib64:$LD_LIBRARY_PATH
export PATH=/usr/local/cuda-8.0/bin:$PATH
export GIT=/home/ev/git

#Pleiadesis
export TX1_ver=28
export TX1_user=ubuntu
export TX1_IP=85.229.255.159
alias kload='sshpass -p "$TX1_user" scp $TX1_SOURCEDIR/Pleiades_L4T.tgz $TX1_user@$TX1_IP:/home/$TX1_user/Kernels/'
alias connectTX1='sshpass -p "$TX1_user" ssh -Y $TX1_IP -l $TX1_user -o ServerAliveInterval=30'
alias mountTX1='sshfs $TX1_user@$TX1_IP:/home/$TX1_user/ /home/ev/mount'

if [ "$TX1_ver" = 24 ]; then
	export CROSS_COMPILE=/opt/linaro/gcc-linaro-5.4.1-2017.01-x86_64_aarch64-linux-gnu/bin/aarch64-linux-gnu-
	export CROSS32CC=/opt/linaro/gcc-linaro-5.4.1-2017.01-x86_64_arm-linux-gnueabihf/bin/arm-linux-gnueabihf-gcc
	export TX1_DEVDIR=/home/ev/Pleadesis/jetpack
	export TX1_SOURCEDIR=$TX1_DEVDIR/64_TX1/Linux_for_Tegra_64_tx1/sources/kernel_source/
	export TX1_ARCH=arm64
	export ARCH=arm64
	export TX1_CROSS_COMPILE=/opt/linaro/gcc-linaro-5.4.1-2017.01-x86_64_aarch64-linux-gnu/bin/aarch64-linux-gnu-
	export TX1_CROSS32CC=/opt/linaro/gcc-linaro-5.4.1-2017.01-x86_64_arm-linux-gnueabihf/bin/arm-linux-gnueabihf-gcc
	export TX1_KERNEL_MODULES_OUT=/home/ev/Pleadesis/jetpack/images/modules
	export TX1_KERNEL_MODULES_NAME=3.10.96+
	export dax_code='/home/ev/Pleadesis/jetpack/64_TX1/Linux_for_Tegra_64_tx1/sources/kernel_source/drivers/media/i2c'
	export dax_dtsi='/home/ev/Pleadesis/jetpack/64_TX1/Linux_for_Tegra_64_tx1/sources/kernel_source/arch/arm64/boot/dts/tegra210-platforms/'
else
	export TX1_DEVDIR=/home/ev/Pleadesis/jetpack_3.1
	export TX1_ARCH=arm64
	export ARCH=arm64
	export TX1_SOURCEDIR=/home/ev/Pleadesis/jetpack_3.1/64_TX1/Linux_for_Tegra_64_tx1/sources/kernel/kernel-4.4
	export TX1_KERNEL_MODULES=/home/ev/Pleadesis/jetpack_3.1/images/
	export TX1_KERNEL_MODULES_OUT=/home/ev/Pleadesis/jetpack_3.1/images/modules
	export TX1_KERNEL_DTBS=/home/ev/Pleadesis/jetpack_3.1/images/packages/dtb
	export TX1_KERNEL_ZIMAGE=/home/ev/Pleadesis/jetpack_3.1/images/packages
	export TX1_KERNEL_MODULES_VER=4.4.38+
	export export CROSS_COMPILE=/home/ev/Pleadesis/jetpack_3.1/toolchain/install/bin/aarch64-unknown-linux-gnu-
	export camera_dtsi='/home/ev/Pleadesis/jetpack_3.1/64_TX1/Linux_for_Tegra_64_tx1/sources/kernel/kernel-4.4/hardware/nvidia/platform/t210/jetson/kernel-dts/jetson-platforms'
	export camera_code='/home/ev/Pleadesis/jetpack_3.1/64_TX1/Linux_for_Tegra_64_tx1/sources/kernel/kernel-4.4/drivers/media/i2c'
fi
