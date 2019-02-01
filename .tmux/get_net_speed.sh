#!/bin/bash
declare -a result=$(ifstat -z -S -q -b 1 1|tail -n 1)
# echo $(echo $result |cut -c 2)
result=$( echo $result|cut -c 3-)
declare -a result=($(echo $result))
download=${result[0]}
upload=${result[1]}

echo $upload ${#upload}
if [ ${#upload} -gt 6 ]; then
  upload=$(echo $upload/1024 |bc -l)
  upload=$(printf "#[fg=colour160]U:%7.2f Mbps#[fg=colour255]" $upload)
else
  upload=$(printf "#[fg=colour105]U:%7.2f kbps#[fg=colour255]" $upload)
fi
if [ ${#download} -gt 6 ]; then
  download=$(echo $download/1024 |bc -l)
  download=$(printf "#[fg=colour160]D:%7.2f Mbps#[fg=colour255]" $download)
else
  download=$(printf "#[fg=colour105]D:%7.2f kbps#[fg=colour255]" $download)
fi
echo "$upload $download"
