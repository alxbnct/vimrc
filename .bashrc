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
#force_color_prompt=yes

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
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt

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


alias inks='python ~/.vim/inkscape-shortcut-manager/main.py'
#export PATH="/home/moshes-abraham/anaconda3/bin:$PATH"

[ -f ~/.fzf.bash ] && source ~/.fzf.bash


alias gui='sudo cp /etc/default/grub-gui /etc/default/grub && sudo update-grub && sudo systemctl set-default graphical.target'
alias text='sudo cp /etc/default/grub-text /etc/default/grub && sudo update-grub && sudo systemctl set-default multi-user.target'
alias se='select-editor'
alias gdb3='/usr/local/bin/gdb'
alias gdb='/usr/bin/gdb-8.2'
alias cip='sudo ifconfig ens33 192.168.88.129'
alias mkdir='mkdir -pv'
alias df='df -h'
alias du='du -sh'
alias last='last -a'
alias free='free -m'
alias cdd='cd ..'
alias cd..='cd ..'
alias ...='cd ../../'
alias ....='cd ../../../'
alias .....='cd ../../../../'
alias cds='echo "`pwd`" > /tmp/.cdsave'	# cd save: save where I am
alias cdb='cd "`cat /tmp/.cdsave`"'	# cd back
alias gu='sh ~/github.com/Moshes-Abraham/shell/gbk2utf-8'
alias ug='iconv -f utf-8 -t gbk'
alias wl='wc -l'
alias clc='clear'
alias lx='ls -lhBX --color=auto'
alias lz='ls -lhrS --color=auto'
alias lt='ls -lhrt --color=auto'
alias lsd='find . -maxdepth 1 -type d | sort' # list all directories
alias dfind='find -type d -name' # find directory
alias ffind='find -type f -name' # find file


alias confgcc="sudo update-alternatives --config gcc"
alias file='thunar'
alias ws='cd /mnt/hgfs/LinuxShare/Sync'
alias vcf='sh ~/github.com/Moshes-Abraham/shell/vimconf'
alias cp='cp -i'
alias rm='trash'
alias finder='nautilus --no-desktop' # open ubuntu file manager
alias strb='tree ~/.local/share/Trash'
#alias emp='\rm -rf ~/.local/share/Trash'
alias emp='\rm -rf ~/.local/share/Trash/files/ ; \rm -rf ~/.local/share/Trash/info/'
alias vpic='cacaview'
# eog is for viewing a figure, use it as below
# eog example.jpg
alias calc="libreoffice --calc"
alias cv="vim -N -u NONE"
alias cnv="nvim -N -u NONE"
#alias cp="rsync --archive --human-readable --progress --verbose --whole-file"
#alias scp="rsync --archive --checksum --compress --human-readable --itemize-changes --rsh=ssh --stats --verbose"
alias draw="libreoffice --draw"
alias duh="du -h -d 0 [^.]*"
#alias em="neomutt"
alias grep="grep --color=always"
#alias htop="sudo htop"
#alias i="irssi"
alias impress="libreoffice --impress"
alias l="ls -al"
alias ls='ls --color=auto'
#alias m="vimpc"
#alias myip="curl http://myip.dnsomatic.com && echo ''"
#alias n="nnn"
alias open="xdg-open"
#alias pandoc="pandoc --pdf-engine=lualatex -H $HOME/.config/pandoc/fonts.tex"
#alias pretty-json="python2 -mjson.tool"
#alias print="lpr -P 'Deskjet_F4500'"
# alias screencast="ffmpeg -f alsa -ac 2 -i loopout -f alsa -ac 2 -i hw:2,0 -filter_complex amix=inputs=2:duration=first -f x11grab -r 30 -s 1920x1080 -i :0.0 -acodec aac -vcodec libx264 -crf 0 -preset medium output.mp4"
#alias screencast="ffmpeg -f alsa -ac 2 -i hw:1,0 -f x11grab -r 30 -s 1920x1080 -i :0.0 -acodec pcm_s16le -vcodec libx264 -preset ultrafast -crf 0 -y screencast.mkv"
alias screencast-no-sound="ffmpeg -f x11grab -r 30 -s 1920x1080 -i :0.0 -vcodec libx264 -preset ultrafast -crf 0 -y screencast.mkv"
#alias slideshow="pandoc --pdf-engine=lualatex -H $HOME/.config/pandoc/fonts.tex -t beamer -o slideshow.pdf"
#alias syms="find . -maxdepth 1 -type l -print | while read line; do ls -alc "\$line"; done"
#alias tran="transmission-remote-cli"
#alias usermount="sudo mount -o gid=users,fmask=113,dmask=002"
#alias vb="VBoxManage"
#alias webcam="mplayer -noborder -tv driver=v4l2:gain=1:width=320:height=240:device=/dev/video0:fps=10:outfmt=rgb16 -geometry 100%:97% tv://"
#alias webcast-external="ffmpeg -f alsa -ac 2 -i hw:1,0 -f v4l2 -itsoffset 1 -s 640x480 -i /dev/video0 -acodec pcm_s16le -vcodec libx264 -y output.mkv"
#alias webcast-internal="ffmpeg -f alsa -ac 2 -i hw:0,0 -f v4l2 -itsoffset 1 -s 640x480 -i /dev/video0 -acodec pcm_s16le -vcodec libx264 -y output.mkv"
#alias wifi="sudo wifi-menu -o"
alias writer="libreoffice --writer"

alias wiki='wine /mnt/hgfs/KWIKI/kiwix.exe'
alias cmaple='wine /mnt/hgfs/MAPLE14/bin.X86_64_WINDOWS/cmaple.exe'
alias maple='wine /mnt/hgfs/MAPLE14/bin.X86_64_WINDOWS/maplew.exe'
alias dicte='dict -d gcide'
alias dictec='dict -d langdao-ec'
# dconf write /org/compiz/profiles/unity/plugins/core/hsize 4
alias hws='dconf write /org/compiz/profiles/unity/plugins/core/hsize'
alias vws='dconf write /org/compiz/profiles/unity/plugins/core/vsize'
alias loff='libreoffice'
alias qtcreator='sh ~/Qt5.13.0/Tools/QtCreator/bin/qtcreator.sh'
alias dev-matlab-horizontal='sh ~/.vim/shell/dev-tmux-matlab-horizontal'
alias matlab-2016='/usr/local/MATLAB/R2016b/bin/matlab -nodesktop -nosplash'
alias dev-matlab='sh ~/.vim/shell/dev-tmux-matlab'
alias smatlab='screen -S matlab -m sh -c "/usr/local/MATLAB/R2012b/bin/matlab -nodesktop -nosplash"'
alias dev-tmux='sh ~/.vim/shell/dev-tmux'
alias rg='ranger'
alias sk='sh ~/.vim/shell/ksw.sh'
alias nvm='nvim'
alias emacs='emacs25'
alias emc='emacs25 -nw'
alias cl='colorls --group-directories-firs'
alias cll='colorls -l'
alias cla='colorls -a'
alias clla='colorls -lA --sd --group-directories-firs'
alias dmatlab='sudo /usr/local/MATLAB/R2012b/bin/matlab'
alias matlab='/usr/local/MATLAB/R2012b/bin/matlab -nodesktop -nosplash'
alias inks='python ~/.vim/inkscape-shortcut-manager/main.py'
#alias sce='sh ~/.vim/shell/swapC2E.sh'
#export PATH="/home/moshes-abraham/anaconda3/bin:$PATH"
export PATH="/home/moshes-abraham/.vim/inkscape-shortcut-manager:$PATH"
export PATH="/home/moshes-abraham/.vim/shell:$PATH"
export GOPATH="/mnt/hgfs/LinuxShare/github.com/go"
export GOBIN=$GOPATH/bin
export PATH=$PATH:${GOPATH//://bin:}/bin
sh ~/.vim/shell/swapC2E.sh
[[ -s /home/moshes-abraham/.autojump/etc/profile.d/autojump.sh ]] && source /home/moshes-abraham/.autojump/etc/profile.d/autojump.sh
export LD_LIBRARY_PATH=/usr/local/gcc-7.4/lib64:/opt/intel/debugger_2019/libipt/intel64/lib:$LD_LIBRARY_PATH
export PATH=/usr/local/cgdb-0.6.8/bin:/home/emc/joe/bin:/opt/intel/bin:$PATH

