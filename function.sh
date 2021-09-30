#!/bin/bash

single_json_to_string(){
	string_data=$(/bin/echo "$1" | awk -F "\"$2\"" '{print $2}'  | awk -F ',' '{print $1}' | sed 's/:"//g' | sed 's/"//g' | sed 's/}//g')
	echo "$string_data"
}
