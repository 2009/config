# ==================================================
# Additional Rails aliases
# ==================================================

alias devr='eval $(egrep -v "^#" .env.dev | xargs) rails'
alias devrs='eval $(egrep -v "^#" .env.dev | xargs) rs'
alias devrc='eval $(egrep -v "^#" .env.dev | xargs) rc'
alias devrspec='eval $(egrep -v "^#" .env.dev | xargs) rspec'
alias devprint='echo $(egrep -v "^#" .env.dev | xargs)'
