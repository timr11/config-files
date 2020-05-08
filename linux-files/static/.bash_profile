export ANDROID_HOME=~/Library/Android/sdk
export ANDROID_NDK=~/Library/Android/android-ndk-r10e
export PATH=$PATH:~/ix/tools:$ANDROID_HOME/platform-tools

alias lsh='ls -alh'
alias eslint='~/ix/musedirect/ReactNative/node_modules/eslint/bin/eslint.js'
alias flow='~/ix/musedirect/ReactNative/node_modules/.bin/flow'
PATH="$PATH:$HOME/bin"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm

export PS1="\u@\h \w\n$ "

export PATH="$PATH:/Applications/Muse"

export DYLD_FALLBACK_LIBRARY_PATH="$DYLD_FALLBACK_LIBRARY_PATH:/Applications/Muse"

##
# Your previous /Users/tim/.bash_profile file was backed up as /Users/tim/.bash_profile.macports-saved_2018-06-15_at_16:31:22
##

# MacPorts Installer addition on 2018-06-15_at_16:31:22: adding an appropriate PATH variable for use with MacPorts.
export PATH="/opt/local/bin:/opt/local/sbin:$PATH"
# Finished adapting your PATH environment variable for use with MacPorts.

