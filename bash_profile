source /Users/afischer/.rvm/scripts/rvm

## EXPORTS ##
# Set emacs as the default editor
export EDITOR='emacs';

## LOAD EXTERNAL ##
# Load external shell dotfiles.
for file in ~/.dotfiles/{aliases,bash_prompt,git-completion}; do
  [ -r "$file" ] && [ -f "$file" ] && source "$file";
done;


## BASH COMPLETION ##

# Add tab completion for many Bash commands
if which brew &> /dev/null && [ -f "$(brew --prefix)/share/bash-completion/bash_completion" ]; then
  source "$(brew --prefix)/share/bash-completion/bash_completion";
elif [ -f /etc/bash_completion ]; then
  source /etc/bash_completion;
fi;

# Add `killall` tab completion for common apps
complete -o "nospace" -W "Contacts Calendar Dock Finder Mail Safari iTunes SystemUIServer Terminal Twitter" killall;

## DEFAULTS WRITE TRACKING ##
PROMPT_COMMAND='echo "$(history 1 | grep "defaults write")" | sed '/^$/d' >> ~/.dotfiles/defaults.txt'
