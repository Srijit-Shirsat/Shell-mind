#!/bin/bash

source /home/srijit/Shellmind/modules/ai_client.sh
source /home/srijit/Shellmind/modules/prompts.sh

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
		prompt=$(get_error_prompt "$err")
		answer=$(ask_ai "$prompt")
		echo $answer
		echo ""
		read -p "Press ENTER to continue..."
	fi
}




