#!/bin/bash

for FILE in $(ls *.html); do
  tmp=${FILE#*_}   # remove prefix ending in "_"
  LANG=${tmp%.*}   # remove suffix starting with "."
  if [ "$LANG" == "en" ]; then
    TARGET=${FILE%_*}
    TARGET="$TARGET.html"
  else
    TARGET=$FILE
  fi
  declare -x ACTIVE_$LANG="active"
  source $LANG.env
  export LANG LOGI_NAME LOGI_OPEN_LETTER LOGI_GET_INVOLVED LOGI_SIGN_LETTER LOGI_JOIN_DISCORD LOGI_FILL_SURVEY LOGI_SIGNED LOGI_SIGN_LINK
  export LOGI_CONTENT=$(cat $FILE)
  envsubst < template.htm > ../$TARGET
  unset ACTIVE_$LANG
done