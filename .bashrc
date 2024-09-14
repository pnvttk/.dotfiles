# Add `~/bin` to the `$PATH`
export PATH="$HOME/bin:$PATH";

for file in ~/.{path,exports,bash_prompt,functions,aliases,extra}; do
    [ -r "$file" ] && [ -f "$file" ] && source "$file";
done;
unset file;

set -o vi
export CLICOLOR=1

# if command -v chruby > /dev/null 2>&1; then
source /opt/homebrew/opt/chruby/share/chruby/chruby.sh
source /opt/homebrew/opt/chruby/share/chruby/auto.sh
# chruby 3.3.0
# fi

# node
export NVM_DIR="$HOME/.nvm"
[ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"  # This loads nvm
[ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion

# Homebrew
export PATH="$HOME/.nvm/versions/node/$(nvm version)/bin:$PATH"
eval "$(/opt/homebrew/bin/brew shellenv)"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH=$BUN_INSTALL/bin:$PATH
