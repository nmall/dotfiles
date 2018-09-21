# Shell Vars
	set -g SHELL /usr/local/bin/fish
	set -g GIT_HOME /usr/local/git/bin
	set -g GRADLE_HOME /usr/local/gradle/bin
	set -g MYSQL_HOME /usr/local/mysql/bin
	set -g ANDROID_HOME /Users/nmall/workspace/fedex/metadatagame/android-sdk-macosx
	set -g CHROMEDRIVER_HOME /Users/nmall/workspace/third-party/chromedriver

# aliases
	# Basic
	alias cd..="cd .."
	alias ls="ls -G"
	alias ll="ls -alG"
	alias lp="ls -pG"
	alias h=history
	alias fconf="open -t ~/.config/fish/config.fish"

	# Gradle
	alias gwi="./gradlew idea"
	alias gwir="./gradlew idea --refresh-dependencies"
	alias gwij="./gradlew idea clean jar sourcesJar"
	alias gwiu="./gradlew idea clean upload"
	alias gwr="./gradlew run"

	# Docker
	alias dk="docker kill $0"
	alias dcu="docker-compose up"
	alias dcd="docker-compose down"
	alias dcp="docker-compose pull"
	alias dps="docker ps --format=\"{{.ID}} - {{.Image}}\""
	alias dka="docker ps -q | xargs docker kill"
	alias dpa="docker ps -a --format "{{.Image}}" | xargs -n 1 docker pull"
	alias drmi="docker images --format="{{.ID}}" | xargs docker rmi -f"

	# Fuck
	eval (thefuck --alias | tr '\n' ';')


# Colors
	set normal (set_color normal)
	set magenta (set_color magenta)
	set yellow (set_color yellow)
	set green (set_color green)
	set red (set_color red)
	set gray (set_color -o black)


set fish_greeting '🐜'

# Ruby Env
	status --is-interactive; and . (rbenv init -|psub)

# Fish git prompt
	set __fish_git_prompt_showdirtystate 'yes'
	set __fish_git_prompt_showstashstate 'yes'
	set __fish_git_prompt_showuntrackedfiles 'yes'
	set __fish_git_prompt_showupstream 'yes'
	set __fish_git_prompt_color_branch yellow
	set __fish_git_prompt_color_upstream_ahead green
	set __fish_git_prompt_color_upstream_behind red

# Status Chars
	set __fish_git_prompt_char_dirtystate '⚡'
	set __fish_git_prompt_char_stagedstate '→'
	set __fish_git_prompt_char_untrackedfiles '☡'
	set __fish_git_prompt_char_stashstate '↩'
	set __fish_git_prompt_char_upstream_ahead '+'
	set __fish_git_prompt_char_upstream_behind '-'




# Aux functions
	## Git prompt
		function fish_prompt
		  set last_status $status

		  set_color $fish_color_cwd
		  printf '%s' (prompt_pwd)
		  set_color normal

		  printf '%s ' (__fish_git_prompt)

		  set_color normal
		end

	## !!
		function !!
		    eval sudo $history[1]
		end