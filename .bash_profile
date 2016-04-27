# Set CLICOLOR if function you want Ansi Colors in iTerm2
export CLICOLOR=1

# Set colors to match iTerm2 Terminal Colors
export TERM=xterm-256color;

# Colorful ls
alias ls='ls -GFh';

#wpcli
source ~/dotfiles/bash/wp-cli/utils/wp-completion.bash

# Default editor
export EDITOR=vim;

# Git Aware!
export GITAWAREPROMPT=~/dotfiles/bash/git-aware-prompt;
source $GITAWAREPROMPT/main.sh;
export PS1="\n\${debian_chroot:+(\$debian_chroot)}\[\033[01;32m\]\[\033[00m\]\[\033[01;34m\]\w\[\033[00m\]\[$txtpur\]\$git_branch\[$txtred\]\$git_dirty\[$txtrst\] > ";
export PS1="\n\[$txtpur\]\w \[$txtcyn\]\$git_branch\[$txtred\]\$git_dirty\[$txtrst\]\n$ ";

# $PATH
export PATH="/usr/local/bin:$PATH";
export PATH="/usr/local/sbin:$PATH";
export PATH="/Applications/XAMPP/xamppfiles":$PATH;
export PATH="/Applications/XAMPP/bin":$PATH;
export PATH="/Applications/XAMPP/xamppfiles/bin":$PATH;
export PATH="/Applications/XAMPP/xamppfiles/sbin":$PATH;

###
 # Opens a new Safari instance.
 #
 # @since 4/5/16
 ##
function safari {
	open -n -a Safari
}

###
 # Flushes DNS Cache
 # E.g.: dns-flush
 #
 # @since 4/5/16
 ##
function dns-flush {
	sudo dscacheutil -flushcache;sudo killall -HUP mDNSResponder
}

###
 # Add Class to Yo Plugin base.
 #
 # @since 4/5/16
 ##
function plugin-wp {
	yo plugin-wp:$1 $2
}

###
 # Yo Commands.
 #
 # @since 4/5/16
 ##
function yo-help {
	echo "yo include include-name"
	echo "yo cpt cpt-name"
	echo "yo taxonomy taxonomy-name"
	echo "yo options options-name"
	echo "yo widget widget-name"
	echo "yo pagebuilder class-name"
	echo "yo endpoint class-name"
	echo "yo js Javascript"
	echo "yo css Styles"
}

###
 # Sudo PHP
 # E.g.: sphp script.php arg1 arg2
 ##
function sphp {
	sudo php $1 $2 $3 $4 $5 $6 $7 $8 $9
}

###
 # Create a native app from a website.
 #
 # @since 4/5/16
 #
 # E.g.: native "HipChat" "http://hipchat.com"
 ##
function native {
	nativefier -n "$1" -o --insecure "$2"
}

###
 # An easier way to get to a .dev project
 #
 # E.g.: goto clp, goto flexi
 #
 # @since 4/5/16
 ##
function dev {
	cd ~/htdocs/$1.dev/
}

	###
	 # Wrapper for dev <project-name>
	 #
	 # @since 4/6/16
	 ##
	function htdocs {
		dev $1
	}

	###
	 # Wrapper for dev <project-name>
	 #
	 # @since 4/6/16
	 ##
	function docs {
		dev $1
	}

	###
	 # Wrapper for dev <project-name>
	 #
	 # @since 4/6/16
	 ##
	function goto {
		dev $1
	}

###
 # Open a Sublime Project.
 #
 # E.g.: proj clp
 #
 # @since 4/5/16
 ##
function proj {
	subl ~/Projects/$1.sublime-project
}

	###
	 # Wrapper for proj <project-name>
	 #
	 # @since 4/6/16
	 ##
	function project {
		proj $1
	}

###
 # Applies a Trac ticket patch via a URL.
 #
 # E.g: apply-patch http://...
 #
 # @since 4/5/16
 ##
function apply-patch {
	curl -k $1 | patch -p0
}

###
 # Wrapper for 'git commit -a'
 # E.g.: commit
 #
 # @since 4/5/16
 ##
function commit {
	git commit -a
}

###
 # Show 'git diff' in Sublime
 # E.g.: git-diff
 #
 # @since 4/5/16
 ##
function git-diff {
	git diff | subl -n -w
}

###
 # Copies the current Git branch.
 # E.g: copy-branch
 #
 # @since 4/5/16
 ##
function copy-branch {
	git branch|grep '*'|tr -d '* \n'|pbcopy
}

function cb {
	copy-branch
}

###
 # Launches CBT's Java applet.
 # E.g: cbt
 #
 # @since 4/5/16
 ##
function cbt {
	java -jar ~/.cbttunnel.jar -authkey ufce062ef90b417c
}

###
 # Deletes a Git branch locally and remotely.
 # E.g.: delete-branch my-branch
 #
 # @since 4/5/16
 ##
function delete-branch {
	git branch -D $1 && git push origin :$1
}

###
 # Edits Sublime Text Snippets
 # E.g: edit-snippets
 #
 # @since 4/5/16
 ##
function edit-snippets {
	subl "~/Library/Application Support/Sublime Text 3/Packages/User/Snippets"
}

###
 # Deploys a WordPress plugin to SVN
 # E.g: deploy plugin_file_with_header.php aubreypwd false
 #
 # @since 4/5/16
 ##
function deploy {
	wget https://raw.githubusercontent.com/aubreypwd/deploy-git-wordpress-org/master/deploy-git-wordpress-org.sh && sh deploy-git-wordpress-org.sh $1 $2 $3
	rm deploy-git-wordpress-org.sh
}

###
 # Edit's this file.
 # E.g: edit-bash
 #
 # @since 4/5/16
 ##
function edit-bash {
	subl ~/.bash_profile
}

###
 # Edits the /etc/hosts file.
 # E.g: edit-hosts
 #
 # @since 4/5/16
 ##
function edit-hosts {
	sudo subl /etc/hosts
}

###
 # Edits XAMPP files.
 # E.g: edit-xampp
 #
 # @since 4/5/16
 ##
function edit-xampp {
	subl /Applications/XAMPP/xamppfiles/
}

###
 # Gifify's a .mov file and uploads it to CloudUp
 # E.g: gifup myfile.mov (Creates myfile.gif)
 #
 # @since 4/5/16
 ##
function gif-up {
	gifify $1 && up $1.gif
}

###
 # Puts a branch into another branch.
 #
 # @since 4/5/16
 ##
function git-put-branch {
	git-patch-quick $2
	git checkout $2
	git merge $1
	pull
}

	###
	 # Put this branch into another.
	 #
	 # @since 4/6/16
	 ##
	function git-put {
		git-put-branch $(git branch|grep '*'|tr -d '* \n') $1
	}

		###
		 # Wrapper for git-put <branch-name>
		 #
		 # @since 4/6/16
		 ##
		function put {
			git-put $1
		}

###
 # Puts this branch into another and comes back.
 # E.g.: git-put-back this-branch master
 #
 # @since 4/5/16
 ##
function git-put-back {
	git-patch-quick $2
	git-put $1 $2
	push
	git checkout $1
}

###
 # Fancy Git Log
 # E.g: git-log
 #
 # @since 4/5/16
 ##
function git-log {
	git log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit
}

	###
	 # Wrapper for git-log
	 #
	 # @since 4/6/16
	 ##
	function log {
		git-log
	}

	###
	 # Show simple one-liner log
	 # E.g.: git-log-simple
	 #
	 # @since 4/5/16
	 ##
	function git-log-simple {
		git log -n 30 --reverse --oneline
	}

		###
		 # Wrapper for git-log-simple
		 #
		 # @since 4/6/16
		 ##
		function short-log {
			git-log-simple
		}

		###
		 # Wrapper for git-log-simple
		 #
		 # @since 4/6/16
		 ##
		function slog {
			git-log-simple
		}

###
 # Pushes the current branch.
 # E.g.: git-push
 #
 # @since 4/5/16
 ##
function git-push {
	git-pull
	git push origin $(git branch|grep '*'|tr -d '* \n')
}

	###
	 # Wrapper for git-push
	 #
	 # @since 4/5/16
	 ##
	function push {
		git-push
	}

###
 # Add all files over X MB into .gitignore
 # E.g: git-ignore 20 (Ignores files over 20MB).
 #
 # @since 4/5/16
 ##
function git-ignore {
	mb="`$1M`" && find . -size +mb | cat >> .gitignore
}

###
 # Creates a patch using Git
 # E.g: git-patch file.diff (Creates a patch as file.diff)
 #
 # @since 4/5/16
 ##
function git-patch {
	git diff $1... --no-prefix > $2
	up $2
}

###
 # Quick patch
 # E.g.: git-patch-quick branch
 #
 # @since 4/5/16
 ##
function git-patch-quick {
	current_time=$(date "+%Y-%m-%d-%H-%M-%S")
	git-patch $1 ~/Downloads/$current_time.diff
}

	###
	 # Wrapper for git-patch-quick
	 #
	 # @since 4/6/16
	 ##
	function gpatch {
		git-patch-quick $1
	}

###
 # Update this branch with another.
 #
 # @since 4/7/16
 ##
function git-update {
	git-update-branch $(git branch|grep '*'|tr -d '* \n') $1;
}


###
 # Updates this branch with the latest of another.
 # E.g: git-update my-branch master (Updates my-branch with latest of master)
 #
 # @since 4/5/16
 ##
function git-update-branch {
	git-patch-quick $2
	git checkout $2 && git pull origin $2 && git checkout $1 && git merge $2
}

###
 # Pulls down the current branch.
 # E.g.: git-pull | pull
 #
 # @since 4/5/16
 ##
function git-pull {
	git pull origin $(git branch|grep '*'|tr -d '* \n')
}

	###
	 # Wrapper for git-pull
	 #
	 # @since 4/5/16
	 ##
	function pull {
		git-pull
	}

###
 # Quick wrapper for "gulp styles"
 # E.g: gs
 #
 # @since 4/5/16
 ##
function gs {
	gulp stypes
}

###
 # Quick wrapper for "gulp styles && gulp watch"
 # E.g: gsgw
 #
 # @since 4/5/16
 ##
function gsgw {
	gulp styles && gulp watch
}

###
 # Quick wrapper for "npm install && bower install"
 # E.g: install
 #
 # @since 4/5/16
 ##
function install {
	npm install && bower install
}

###
 # Re-sources this bash file.
 # E.g: reload-bash
 #
 # @since 4/5/16
 ##
function reload-bash {
	source ~/.bash_profile
}

###
 # Quick wrapper for "sudo xampp restart"
 # E.g: xamppr
 #
 # @since 4/5/16
 ##
function restart-server {
	sudo xampp restart
}

###
 # Pulls files to destination.
 # E.g: rsync-down username@domain:/var/www/ /var/www
 #
 # @since 4/5/16
 ##
function rsync-down {
	rsync -az --progress -e ssh $1 $2
}

###
 # Sends files up to location.
 # E.g: rsync-up /var/www/ username@domain:/var/www/
 #
 # @since 4/5/16
 ##
function rsync-up {
	rsync -avz --progress $1 -e ssh $2
}

###
 # Quick wrapper for "sudo xampp start"
 # E.g: xamppup
 #
 # @since 4/5/16
 ##
function start-server {
	sudo xampp start
}

###
 # Quick wrapper for "git submodule init && git submodule update"
 # E.g: submodules
 #
 # @since 4/5/16
 ##
function submodules {
	git submodule init && git submodule update
}
