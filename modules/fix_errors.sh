#!/bin/bash

analyze_error(){
	clear
	echo "========Analyze error========"

	echo ""

	read -p "Enter the error: " err

	if [[ -z $err ]]; then
		echo "You entered nothing. Returning back to menu"
		return
	else
		echo "Analyzing error. Please wait"

		read -p "Press ENTER to continue...."
	fi


}



