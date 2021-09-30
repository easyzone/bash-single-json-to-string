# bash-single-json-to-string
I create this function because jq is very slow on openwrt firmware.

This function is use for single json data like {"username":"b99","ip":"10.1.0.243","mac":"F4:8C:50:B4:72:BA","start":"30.09.2021 08:46:13"}

You can use by command below :

json_data={"username":"b99","ip":"10.1.0.243","mac":"F4:3C:40:B9:72:BA","start":"30.09.2021 08:46:13"}

username=$(single_json_to_string "${json_data}}" username)

