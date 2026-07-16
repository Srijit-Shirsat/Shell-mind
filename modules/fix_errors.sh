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
		cause=$(echo "$answer" | jq -r '.cause')
		solution=$(echo "$answer" | jq -r '.solution')
		commands=$(echo "$answer" | jq -r '.commands[]')
		if_not_fixed=$(echo "$answer" | jq -r '.if_not_fixed')
		explanation=$(echo "$answer" | jq -r '.explanation')
		prevention=$(echo "$answer" | jq -r '.prevention')

		printf "\nCause:\n%s\n" "$cause"
		printf "\nSolution:\n%s\n" "$solution"
		printf "\nCommands:\n%s\n" "$commands"
		printf "\nIf_issue_persists:\n%s\n" "$if_not_fixed"
		printf "\nExplanation:\n%s\n" "$explanation"
		printf "\nPrevention:\n%s\n" "$prevention"
		echo ""
		read -p "Press ENTER to continue..."
	fi
}




