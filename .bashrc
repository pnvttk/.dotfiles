# Add ~/bin to the $PATH
export PATH="$HOME/bin:$PATH"

# Source other configuration files if they exist
for file in ~/.{path,exports,bash_prompt,functions,aliases,extra}; do
    [ -r "$file" ] && [ -f "$file" ] && source "$file"
done
unset file

set -o vi
export CLICOLOR=1

# Check for chruby (Ruby version manager) and set up if it exists
if command -v chruby > /dev/null; then
    source /opt/homebrew/opt/chruby/share/chruby/chruby.sh
    source /opt/homebrew/opt/chruby/share/chruby/auto.sh
    # Uncomment and specify your desired Ruby version
    # chruby 3.3.0
fi

# Check for Node.js and set NVM if it's installed
if [ -d "$HOME/.nvm" ]; then
    export NVM_DIR="$HOME/.nvm"
    [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads NVM
    [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads NVM bash completion
    # Optionally set up the Node.js path if a version of Node is installed
    if command -v node > /dev/null; then
        export PATH="$HOME/.nvm/versions/node/$(nvm version)/bin:$PATH"
    fi
fi

# Check for Homebrew (only for macOS)
if [[ "$OSTYPE" == "darwin"* ]]; then
    PATH=$PATH:/opt/homebrew/bin
fi
if [[ "$OSTYPE" == "darwin"* ]] && command -v brew > /dev/null; then
    eval "$(/opt/homebrew/bin/brew shellenv)"
fi

# Check for bun
if [ -d "$HOME/.bun" ]; then
    export BUN_INSTALL="$HOME/.bun"
    export PATH="$BUN_INSTALL/bin:$PATH"
fi

# Check for .NET installation
if [ -d "/usr/share/dotnet" ]; then
    export DOTNET_ROOT="/usr/share/dotnet"
    export PATH="$DOTNET_ROOT:$PATH"
fi

# Check for Java installation and set environment
if command -v java > /dev/null; then
    if [[ "$OSTYPE" == "darwin"* ]]; then
        export JAVA_HOME=$(/usr/libexec/java_home -v 17)  # MacOS
    elif [[ "$OSTYPE" == "linux-gnu"* ]]; then
        export JAVA_HOME="/usr/lib/jvm/java-11-openjdk-amd64"  # Adjust as per Linux installation
    fi
    export PATH="$JAVA_HOME/bin:$PATH"
fi