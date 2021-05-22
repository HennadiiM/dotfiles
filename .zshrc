## Options section
setopt correct                                                  # Auto correct mistakes
setopt extendedglob                                             # Extended globbing. Allows using regular expressions with *
setopt nocaseglob                                               # Case insensitive globbing
setopt rcexpandparam                                            # Array expension with parameters
setopt nocheckjobs                                              # Don't warn about running processes when exiting
setopt numericglobsort                                          # Sort filenames numerically when it makes sense
setopt nobeep                                                   # No beep
setopt appendhistory                                            # Immediately append history instead of overwriting
setopt histignorealldups                                        # If a new command is a duplicate, remove the older one
setopt  autocd autopushd 					#if only directory path is entered, cd there. Go back with "-"

zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'       # Case insensitive tab completion
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"         # Colored completion (different colors for dirs/files/etc)
zstyle ':completion:*' rehash true                              # automatically find new executables in path
# Speed up completions
zstyle ':completion:*' accept-exact '*(N)'
zstyle ':completion:*' use-cache on
zstyle ':completion:*' cache-path ~/.zsh/cache
HISTFILE=~/.zhistory
HISTSIZE=25000
SAVEHIST=20000
#export EDITOR=/usr/bin/nano
#export VISUAL=/usr/bin/nano
WORDCHARS=${WORDCHARS//\/[&.;]}                                 # Don't consider certain characters part of the word


## Keybindings section
# set -o vi -- for vim mode in bash
bindkey -v 							# -e for emax bindings (?!), -v for vim bindings
bindkey '^[[7~' beginning-of-line                               # Home key
bindkey '^[[H' beginning-of-line                                # Home key
if [[ "${terminfo[khome]}" != "" ]]; then
  bindkey "${terminfo[khome]}" beginning-of-line                # [Home] - Go to beginning of line
fi
bindkey '^[[8~' end-of-line                                     # End key
bindkey '^[[F' end-of-line                                     # End key
if [[ "${terminfo[kend]}" != "" ]]; then
  bindkey "${terminfo[kend]}" end-of-line                       # [End] - Go to end of line
fi
bindkey '^[[2~' overwrite-mode                                  # Insert key
bindkey '^[[3~' delete-char                                     # Delete key
bindkey '^[[C'  forward-char                                    # Right key
bindkey '^[[D'  backward-char                                   # Left key
bindkey '^[[5~' history-beginning-search-backward               # Page up key
bindkey '^[[6~' history-beginning-search-forward                # Page down key

# Navigate words with ctrl+arrow keys
bindkey '^[Oc' forward-word                                     #
bindkey '^[Od' backward-word                                    #
bindkey '^[[1;5D' backward-word                                 #
bindkey '^[[1;5C' forward-word                                  #
bindkey '^H' backward-kill-word                                 # delete previous word with ctrl+backspace
bindkey '^[[Z' undo                                             # Shift+tab undo last action

## Alias section 
alias cp="cp -i"                                                # Confirm before overwriting something
alias df='df -h'                                                # Human-readable sizes
alias free='free -m'                                            # Show sizes in MB
alias gitu='git add . && git commit && git push'

# Theming section  
autoload -U compinit colors zcalc
compinit -d
colors

# enable substitution for prompt
setopt prompt_subst

# Prompt (on left side) similar to default bash prompt, or redhat zsh prompt with colors
 #PROMPT="%(!.%{$fg[red]%}[%n@%m %1~]%{$reset_color%}# .%{$fg[green]%}[%n@%m %1~]%{$reset_color%}$ "
# Maia prompt
PROMPT="%B%{$fg[cyan]%}%(4~|%-1~/.../%2~|%~)%u%b >%{$fg[cyan]%}>%B%(?.%{$fg[cyan]%}.%{$fg[red]%})>%{$reset_color%}%b " # Print some system information when the shell is first started
# Print a greeting message when shell is started
#echo $USER@$HOST  $(uname -srm) $(lsb_release -rcs)
## Prompt on right side:
#  - shows status of git when in git repository (code adapted from https://techanic.net/2012/12/30/my_git_prompt_for_zsh.html)
#  - shows exit status of previous command (if previous command finished with an error)
#  - is invisible, if neither is the case

# Modify the colors and symbols in these variables as desired.
GIT_PROMPT_SYMBOL="%{$fg[blue]%}±"                              # plus/minus     - clean repo
GIT_PROMPT_PREFIX="%{$fg[green]%}[%{$reset_color%}"
GIT_PROMPT_SUFFIX="%{$fg[green]%}]%{$reset_color%}"
GIT_PROMPT_AHEAD="%{$fg[red]%}ANUM%{$reset_color%}"             # A"NUM"         - ahead by "NUM" commits
GIT_PROMPT_BEHIND="%{$fg[cyan]%}BNUM%{$reset_color%}"           # B"NUM"         - behind by "NUM" commits
GIT_PROMPT_MERGING="%{$fg_bold[magenta]%}⚡︎%{$reset_color%}"     # lightning bolt - merge conflict
GIT_PROMPT_UNTRACKED="%{$fg_bold[red]%}●%{$reset_color%}"       # red circle     - untracked files
GIT_PROMPT_MODIFIED="%{$fg_bold[yellow]%}●%{$reset_color%}"     # yellow circle  - tracked files modified
GIT_PROMPT_STAGED="%{$fg_bold[green]%}●%{$reset_color%}"        # green circle   - staged changes present = ready for "git push"

parse_git_branch() {
  # Show Git branch/tag, or name-rev if on detached head
  ( git symbolic-ref -q HEAD || git name-rev --name-only --no-undefined --always HEAD ) 2> /dev/null
}

parse_git_state() {
  # Show different symbols as appropriate for various Git repository states
  # Compose this value via multiple conditional appends.
  local GIT_STATE=""
  local NUM_AHEAD="$(git log --oneline @{u}.. 2> /dev/null | wc -l | tr -d ' ')"
  if [ "$NUM_AHEAD" -gt 0 ]; then
    GIT_STATE=$GIT_STATE${GIT_PROMPT_AHEAD//NUM/$NUM_AHEAD}
  fi
  local NUM_BEHIND="$(git log --oneline ..@{u} 2> /dev/null | wc -l | tr -d ' ')"
  if [ "$NUM_BEHIND" -gt 0 ]; then
    GIT_STATE=$GIT_STATE${GIT_PROMPT_BEHIND//NUM/$NUM_BEHIND}
  fi
  local GIT_DIR="$(git rev-parse --git-dir 2> /dev/null)"
  if [ -n $GIT_DIR ] && test -r $GIT_DIR/MERGE_HEAD; then
    GIT_STATE=$GIT_STATE$GIT_PROMPT_MERGING
  fi
  if [[ -n $(git ls-files --other --exclude-standard 2> /dev/null) ]]; then
    GIT_STATE=$GIT_STATE$GIT_PROMPT_UNTRACKED
  fi
  if ! git diff --quiet 2> /dev/null; then
    GIT_STATE=$GIT_STATE$GIT_PROMPT_MODIFIED
  fi
  if ! git diff --cached --quiet 2> /dev/null; then
    GIT_STATE=$GIT_STATE$GIT_PROMPT_STAGED
  fi
  if [[ -n $GIT_STATE ]]; then
    echo "$GIT_PROMPT_PREFIX$GIT_STATE$GIT_PROMPT_SUFFIX"
  fi
}

git_prompt_string() {
  local git_where="$(parse_git_branch)"
  
  # If inside a Git repository, print its branch and state
  echo "[ -n "$git_where" ] && $GIT_PROMPT_SYMBOL$(parse_git_state)$GIT_PROMPT_PREFIX%{$fg[yellow]%}${git_where#(refs/heads/|tags/)}$GIT_PROMPT_SUFFIX"
  
  # If not inside the Git repo, print exit codes of last command (only if it failed)
  echo "[ ! -n "$git_where" ] && %{$fg[red]%} %(?..[%?])"
}

# Right prompt with exit status of previous command if not successful
 #RPROMPT="%{$fg[red]%} %(?..[%?])" 
# Right prompt with exit status of previous command marked with ✓ or ✗
 #RPROMPT="%(?.%{$fg[green]%}✓ %{$reset_color%}.%{$fg[red]%}✗ %{$reset_color%})"


# Color man pages
export LESS_TERMCAP_mb=$'\E[01;32m'
export LESS_TERMCAP_md=$'\E[01;32m'
export LESS_TERMCAP_me=$'\E[0m'
export LESS_TERMCAP_se=$'\E[0m'
export LESS_TERMCAP_so=$'\E[01;47;34m'
export LESS_TERMCAP_ue=$'\E[0m'
export LESS_TERMCAP_us=$'\E[01;36m'
export LESS=-r


## Plugins section: Enable fish style features
# Use syntax highlighting
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
# Use history substring search
source /usr/share/zsh/plugins/zsh-history-substring-search/zsh-history-substring-search.zsh
# bind UP and DOWN arrow keys to history substring search
zmodload zsh/terminfo
bindkey "$terminfo[kcuu1]" history-substring-search-up
bindkey "$terminfo[kcud1]" history-substring-search-down
bindkey '^[[A' history-substring-search-up			
bindkey '^[[B' history-substring-search-down

# Apply different settigns for different terminals
case $(basename "$(cat "/proc/$PPID/comm")") in
  login)
    	RPROMPT="%{$fg[red]%} %(?..[%?])"
    	alias x='startx ~/.xinitrc'      # Type name of desired desktop after x, xinitrc is configured for it
    ;;
#  'tmux: server')
#        RPROMPT='$(git_prompt_string)'
#		## Base16 Shell color themes.
#		#possible themes: 3024, apathy, ashes, atelierdune, atelierforest, atelierhearth,
#		#atelierseaside, bespin, brewer, chalk, codeschool, colors, default, eighties, 
#		#embers, flat, google, grayscale, greenscreen, harmonic16, isotope, londontube,
#		#marrakesh, mocha, monokai, ocean, paraiso, pop (dark only), railscasts, shapesifter,
#		#solarized, summerfruit, tomorrow, twilight
#		#theme="eighties"
#		#Possible variants: dark and light
#		#shade="dark"
#		#BASE16_SHELL="/usr/share/zsh/scripts/base16-shell/base16-$theme.$shade.sh"
#		#[[ -s $BASE16_SHELL ]] && source $BASE16_SHELL
#		# Use autosuggestion
#		source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
#		ZSH_AUTOSUGGEST_BUFFER_MAX_SIZE=20
#  		ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=8'
#     ;;
  *)
        RPROMPT='$(git_prompt_string)'
		# Use autosuggestion
		source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
		ZSH_AUTOSUGGEST_BUFFER_MAX_SIZE=20
  		ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=8'
    ;;
esac

export LANGUAGE="en_US.UTF-8"
export LC_ALL="en_US.UTF-8"

# autojump configuration
[[ -s /home/prodper/.autojump/etc/profile.d/autojump.sh ]] && source /home/prodper/.autojump/etc/profile.d/autojump.sh

        autoload -U compinit && compinit -u
#exec '$HOME/.profile'
#[[ -s $HOME/.profile ]]

# _fix_cursor() {
#   echo -ne '\e[5 q'
#}
#
#precmd_functions+=(_fix_cursor)

				# aliases

alias n=nvim
alias e=ranger
alias a=alarm
alias p=python
alias jup='jupyter-lab --notebook-dir=~/.org/knu/3-2'
alias ste='prime-run steam'



# dot add <filename> -- for store dotfiles 
alias dot='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME/'
alias ds='pacman -Qqe > ~/.config/pkglist.txt && 
    dot add ~/.config/pkglist.txt && 
    dot add ~/.local/share/ranger &&
    dot add ~/.local/share/zathura &&
    dot add ~/.config/qBittorrent &&
    dot add ~/.local/share/nvim &&
    dot add ~/Pictures/wallpapers &&
dot add ~/.zhistory &&
    dot commit -m "update pkglist and minor changes" &&
    dot status' #automatically update pkg list
alias doa='dot add'
alias dc='dot commit -m'
alias dp='dot push'

# fast commit specific program
alias ddwm='dot add ~/.config/dwm && dot commit -m'
alias droot='dot add ~/.config/root-conf-files && dot commit -m'
alias dst='dot add ~/.config/st-Luke && dot commit -m'
alias ddoom='dot add ~/.doom.d && dot commit -m'
alias dzshrc='dot add ~/.zshrc && dot commit -m'
alias dzshenv='dot add ~/.zshenv && dot commit -m'
alias dslstatus='dot add ~/.config/slstatus && dot commit -m'
alias dslock='dot add ~/.config/slock-1.4 && dot commit -m'
alias dxinit='dot add ~/.xinitrc && dot commit -m'
alias dscripts='dot add ~/soft/scripts/ && dot commit -m'
alias dpkg='dot add ~/.config/pkglist.txt && dot commit -m "update pkglist.txt"'
alias dnvim='dot add ~/.config/nvim/init.vim && dot commit -m'
alias dulti='dot add ~/.config/nvim/UltiSnips/tex.snippets && dot commit -m'
alias dzath='dot add ~/.config/zathura && dot commit -m'
alias dranger='dot add ~/.config/ranger'
alias dpicom='dot add ~/.config/picom.conf && dot commit -m'

alias dminor='dot add ~/.local/share/ranger && dot add ~/.local/share/zathura && ~/.config/qBittorrent && ~/.local/share/nvim -m "minor updates"'
alias gorg='cd ~/.org/ && git add . && git commit -m "more knowledge" && git push'

# standard git commands
alias gs='git status'
alias ga='git add'
alias ga.='git add .'
alias gc='git commit -m'
alias gp='git push'
alias gcl='git clone'
alias sn='sudo nvim'


alias sps='sudo pacman -S'
alias spr='sudo pacman -R'
alias Rsu='sudo pacman -Rsu'

# wtf?
alias sprdd='sudo pacman -Rdd'

alias Syy='sudo pacman -Syy'
alias Syu='sudo pacman -Syu'
alias Sua='paru -Sua'

alias msri='makepkg -sri'
alias msi='makepkg -si'

# for files
#alias wh='n $HOME/Documents/knowledge-base/optimization/what-when-to-do/want-to.md'
#alias d='n $HOME/Documents/knowledge-base/routine/daily-notes.md'
#alias do='n $HOME/Documents/knowledge-base/optimization/do,dont-do.md'
#alias i='n $HOME/Documents/knowledge-base/ideas/ideas-newcoming.md'
#alias m='n $HOME/Documents/knowledge-base/ideas/most-important.md'
#alias c='n $HOME/Documents/knowledge-base/3.efficiency/conclusions.md'
#alias h='n $HOME/Documents/knowledge-base/3.efficiency/hierarchy-of-issues.md'
#alias nms='n $HOME/.vim/UltiSnips/markdown.snippets'
#alias k='n /home/prodper/Documents/knowledge-base/3.efficiency/keyboard.rst'
#alias chi='n /home/prodper/Documents/knowledge-base/3.efficiency/chill.md'

#alias csc='cd $SCREENSHOT'

# network connection aliases
#alias senm='systemctl enable NetworkManager'
#alias sdnm='systemctl disable NetworkManager'
alias sstnm='systemctl start NetworkManager'
alias sspnm='systemctl stop NetworkManager'

# dwm manipulations
alias ndc='n $HOME/.config/dwm/config.h'
alias cdwm='$HOME/.config/dwm'
alias di='$HOME/.config/dwm && sudo make install'

# config manipulations
alias nc='n config.h'
alias smi='sudo make install'
alias smci='sudo make clean install'

# slock variations
alias slb='~/.config/slock-1.4 && smi'
alias slc='~/.config/slock-caps && smi'
alias slt='~/.config/slock-trol && smi'

# fast open in nvim
alias nv='n $HOME/.config/nvim/init.vim'
alias nvo='n $HOME/.vimrc'
alias nz='n $HOME/.zshrc'
alias nze='n $HOME/.zshenv'
alias nx='n $HOME/.xinitrc'

#alias fw='feh --bg-scale $HOME/sandbox/wallpapers/'
alias es='~/.emacs.d/bin/doom sync'


alias yvw='mpv --ytdl-format="bestvideo[ext=mp4][height<=?1080]+bestaudio[ext=m4a]"'
alias yvw7='mpv --ytdl-format="bestvideo[ext=mp4][height<=?720]+bestaudio[ext=m4a]"'
alias yvww='mpv --ytdl-format="bestvideo[ext=webm][height<=?1080]+bestaudio[ext=webm]"'
alias yvww7='mpv --ytdl-format="bestvideo[ext=webm][height<=?720]+bestaudio[ext=webm]"'
alias yaw='mpv --no-video --ytdl-format="bestaudio[ext=webm]"'
alias yad='youtube-dl -f "bestaudio[ext=webm]"'
alias yvd='youtube-dl -f "bestvideo[ext=webm][height<=?1080]+bestaudio[ext=webm]"'
alias yvd7='youtube-dl -f "bestvideo[ext=webm][height<=?720]+bestaudio[ext=webm]"'
alias yvdm='youtube-dl -f "bestvideo[ext=mp4][height<=?1080]+bestaudio[ext=m4a]"' # ??? For cases when webm is apsent?
alias yvdm7='youtube-dl -f "bestvideo[ext=mp4][height<=?720]+bestaudio[ext=m4a]"' # ??? For cases when webm is apsent?

alias yadp='youtube-dl -f "bestaudio[ext=webm]" -i'
alias yvdp='youtube-dl -f "bestvideo[ext=webm][height<=?1080]+bestaudio[ext=webm]" -i'
alias yvdp7='youtube-dl -f "bestvideo[ext=webm][height<=?720]+bestaudio[ext=webm]" -i'


alias ex='exit'
alias shu='shutdown now'
alias reb='reboot'
alias s='startx'

# mount phone, flash drive
alias pm='simple-mtpfs --device 1 ~/soft/Phone' #phone mount
alias pu='fusermount -u ~/soft/Phone'

#alias fm='mount /mnt/wtf-drive'
#alias fu='umount /mnt/wtf-drive'
alias fm='mount ~/soft/flash'
alias fu='umount ~/soft/flash'

# system76-power manadgement
alias spro='system76-power profile' 
alias sbal='system76-power profile balanced'
alias sbat='system76-power profile battery'
alias sper='system76-power profile performance'

alias sgra='system76-power graphics'
alias sgrapow='system76-power graphics power'
alias sint='system76-power graphics integrated'
alias shyb='system76-power graphics hybrid'

# rsync 
alias rp='rsync -aurP --delete-after ~/.password-store ~/soft/flash/.all'
alias ro='rsync -aurP --delete-after --exclude '.git' ~/.org ~/soft/flash/.all'
alias rd='rsync -aurP --delete-after ~/Documents ~/soft/flash/.all'
