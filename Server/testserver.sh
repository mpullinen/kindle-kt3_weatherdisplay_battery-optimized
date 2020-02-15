#!/bin/bash

OUTPNG="weatherdata-kindle3.png"
SOURCESVG="cron_kindle-wetter_preprocess.svg"
TARGETSVG="weatherdata-kindle3.svg"
SLEEPTIME=30

while true; do
  DATE=`date "+%Y-%m-%d %H:%M:%S"`

  cat $SOURCESVG | sed "s/\$TIME/$DATE/" > $TARGETSVG

  rsvg-convert --background-color=white -o $OUTPNG $TARGETSVG
  pngcrush -c 0 -ow $OUTPNG
  rm $TARGETSVG
  echo "------------- PNG updated on" `date`
  echo "------------- Sleeping $SLEEPTIME seconds"  
  sleep $SLEEPTIME
done
