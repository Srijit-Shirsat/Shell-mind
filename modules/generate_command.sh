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
	      echo $answer | jq .
	fi
}


              	      
