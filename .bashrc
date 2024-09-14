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
#     chruby 3.3.0
# fi

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH=$BUN_INSTALL/bin:$PATH
