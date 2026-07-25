#!/bin/bash

source /home/srijit/Shellmind/modules/ai_client.sh
source /home/srijit/Shellmind/modules/prompts.sh

analyze_error(){
	clear
	echo "========Analyze error========"

	echo ""

	local err=$1

	if [[ -z "$err" ]]; then
		read -p "Enter the error: " err
	fi
	
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

		read -p "Do you want to save this report? (y/N): " save_report
		if [[ "$save_report" =~ ^[Yy]$ ]]; then
			timestamp=$(date +"%Y-%m-%d_%H-%M-%S")
			report_file="/home/srijit/Shellmind/reports/report_${timestamp}.txt"
			{
				echo "================== ShellMind Error Report =================="
				echo "Generated On : $(date +"%A, %d %B %Y | %I:%M:%S %p %Z")"
				echo ""
				echo "Original Error:"
				echo "$err"
				echo ""
				echo "Cause:"
				echo "$cause"
				echo
				echo "Explanation:"
				echo "$explanation"
				echo ""
				echo "Solution:"
				echo "$solution"
				echo
				echo "Commands:"
				echo "$commands"
				echo
				echo "If Issue Persists:"
				echo "$if_not_fixed"
				echo
				echo "Prevention:"
				echo "$prevention"
			} > "$report_file"
		echo
		echo "✓ Report saved successfully."
		echo "$report_file"
		fi
		
		read -p "Press ENTER to continue..."
	fi
}




