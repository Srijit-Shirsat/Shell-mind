#!/bin/bash

source /home/srijit/Shellmind/modules/prompts.sh
source /home/srijit/Shellmind/modules/ai_client.sh

generate_command(){
        clear	
	echo "===================GENERATE COMMAND======================="
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
	      echo ""

	      printf "\nCommand:\n%s\n" "$cmd"
	      printf "\nExplanation:\n%s\n" "$explanation"
	      printf "\nExample:\n%s\n" "$example"
	      printf "\nNotes:\n%s\n" "$notes"

	      echo ""
	      echo "==================================================================="
              echo ""

              interactive_menu=("Execute command" "Generate again" "Exit")

              PS3="Enter your preference [1-3]:"

              select choose_opt in "${interactive_menu[@]}"; do
                      case $choose_opt in
			      "Execute command")
				      echo "Executing feature coming soon....."
				      ;;
			      "Generate again")
				      echo "Generate command"
				      ;;
			      "Exit")
				      echo "Exiting....."
				      echo "Exited!!"
				      exit 
				      ;;
			      *)
				      echo "Invalid option, please try again"
				      ;;
		      esac
	      done	      
	fi
}
