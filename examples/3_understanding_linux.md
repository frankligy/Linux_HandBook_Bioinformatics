# Understanding Linux

Linux is a system, shell is the environment that allows us to write codes and communicate with the system, there are a lot of shell environment out there, to access:

```
cd /etc/shells

# List of acceptable shells for chpass(1).
# Ftpd will not allow users to connect who are not using
# one of these shells.

/bin/bash
/bin/csh
/bin/ksh
/bin/sh
/bin/tcsh
/bin/zsh
```

To access the root directory:
```
cd /
```

To access the host directory:
```
cd ~
```

### Configurtion:

change the theme: open ~/.bash_profile(get executed when you are logged in) or ~/.bashrc(everytime you open a new terminmal window, you should modify ~/.bash_rc on cluster, mac should modify ~/.bash_profile)


To change the theme of the prompt, put the following to the abovementioned file:

```
export PS1='\[\033[1;34m\]\$\[\033[0m\] '​
export CLICOLOR=1​
export LSCOLORS=GxFxCxDxBxegedabagaced
```

Set alias:

```
alias l="ls -al"   # no spaces are allowed
```

Adding path:

```
export PATH=/data/home/mjchen/app/package:$PATH   
# this is also how to make a permenant variable
```

Standard output and error:

```
echo 'test' 1>file.log 2>&1
# meaning direct stdout (1) to file.log and append stderr (2) to stdout(1)
```

Check Linux core:

```
Singularity altanalyze:/> cat /etc/os-release
PRETTY_NAME="Debian GNU/Linux 10 (buster)"
NAME="Debian GNU/Linux"
VERSION_ID="10"
VERSION="10 (buster)"
VERSION_CODENAME=buster
ID=debian
HOME_URL="https://www.debian.org/"
SUPPORT_URL="https://www.debian.org/support"
BUG_REPORT_URL="https://bugs.debian.org/"
```

