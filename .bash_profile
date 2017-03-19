# Git branch in prompt.
# Setting GIT prompt
export MONO_GAC_PREFIX="/usr/local"

c_cyan=`tput setaf 6`
c_red=`tput setaf 1`
c_green=`tput setaf 2`
c_sgr0=`tput sgr0`

branch_color ()
{
    if git rev-parse --git-dir >/dev/null 2>&1
    then
        color=""
        if git diff --quiet 2>/dev/null >&2 
        then
            color=${c_green}
        else
            color=${c_red}
        fi
    else
        return 0
    fi
    echo -n $color
}

parse_git_branch ()
{
    if git rev-parse --git-dir >/dev/null 2>&1
    then
        gitver="["$(git branch 2>/dev/null| sed -n '/^\*/s/^\* //p')"]"
    else
        return 0
    fi
echo -e $gitver
}

#It's important to escape colors with \[ to indicate the length is 0
PS1='\u@\W\[${c_sgr0}\]\[\[$(branch_color)\] $(parse_git_branch)\[${c_sgr0}\]: '
export NODE_PATH="/usr/local/lib/node"
  if [ -f $(brew --prefix)/etc/bash_completion ]; then
    . $(brew --prefix)/etc/bash_completion
  fi

# Your previous /Users/ryanhollister/.bash_profile file was backed up as /Users/ryanhollister/.bash_profile.macports-saved_2013-04-10_at_10:28:30
##

# MacPorts Installer addition on 2013-04-10_at_10:28:30: adding an appropriate PATH variable for use with MacPorts.
export PATH=/opt/local/bin:/opt/local/sbin:$PATH
# Finished adapting your PATH environment variable for use with MacPorts.
source ~/.profile
if [ -f $(brew --prefix)/etc/bash_completion ]; then
	  . $(brew --prefix)/etc/bash_completion
fi
case $- in
   *i*) source ~/.bashrc
esac
export NVM_DIR="$HOME/.nvm"
. "/usr/local/opt/nvm/nvm.sh"
