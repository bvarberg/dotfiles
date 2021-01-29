#--------------------------------------------------
# This section borrowed from thoughtbot/dotfiles
for function in ~/.zsh/functions/*; do
  [[ -f $function ]] && source $function
done

export VISUAL=vim
export EDITOR=$VISUAL

[[ -f ~/.zshrc.local ]] && source ~/.zshrc.local
[[ -f ~/.aliases ]] && source ~/.aliases
#--------------------------------------------------

