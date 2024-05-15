#!/bin/bash
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
      exit 0
    elif [ -f "${CURRENTDIR}/${NEWDIR}" ]; then
      echo "$NEWDIR is a file"
      nvim "${CURRENTDIR}/${NEWDIR}"
      break
      
    elif [ -d "${CURRENTDIR}/${NEWDIR}" ]; then
      CURRENTDIR="${CURRENTDIR}/${NEWDIR}"
      echo "$NEWDIR is a directory"
      break
    else
      echo "ERROR: Bad Select"
      exit 1
    fi
  done
done
