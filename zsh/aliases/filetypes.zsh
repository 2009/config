# ==================================================
# Filetypes Aliases
# ==================================================
#
# This uses zsh suffixes, which allows you to create
# aliases for when filenames are invoked.
#
# e.g. with the alias:         alias -s txt="less"
#      invoking:               $ myfile.txt
#      gives:                  $ less myfile.txt
#
# --------------------------------------------------

# open browser urls
if [[ -n "$BROWSER" ]]; then
  _browser_fts=(htm html de org net com at cx nl se dk)
  for ft in $_browser_fts; do alias -s $ft=$BROWSER; done
fi

# open images
if [[ -n "$XIVIEWER" ]]; then
  _image_fts=(jpg jpeg png gif mng tiff tif xpm)
  for ft in $_image_fts; do alias -s $ft=$XIVIEWER; done
fi

# open media files
_media_fts=(ape avi flv m4a mkv mov mp3 mpeg mpg ogg ogm rm wav webm)
for ft in $_media_fts; do alias -s $ft=mpv; done

# documents
alias -s pdf=zathura

# list contents of packed files
alias -s zip="unzip -l"
alias -s rar="unrar l"
alias -s tar="tar tf"
alias -s tar.gz="echo "
alias -s ace="unace l"
