# Set CLICOLOR if you want Ansi Colors in iTerm2
export CLICOLOR=1

# Set colors to match iTerm2 Terminal Colors
export TERM=xterm-256color;

# Colorful ls
alias ls='ls -GFh';

#wpcli
source ~/.bash/wp-cli/utils/wp-completion.bash

# Default editor
export EDITOR=vim;

# Git Aware!
export GITAWAREPROMPT=~/.bash/git-aware-prompt;
source $GITAWAREPROMPT/main.sh;
export PS1="\n\${debian_chroot:+(\$debian_chroot)}\[\033[01;32m\]\[\033[00m\]\[\033[01;34m\]\w\[\033[00m\]\[$txtpur\]\$git_branch\[$txtred\]\$git_dirty\[$txtrst\] > ";
export PS1="\n\[$txtpur\]\w \[$txtcyn\]\$git_branch\[$txtred\]\$git_dirty\[$txtrst\]\n$ ";

# $PATH
export PATH="/usr/local/bin:$PATH"
export PATH="/usr/local/sbin:$PATH"
export PATH="/Applications/XAMPP/xamppfiles":$PATH;
export PATH="/Applications/XAMPP/bin":$PATH;
export PATH="/Applications/XAMPP/xamppfiles/bin":$PATH;
export PATH="/Applications/XAMPP/xamppfiles/sbin":$PATH;

###
 # Flushes DNS Cache
 # E.g.: dns-flush
 ##
function dns-flush {
	sudo dscacheutil -flushcache;sudo killall -HUP mDNSResponder
}

###
 # Create a native app from a website.
 # E.g.: native "HipChat" "http://hipchat.com"
 ##
function native {
	nativefier --app-name "$1" "$2"
}

###
 # An easier way to get to a .dev project
 # E.g.: goto clp, goto flexi
 #
 # #wds
 ##
function goto {
	cd ~/htdocs/$1.dev/wp-content
}

###
 # Applies a Trac ticket patch via a URL.
 # E.g: apply-patch http://...
 ##
function apply-patch {
	curl -k $1 | patch -p0
}

###
 # Wrapper for 'git commit -a'
 # E.g.: commit
 ##
function commit {
	git commit -a
}

###
 # Show 'git diff' in Sublime
 # E.g.: git-diff
 ##
function git-diff {
	git diff | subl -n -w
}

###
 # Launches CBT's Java applet.
 # E.g: cbt
 ##
function cbt {
	java -jar ~/.cbttunnel.jar -authkey ufce062ef90b417c
}

###
 # Copies the current Git branch.
 # E.g: copy-branch
 ##
function copy-branch {
	git branch|grep '*'|tr -d '* \n'|pbcopy
}
function cb {
	copy-branch
}

###
 # Edits Sublime Text Snippets
 # E.g: edit-snippets
 ##
function edit-snippets {
	subl "~/Library/Application Support/Sublime Text 3/Packages/User/Snippets"
}

###
 # Deletes a Git branch locally and remotely.
 # E.g.: delete-branch my-branch
 ##
function delete-branch {
	git branch -D $1 && git push origin :$1
}

###
 # Deploys a WordPress plugin to SVN
 # E.g: deploy plugin_file_with_header.php aubreypwd false
 ##
function deploy {
	wget https://raw.githubusercontent.com/aubreypwd/deploy-git-wordpress-org/master/deploy-git-wordpress-org.sh && sh deploy-git-wordpress-org.sh $1 $2 $3
	rm deploy-git-wordpress-org.sh
}

###
 # Edit's this file.
 # E.g: edit-bash
 ##
function edit-bash {
	subl ~/.bash_profile
}

###
 # Edits the /etc/hosts file.
 # E.g: edit-hosts
 ##
function edit-hosts {
	sudo subl /etc/hosts
}

###
 # Edits XAMPP files.
 # E.g: edit-xampp
 ##
function edit-xampp {
	subl /Applications/XAMPP/xamppfiles/
}

###
 # Gifify's a .mov file and uploads it to CloudUp
 # E.g: gifup myfile.mov (Creates myfile.gif)
 ##
function gif-up {
	gifify $1 && up $1.gif
}

###
 # Puts this branch into another branch.
 # E.g: git-put this-branch master
 ##
function git-put {
	git-patch-quick $2
	git checkout $2 && git merge $1
}

###
 # Show simple one-liner log
 # E.g.: git-log-simple
 ##
function git-log-simple {
	git log -n 30 --reverse --oneline
}

###
 # Puts this branch into another and comes back.
 # E.g.: git-put-back this-branch master
 ##
function git-put-back {
	git-patch-quick $2
	git-put $1 $2
	push
	git checkout $1
}

###
 # Pushes the current branch.
 # E.g.: git-push
 ##
function git-push {
	git push origin $(git branch|grep '*'|tr -d '* \n')
}
function push {
	git-push
}

###
 # Add all files over X MB into .gitignore
 # E.g: git-ignore 20 (Ignores files over 20MB).
 ##
function git-ignore {
	mb="`$1M`" && find . -size +mb | cat >> .gitignore
}

###
 # Fancy Git Log
 # E.g: git-log
 ##
function git-log {
	git log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit
}

###
 # Creates a patch using Git
 # E.g: git-patch file.diff (Creates a patch as file.diff)
 ##
function git-patch {
	git diff $1... --no-prefix > $2
	up $2
}

###
 # Quick patch
 # E.g.: git-patch-quick branch
 ##
function git-patch-quick {
	current_time=$(date "+%Y-%m-%d-%H-%M-%S")
	git-log-simple
	git-patch $1 ~/Downloads/$current_time.diff
}

###
 # Updates this branch with the latest of another.
 # E.g: git-update my-branch master (Updates my-branch with latest of master)
 ##
function git-update {
	git-patch-quick $2
	git checkout $2 && git pull origin $2 && git checkout $1 && git merge $2
}

###
 # Pulls down the current branch.
 # E.g.: git-pull | pull
 ##
function git-pull {
	git pull origin $(git branch|grep '*'|tr -d '* \n')
}

function pull {
	git-pull
}

###
 # Quick wrapper for "grunt styles"
 # E.g: gs
 ##
function gs {
	grunt styles
}

###
 # Quick wrapper for "grunt styles && grunt watch"
 # E.g: gsgw
 ##
function gsgw {
	grunt styles && grunt watch
}

###
 # Quick wrapper for "npm install && bower install"
 # E.g: install
 ##
function install {
	npm install && bower install
}

###
 # Re-sources this bash file.
 # E.g: reload-bash
 ##
function reload-bash {
	source ~/.bash_profile
}

###
 # Quick wrapper for "sudo xampp restart"
 # E.g: xamppr
 ##
function xamppr {
	sudo xampp restart
}

###
 # Pulls files to destination.
 # E.g: rsync-down username@domain:/var/www/ /var/www
 ##
function rsync-down {
	rsync -az --progress -e ssh $1 $2
}

###
 # Sends files up to location.
 # E.g: rsync-up /var/www/ username@domain:/var/www/
 ##
function rsync-up {
	rsync -avz --progress $1 -e ssh $2
}

###
 # Quick wrapper for "sudo xampp start"
 # E.g: xamppup
 ##
function xamppup {
	sudo xampp start
}

###
 # Quick wrapper for "git submodule init && git submodule update"
 # E.g: submodules
 ##
function submodules {
	git submodule init && git submodule update
}
