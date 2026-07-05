#!/bin/bash

source /home/srijit/Shellmind/modules/ai_client.sh

analyze_error(){
	clear
	echo "========Analyze error========"

	echo ""

	read -p "Enter the error: " err
	
	if [[ -z $err ]]; then
		echo "You entered nothing. Returning back to menu"
		return
	else
		echo "Analyzing error...."
		ask_ai "$err"
		echo "You entered the $err"	
		read -p "Press ENTER to continue..."
	fi
}



