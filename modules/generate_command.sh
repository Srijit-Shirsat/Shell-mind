#!/bin/bash

source /home/srijit/Shellmind/modules/prompts.sh
source /home/srijit/Shellmind/modules/ai_client.sh

generate_command(){
        clear	
	echo "============GENERATE COMMAND============"
	echo ""

	read -p "What you want to generate: " task
	
	if [[ -z "$task" ]]; then
	      echo "You entered nothing"
	      return
        else
	      prompt=$(get_command_prompt "$task")
	      answer=$(ask_ai "$prompt")
	      cmd=$(echo "$answer" | jq -r '.command[]')
	      explanation=$(echo "$answer" | jq -r '.explanation')
	      example=$(echo "$answer" | jq -r '.example')
	      notes=$(echo "$answer" | jq -r '.notes')

	      echo "==================================================================="

	      printf "\nCommand:\n%s\n" "$cmd"
	      printf "\nExplanation:\n%s\n" "$explanation"
	      printf "\nExample:\n%s\n" "$example"
	      printf "\nNotes:\n%s\n" "$notes"

	      echo "==================================================================="
              
              echo ""	      
	fi
}


              	      
