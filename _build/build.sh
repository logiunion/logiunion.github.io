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
  if [ "$LANG" == "cn" ]; then
    LANGCODE="zh-CN"
    LOGI_SIGN_LINK="https://wj.qq.com/s2/9440895/0d12/"
    LOGI_SURVEY_LINK="https://docs.google.com/forms/d/e/1FAIpQLSeqspOFXUKgUm4Bm5kze859903TA-E1EC_WOCcCRQxdmfOyUg/viewform"
  else
    LANGCODE=$LANG
    LOGI_SIGN_LINK="https://forms.gle/DLCJJRg4QLR6FHuB6"
    LOGI_SURVEY_LINK="https://docs.google.com/forms/d/e/1FAIpQLSeqspOFXUKgUm4Bm5kze859903TA-E1EC_WOCcCRQxdmfOyUg/viewform"
  fi
  export LANGCODE LOGI_NAME LOGI_OPEN_LETTER LOGI_GET_INVOLVED LOGI_SIGN_LETTER LOGI_JOIN_DISCORD LOGI_FILL_SURVEY LOGI_SIGNED LOGI_SIGN_LINK
  export LOGI_CONTENT=$(cat $FILE)
  envsubst < template.htm > ../$TARGET
  unset ACTIVE_$LANG
done