#!/bin/bash

HEADER="----------=Kalyba=----------"

#FLAGA=false
#FLAG_A=false
FLAG_S=false
FLAGF=false
FLAG_C=false
LSFLAGS="-a"
#declare -A PROGRAMTABLE=( ["txt"]="nvim $" ["sh"]="bash $" ["system"]="doas nvim $" ["other"]="echo $" ["none"]="vim $")
declare -A PROGRAMTABLE=( CONFIG_GOES_HERE)
while getopts 'sFc' FLAG; do
  case "$FLAG" in
#   a)
#     echo "-a"
#     if [ $FLAGA == true ]; then
#       echo "-a annd -A are mutually exclusive. See man page for more info"
#       exit 1
#     fi
#     FLAG_A=true;;
 #   A)
      #echo "-A"
#       if [ $FLAG_A == true ]; then
#         echo "-a annd -A are mutually exclusive. See man page for more info"
#         exit 1
#       fi
#      FLAGA=true
#      LSFLAGS+="A";;
    s)
      #echo "-s"
      FLAG_S=true;;
    F)
      #echo "-F"
      FLAGF=true
      LSFLAGS+="F";;
    c)
      #echo "-c"
      FLAG_C=true;;
    ?)
      echo "script usage: kalyba [-sFc]"
      exit 1;;
  esac
done

if [ $FLAG_C == false ]; then 
  clear
  echo $HEADER
fi
CURRENTDIR=$(pwd)
while true; do  
  IFS=' ' read -a OPTIONS <<< "$(echo $(ls ${LSFLAGS} $CURRENTDIR))" 
  OPTIONSWEXIT=("Exit")
  for opt in ${OPTIONS[@]}; do
    if ( [ $FLAG_S == false ] && [ $opt != "." ] && [ $opt != "./" ] ) || [ ${opt:0:1} != "." ] || [ $opt == ".." ] || [ $opt == "../" ]; then  
      OPTIONSWEXIT+=($opt)
    fi
  done
  select NEWDIR in ${OPTIONSWEXIT[@]}; do
    if [ $NEWDIR == "Exit" ]; then
      echo "Quitting .."
      break 2
    elif [ -f "${CURRENTDIR}/${NEWDIR}" ]; then
      COMMAND=""
      if [ ${NEWDIR:0:1} != "." ] && [ $(echo "$NEWDIR" | cut -s -d'.' -f2) ]; then
        if [ "${PROGRAMTABLE[`echo "$NEWDIR" | cut -s -d'.' -f2`]}" != "" ]; then
          COMMAND="${PROGRAMTABLE[`echo "$NEWDIR" | cut -s -d'.' -f2`]}"
          #echo "$NEWDIR is a file"
          #nvim "${CURRENTDIR}/${NEWDIR}"
        else
          COMMAND="${PROGRAMTABLE["other"]}"
        fi
      elif [ ${NEWDIR:0:1} == "." ]; then 
        COMMAND="${PROGRAMTABLE["system"]}"
      else
        COMMAND="${PROGRAMTABLE["none"]}"
      fi
          ${COMMAND/\$/$CURRENTDIR/$NEWDIR}
        #echo "$NEWDIR" | cut -s -d'.' -f2
      if [ $FLAG_C == false ]; then 
        #clear
        echo $HEADER
      fi
      break
      
    elif [ -d "${CURRENTDIR}/${NEWDIR}" ]; then
      CURRENTDIR="${CURRENTDIR}/${NEWDIR}"
      #echo "$NEWDIR is a directory"
      if [ $FLAG_C == false ]; then 
        clear
        echo $HEADER
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
