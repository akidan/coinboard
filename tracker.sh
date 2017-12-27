#!/bin/bash
while : 
  do
  curl=`curl -s 'https://coinboard.me/home/' -H 'cookie:sessionid=\
cof0d87159s06t04ylxxtvi06qcam78w\
;' --compressed | tr "<" "\n" | grep totalAsset_amount | sed 's/.*>//'`
  echo -ne "\n"$curl"\r"
  sleep 90;
done
