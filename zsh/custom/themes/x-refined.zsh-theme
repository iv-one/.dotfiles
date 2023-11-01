#!/usr/bin/env zsh

# ------------------------------------------------------------------------------
#
# Pure - A minimal and beautiful theme for oh-my-zsh
#
# Based on the custom Zsh-prompt of the same name by Sindre Sorhus. A huge
# thanks goes out to him for designing the fantastic Pure prompt in the first
# place! I'd also like to thank Julien Nicoulaud for his "nicoulaj" theme from
# which I've borrowed both some ideas and some actual code. You can find out
# more about both of these fantastic two people here:
#
# Sindre Sorhus
#   Github:   https://github.com/sindresorhus
#   Twitter:  https://twitter.com/sindresorhus
#
# Julien Nicoulaud
#   Github:   https://github.com/nicoulaj
#   Twitter:  https://twitter.com/nicoulaj
#
# ------------------------------------------------------------------------------

# Set required options
#
setopt prompt_subst

# Load required modules
#
autoload -Uz vcs_info

# Set vcs_info parameters
#
zstyle ':vcs_info:*' enable hg bzr git
zstyle ':vcs_info:*:*' unstagedstr '!'
zstyle ':vcs_info:*:*' stagedstr '+'
zstyle ':vcs_info:*:*' formats "$FX[bold]%r$FX[no-bold]/%S" "%F{yellow}  %b%f" "%%u%c"
zstyle ':vcs_info:*:*' actionformats "$FX[bold]%r$FX[no-bold]/%S" "%F{yellow}=%b%f" "%u%c (%a)"
zstyle ':vcs_info:*:*' nvcsformats "%~" "" ""

inside_git() {
    command git rev-parse --is-inside-work-tree &>/dev/null || return
}

git_dirty() {
    command git diff --quiet --ignore-submodules HEAD &>/dev/null; [ $? -eq 1 ] && echo " %F{red}•%f"
}

git_status() {
  [[ -z $(git status -s) ]] || echo " %F{yellow}•%f"
}

git_ahead() {
    local branch="$(git rev-parse --abbrev-ref HEAD)"
    local count="$(git rev-list --count origin/$branch..HEAD)"
    if [ "$count" = '0' ]; then
      return
    else
      echo "%F{cyan}$count⇡%f"
    fi
}

# Display information about the current repository
#
repo_information() {
    darker="234"
    dark="236"
    if inside_git; then
      echo "$BG[$darker]%F{blue}${vcs_info_msg_0_%%/.} %F{8}$BG[$dark]%F{$darker} $vcs_info_msg_1_`git_status` $reset_color%F{$dark} `git_ahead` $vcs_info_msg_2_%f"
    else
      echo "$BG[$darker]%F{blue}${vcs_info_msg_0_%%/.} %F{8}$vcs_info_msg_1_$reset_color%F{$darker}$vcs_info_msg_2_%f"
    fi
}

# Displays the exec time of the last command if set threshold was exceeded
#
cmd_exec_time() {
    local stop=`date +%s`
    local start=${cmd_timestamp:-$stop}
    let local elapsed=$stop-$start
    [ $elapsed -gt 5 ] && echo ${elapsed}s
}

# Get the initial timestamp for cmd_exec_time
#
preexec() {
    cmd_timestamp=`date +%s`
}

# Output additional information about paths, repos and exec time
#
precmd() {
    vcs_info # Get version control info before we start outputting stuff
    print -P "\n$(repo_information) %F{249}$(cmd_exec_time)%f"
}

# Define prompts
#
PROMPT="%(?.%F{magenta}.%F{red})❯%f " # Display a red prompt char on failure
RPROMPT="%F{8}${SSH_TTY:+%n@%m}%f"    # Display username if connected via SSH

# ------------------------------------------------------------------------------
#
# List of vcs_info format strings:
#
# %b => current branch
# %a => current action (rebase/merge)
# %s => current version control system
# %r => name of the root directory of the repository
# %S => current path relative to the repository root directory
# %m => in case of Git, show information about stashes
# %u => show unstaged changes in the repository
# %c => show staged changes in the repository
#
# List of prompt format strings:
#
# prompt:
# %F => color dict
# %f => reset color
# %~ => current path
# %* => time
# %n => username
# %m => shortname host
# %(?..) => prompt conditional - %(condition.true.false)
#
# ------------------------------------------------------------------------------
