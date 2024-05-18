#!/bin/bash
CONFIGRESULTS=""
DELIM1=" *"
DELIM2="* "
while IFS="" read -r LINE || [ -n "$LINE" ]; do
  EXTENTION=${LINE%%$DELIM1}
  COMMAND=${LINE#$DELIM2} # # is delete first example of regex; % is delete last example of regex
  #echo "${EXTENTION} is the extention that runs ${COMMAND}"
  CONFIGRESULTS+="[\"${EXTENTION}\"]=\"${COMMAND}\" "
  #echo $CONFIGRESULTS
done < config
sed -i "s/CONFIG_GOES_HERE/${CONFIGRESULTS}/g" /bin/kalyba
