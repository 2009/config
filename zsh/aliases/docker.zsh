# ==================================================
# Docker Related
# ==================================================

# Specific docker containers
alias ion="docker run -ti --rm --privileged -v ${PWD}:/project:rw -v /dev/bus/usb:/dev/bus/usb -p 8100:8100 -p 35729:35729 -p 53703:53703 ionic3"

# Suffix for building Dockerfiles
alias -s Dockerfile="docker build - < "
