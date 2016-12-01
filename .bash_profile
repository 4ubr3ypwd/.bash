# Set CLICOLOR if function you want Ansi Colors in iTerm2
export CLICOLOR=1

# Set colors to match iTerm2 Terminal Colors
export TERM=xterm-256color;

# Colorful ls
alias ls='ls -laGFh';

#wpcli
source ~/.bash/wp-cli/utils/wp-completion.bash

# Default editor
export EDITOR=vim;

# Git Aware!
export GITAWAREPROMPT=~/.bash/git-aware-prompt;
source $GITAWAREPROMPT/main.sh;

# Bash Power prompt.
source ~/.bash/.bash-powerline.sh

# Old Command prompts
# export PS1="\n\${debian_chroot:+(\$debian_chroot)}\[\033[01;32m\]\[\033[00m\]\[\033[01;34m\]\w\[\033[00m\]\[$txtpur\]\$git_branch\[$txtred\]\$git_dirty\[$txtrst\] > ";
# export PS1="\n\[$txtpur\]\w \[$txtcyn\]\$git_branch\[$txtred\]\$git_dirty\[$txtrst\]\n$ ";

# vv
export PATH=$PATH:/Applications/XAMPP/xamppfiles/htdocs/centralmarket.dev/wp-content/vagrant-local/vv
source $( echo $(which vv)-completions)

###
 # FUNCTIONS
 # =========
 ##

###
 # Commit for pre-processing chores.
 #
 # E.g.: commit-chores
 #
 # This make it easy to do this common commit message,
 # make sure and stage your files first!
 #
 # @since  12/1/16
 ##
function commit-chores {
	git commit -m "Pre-processing Chores. $1"
}

	###
	 #
	 ##
	function chores() {
		commit-chores "$1"
	}

###
 # Create a WDS Site.
 #
 # E.g.: new-wds-site sitename.dev git@webdevstudios.git.beanstalkapp.com:/webdevstudios/youth-entrepreneurs.git
 #
 # @since 7/12/16
 ##
function new-wds-site {
	mkdir "~/htdocs/$1"
	cd "~/htdocs/$1"
	wp core download
	rm -Rf wp-content
	git clone "$2" wp-content
	sphp "~/scripts/xampp.php add $1"
	php "~/scripts/add-db.php $1"
	cd wp-content
	submodules
	cd ..
	open "http://$1"
	subl "~/htdocs/$1"
	subl "~/htdocs/$1/wp-config.php"
}

###
 # Watch debug.log
 #
 # @since 6/21/16
 ##
function dlog {
	tail -f debug.log
}

	###
	 # Reset debug.log and watch it.
	 #
	 # @since 6/21/16
	 ##
	function dlog-reset {
		rm debug.log && touch debug.log && tail -f debug.log
	}

		###
		 # Wrapper for dlog-reset
		 #
		 # @since 6/21/16
		 ##
		function dlogr {
			dlog-reset
		}

###
 # Opens a new Safari instance.
 #
 # @since 4/5/16
 ##
function new-safari {
	open -n -a Safari
}

###
 # Easier way to exit.
 #
 # @since 5/13/16
 ##
function e {
	exit
}

	###
	 # Another easy way to exit.
	 #
	 # @since 5/13/16
	 ##
	function x {
		exit
	}

###
 # Flushes DNS Cache.
 #
 # E.g.: dns-flush
 #
 # @since 4/5/16
 ##
function dns-flush {
	sudo dscacheutil -flushcache;sudo killall -HUP mDNSResponder
}

	###
	 # Wrapper for dns-flush().
	 #
	 # @since 11/22/16
	 ##
	function flush-dns {
		dns-flush
	}

###
 # Yo Commands.
 #
 # @since 4/5/16
 #
 # @see https://github.com/WebDevStudios/generator-plugin-wp#sub-generators
 ##
function yo-help {
	echo "yo plugin-wp:include include-name"
	echo "yo plugin-wp:cpt cpt-name"
	echo "yo plugin-wp:taxonomy taxonomy-name"
	echo "yo plugin-wp:options options-name"
	echo "yo plugin-wp:widget widget-name"
	echo "yo plugin-wp:pagebuilder class-name"
	echo "yo plugin-wp:endpoint class-name"
	echo "yo plugin-wp:js Javascript"
	echo "yo plugin-wp:css Styles"
}

###
 # Sudo PHP.
 #
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
	nativefier -n "$1" -o --insecure "$2" --flash
}

	###
	 # Wrapper for native().
	 #
	 # @since 11/22/16
	 ##
	function new-app {
		native $1 $2
	}

	###
	 # Wrapper for native().
	 #
	 # @since 11/22/16
	 ##
	function app {
		native $1 $2
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
	 # Goto wp-content.
	 #
	 # WDS usually VC's the wp-content folder, so let's
	 # go there.
	 #
	 # E.g. wds-dev centralmarket
	 #
	 # @since 8/14/2016
	 ##
	function wds-dev {
		dev $1
		cd wp-content
	}

	###
	 # Wrapper for dev <project-name>.
	 #
	 # @since 4/6/16
	 ##
	function htdocs {
		dev $1
	}

###
 # Applies a Trac ticket patch via a URL.
 #
 # E.g: trac-apply-patch <the url to the trac ticket>
 #
 # @since 4/5/16
 ##
function trac-apply-patch {
	curl -k $1 | patch -p0
}

	###
	 # Wrapper for trac-apply-patch().
	 #
	 # @since 11/22/16
	 ##
	function apply-trac-patch {
		trac-apply-patch $1
	}

###
 # Copies the current Git branch.
 #
 # E.g: copy-branch
 #
 # @since 4/5/16
 ##
function copy-branch {
	git branch|grep '*'|tr -d '* \n'|pbcopy
}

	###
	 # Wrapper for copy-branch.
	 #
	 # @since 4/5/16
	 ##
	function cb {
		copy-branch
	}

###
 # Deletes a Git branch locally and remotely.
 #
 # E.g.: git-delete-branch my-branch
 #
 # @since 4/5/16
 ##
function git-delete-branch {
	git branch -D $1 && git push origin :$1
}

	###
	 # Wrapper for git-delete-branch().
	 #
	 # @since 11/22/16
	 ##
	function delete-branch {
		git-delete-branch $1
	}

###
 # Edits Sublime Text Snippets
 #
 # E.g: edit-snippets
 #
 # @since 4/5/16
 ##
function edit-snippets {
	subl "~/Library/Application Support/Sublime Text 3/Packages/User/Snippets"
}

###
 # Deploys a WordPress plugin to SVN
 #
 # E.g: wp-org-deploy plugin_file_with_header.php aubreypwd false
 #
 # @since 4/5/16
 ##
function wp-org-deploy {
	wget https://raw.githubusercontent.com/aubreypwd/deploy-git-wordpress-org/master/deploy-git-wordpress-org.sh
	sh deploy-git-wordpress-org.sh $1 $2 $3
	rm deploy-git-wordpress-org.sh
}

	###
	 # Wrapper for wp-org-deploy().
	 #
	 # @since 11/22/16
	 ##
	function wp-deploy {
		wp-org-deploy $1 $2 $3 $4
	}

###
 # Edit's this file.
 #
 # E.g: edit-bash
 #
 # @since 4/5/16
 ##
function edit-bash {
	subl ~/.bash_profile
}

###
 # Edits the /etc/hosts file.
 #
 # E.g: edit-hosts
 #
 # @since 4/5/16
 ##
function edit-hosts {
	sudo subl /etc/hosts
}

###
 # Edits XAMPP files.
 #
 # E.g: edit-xampp
 #
 # @since 4/5/16
 ##
function edit-xampp {
	subl /Applications/XAMPP/xamppfiles/
}

###
 # Gifify's a .mov file and uploads it to CloudUp
 #
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
function git-put-patch {
	git-patch "$2"    # Create a patch and upload to cloudup.
	git checkout "$2"    # Checkout the target branch.
	pull
	git merge "$1"       # Merge in the intended branch.
}

	###
	 # Put this branch into another.
	 #
	 # @since 4/6/16
	 ##
	function git-put {
		git-put-patch "$(git branch|grep '*'|tr -d '* \n')" "$1"
	}

		###
		 # Wrapper for git-put <branch-name>
		 #
		 # @since 4/6/16
		 ##
		function put {
			git-put "$1"
		}

###
 # Fancy Git Log
 #
 # E.g: git-log
 #
 # @since 5/4/16 Re-written to be used as git-log-big
 ##
function git-log-big {
	git log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit
}

	###
	 # Show simple one-liner log.
	 #
	 # E.g.: git-log-simple
	 #
	 # @since 4/5/16
	 ##
	function git-log-simple {
		git log -n 30 --oneline
	}

		###
		 # Wrapper for git-log-simple.
		 #
		 # @since 5/4/16 Re-written to use simple log.
		 ##
		function log {
			git-log-simple
		}

		###
		 # Wrapper for git-log-simple.
		 #
		 # @since 5/4/16
		 ##
		function git-log {
			git-log-simple
		}

		###
		 # Wrapper for git-log-simple.
		 #
		 # @since 4/6/16
		 ##
		function short-log {
			git-log-simple
		}

		###
		 # Wrapper for git-log-big().
		 #
		 # @since 5/4/16
		 ##
		function git-big-log {
			git-log-big
		}

		###
		 # Wrapper for git-log-simple.
		 #
		 # @since 4/6/16
		 ##
		function slog {
			git-log-simple
		}

###
 # Pushes the current branch.
 #
 # E.g.: git-push
 #
 # @since 4/5/16
 ##
function git-push {
	git push origin $(git branch|grep '*'|tr -d '* \n')          # Finally push.
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
	 # Super quick way to push (Deprecated).
	 #
	 # @since 5/5/16
	 # @since 11/28/16 Deprecated because p could mean either push or pull and it gets confusing, use push() and pull() instead.
	 # @since 11/29/16 Push it! Push it!
	 ##
	function p {
		push
	}

###
 # Creates a patch using Git
 #
 # E.g: git-patch-up file.diff (Creates a patch as file.diff)
 #
 # @since 4/5/16
 # @since 11/22/16 Updated this to be git-patch-up
 ##
function git-patch-up {
	git diff "$1"... --no-prefix > "$2"
	up "$2"
}

	###
	 # Quick patch
	 #
	 # E.g.: git-patch branch
	 #
	 # @since 4/5/16
	 ##
	function git-patch {
		current_time=$(date "+%Y-%m-%d-%H-%M-%S")
		git-patch-up $1 ~/Downloads/$current_time.diff
	}

###
 # Pulls down the current branch.
 #
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
 # Quick wrapper for "npm install && bower install"
 #
 # E.g: install
 #
 # @since 4/5/16
 ##
function install {
	npm install && bower install
}

###
 # Re-sources this bash file.
 #
 # E.g: reload-bash
 #
 # @since 4/5/16
 ##
function reload-bash {
	source ~/.bash_profile
}

###
 # Sudo xampp.
 #
 # Always sudo xampp.
 #
 # @since  11/22/16
 ##
function xampp {
	sudo xampp $1 $2
}

###
 # Pulls files to destination.
 #
 # E.g: rsync-down username@domain:/var/www/ /var/www
 #
 # @since 4/5/16
 ##
function rsync-down {
	rsync -az --progress -e ssh $1 $2
}

###
 # Sends files up to location.
 #
 # E.g: rsync-up /var/www/ username@domain:/var/www/
 #
 # @since 4/5/16
 ##
function rsync-up {
	rsync -avz --progress $1 -e ssh $2
}

###
 # Quick wrapper for "git submodule init && git submodule update"
 #
 # E.g: submodules
 #
 # @since 4/5/16
 ##
function submodules {
	git submodule update --init --recursive
}

	###
	 # Wrapper for submodules.
	 #
	 # @since 11/22/16 submodules is hard to type.
	 ##
	function modules {
		submodules
	}

###
 # Get the count of commits for the day.
 #
 # E.g. count-commits
 #
 # @since 8/12/2016
 ##
function count-commits {
	git shortlog -s -n
}

	###
	 # Get my commit count for the day.
	 #
	 # E.g. count-commits-today
	 #
	 # @since 8/12/16
	 ##
	function count-commits-today {
		git shortlog -s -n --since="6am" | grep "Aubrey Portwood"
	}

	###
	 # Count commits since many days ago.
	 #
	 # Will show commit count
	 #
	 # E.g. count-commits-since 5
	 ##
	function count-commits-since {
		git shortlog -s -n --since="$1 days ago" | grep "Aubrey Portwood"
	}
