alias reload!='. ~/.zshrc'
alias ack='nocorrect ack'
alias adb='nocorrect adb'
alias repo='nocorrect repo'
alias mux='nocorrect mux'

alias sshkey="cat ~/.ssh/id_rsa.pub | pbcopy && echo 'Copied to clipboard.'"

alias vi='vim'

if [ "$OS_NAME" = "Darwin" ]; then
    alias ls='ls -G'
    alias vim='mvim -v'
elif [ "$OS_NAME" = "Linux" ]; then
    alias ls='ls --color'
fi
