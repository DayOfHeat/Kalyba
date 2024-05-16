#!/bin/bash

FLAGA=false
#FLAG_A=false
FLAG_S=false
FLAGF=false
FLAG_C=false
while getopts 'AsFc' FLAG; do
  case "$FLAG" in
#   a)
#     echo "-a"
#     if [ $FLAGA == true ]; then
#       echo "-a annd -A are mutually exclusive. See man page for more info"
#       exit 1
#     fi
#     FLAG_A=true;;
    A)
      #echo "-A"
#       if [ $FLAG_A == true ]; then
#         echo "-a annd -A are mutually exclusive. See man page for more info"
#         exit 1
#       fi
      FLAGA=true;;
    s)
      #echo "-s"
      FLAG_S=true;;
    F)
      #echo "-F"
      FLAGF=true;;
    c)
      #echo "-c"
      FLAG_C=true;;
    ?)
      echo "script usage: kalyba [-AsFc]"
      exit 1;;
  esac
done
if [ $FLAG_C == false ]; then 
  clear
  echo "----------=Kalyba=----------"
fi
CURRENTDIR=$(pwd)
while true; do  
  IFS=' ' read -a OPTIONS <<< "$(echo $(ls -A $CURRENTDIR))"
  OPTIONSWEXIT=("Exit")
  for opt in ${OPTIONS[@]}; do
    OPTIONSWEXIT+=($opt)
  done
  select NEWDIR in ${OPTIONSWEXIT[@]}; do
    if [ $NEWDIR == "Exit" ]; then
      echo "Quitting .."
      break 2
    elif [ -f "${CURRENTDIR}/${NEWDIR}" ]; then
      #echo "$NEWDIR is a file"
      nvim "${CURRENTDIR}/${NEWDIR}"
      if [ $FLAG_C == false ]; then 
        clear
        echo "----------=Kalyba=----------"
      fi
      break
      
    elif [ -d "${CURRENTDIR}/${NEWDIR}" ]; then
      CURRENTDIR="${CURRENTDIR}/${NEWDIR}"
      #echo "$NEWDIR is a directory"
      if [ $FLAG_C == false ]; then 
        clear
        echo "----------=Kalyba=----------"
      fi
      break
    else
      echo "ERROR: Bad Select"
      exit 1
    fi
  done
done
#if [ $FLAGF == true ]; then
#  echo "going to new dir: ${CURRENTDIR}"
#  cd "${CURRENTDIR}"
#fi
exit 0
