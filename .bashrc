# Add `~/bin` to the `$PATH`
export PATH="$HOME/bin:$PATH";

for file in ~/.{path,exports,bash_prompt,functions,aliases,extra}; do
    [ -r "$file" ] && [ -f "$file" ] && source "$file";
done;
unset file;

set -o vi
export CLICOLOR=1