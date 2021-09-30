# bash-single-json-to-string
I create this function because jq is very slow on openwrt firmware.

This function is use for single json data like 

```
{"username":"b99","ip":"10.1.0.243","mac":"F4:3C:40:B9:72:BA","start":"30.09.2021 08:46:13"}
```

You can try code below :
```
#!/bin/bash

source function.sh

json_data='{"username":"b99","ip":"10.1.0.243","mac":"F4:3C:40:B9:72:BA","start":"30.09.2021 08:46:13"}'
username=$(single_json_to_string "${json_data}" username)

```

# For multi json data you can try this code :

```
#!/bin/bash

source function.sh

json_data='[
{"username":"b99","ip":"10.1.0.243","mac":"F4:3C:20:B5:72:BA","start":"30.09.2021 08:46:13"},
{"username":"b99","ip":"10.1.0.232","mac":"82:22:44:75:72:41","start":"30.09.2021 14:32:20"},
]'

#remove [, ] and last comma in line from json data
data=$(echo "$json_data" | sed 's/\[//'  | sed 's/\]//' | sed 's/},/}/')

export IFS="}"
count=0

for word in $data; do
  
  username=$(single_json_to_string "${word}" username)
  ip=$(single_json_to_string "${word}" ip)
  mac=$(single_json_to_string "${word}" mac)
  start=$(single_json_to_string "${word}" start)
 
  echo $username
  
done
```
