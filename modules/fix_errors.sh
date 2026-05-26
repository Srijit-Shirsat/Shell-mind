#!/bin/bash

analyze_error(){
	read -p "Enter the error you got : " err 

	if [[ -z $err ]]; then 
		echo "You entered nothing.Returning to the menu"
		return
	else
		echo "Analyzing error and fetching answer. Please wait"
	fi
}



