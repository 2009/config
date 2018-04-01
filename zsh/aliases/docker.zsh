# ==================================================
# Docker Related
# ==================================================

# Ionic
alias ion="docker run -ti --rm --privileged -v ${PWD}:/project:rw -v /dev/bus/usb:/dev/bus/usb -p 8100:8100 -p 35729:35729 -p 53703:53703 ionic3"

# NativeScript
# https://github.com/rwstauner/docker-nativescript
alias tns='docker run -it --rm --device=/dev/bus/usb:/dev/bus/usb -v $HOME/.local/share/.nativescript-cli:/root/.local/share/.nativescript-cli -v $HOME/.android:/root/.android -v $HOME/.gradle:/root/.gradle -v $PWD:/src -e TERM=$TERM nativescript tns'

# Suffix for building Dockerfiles
alias -s Dockerfile="docker build - < "
