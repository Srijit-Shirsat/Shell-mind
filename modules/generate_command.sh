#!/bin/bash

source /home/srijit/Shellmind/modules/prompts.sh
source /home/srijit/Shellmind/modules/ai_client.sh
source /home/srijit/Shellmind/modules/fix_errors.sh

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
	      if [[ -z "$answer" ]]; then
		      echo "ERROR: No response received from Gemini."
		      return
	      fi
	      if ! echo "$answer" | jq empty >/dev/null 2>&1; then
		      echo "Invalid JSON received from Gemini."
		      echo "$answer"
		      return
	      fi
	      command_count=$(echo "$answer" | jq '.commands | length')
	      if [[ "$command_count" -eq 0 ]]; then
		      echo "No commands were returned."
		      return
	      fi
	      if ! echo "$answer" | jq -e '.commands and .explanation and .example and .notes' >/dev/null 2>&1; then
		      echo "JSON fields are missing."
		      return
	      fi
	      mapfile -t titles < <(
		      echo "$answer" | jq -r '.commands[].title'
	      )
	      mapfile -t commands < <(
		      echo "$answer" | jq -r '.commands[].command'
	      )
	      explanation=$(echo "$answer" | jq -r '.explanation')
	      example=$(echo "$answer" | jq -r '.example')
	      notes=$(echo "$answer" | jq -r '.notes')

	      echo "======================================================================================================================================="
	      echo ""

	      echo "Available Commands:"
	      echo
	      for ((i=0; i<command_count; i++)); do
		      printf "%d. %s\n" "$((i+1))" "${titles[$i]}"
		      printf "   %s\n\n" "${commands[$i]}"
	      done
	      printf "\nExplanation:\n%s\n" "$explanation"
	      printf "\nExample:\n%s\n" "$example"
	      printf "\nNotes:\n%s\n" "$notes"

	      echo ""
	      echo "======================================================================================================================================="
              echo ""

	      echo "======================================================================================================================================="

              interactive_menu=("Execute command" "Generate again" "Exit")

              PS3="Choose what you want to do further [1-3]: "

              select choose_opt in "${interactive_menu[@]}"; do
                      case $choose_opt in
			      "Execute command")
				      if [[ $command_count -eq 1 ]]; then
					      selected_command="${commands[0]}"
				      else
					      echo "Multiple commands found."
					      PS3="Choose command: "
					      select selected_command in "${titles[@]}"; do
						      if [[ -n "$selected_command" ]]; then
							      selected_command="${commands[$((REPLY-1))]}"
							      break
						      else
							      echo "Invalid option. Please try again."
						      fi
					      done
					      PS3="Enter your preference [1-3]: "
				      fi
				      read -p "Do you want to execute this command? (y/N): " confirm
				      if [[ -z "$confirm" ]]; then
					      echo "You entered nothing"
				      elif [[ "$confirm" =~ ^[Yy]$ ]]; then
					      command_output=$(bash -c "$selected_command" 2>&1)
					      exit_status=$?
					      if [[ "$exit_status" -eq 0 ]]; then
						      echo "Command executed successfully"
						      return
					      else
						      echo "Command failed to execute"
						      read -p "Do you want Shellmind to analyze this error (y/N)" error_func
						      if [[ -z "$error_func" ]]; then
							      echo "You entered nothing. Returning back to menu"
							      return
						      elif [[ "$error_func" =~ ^[Yy]$ ]]; then
							      analyze_error $command_output
						      else
							      echo "Returning back to main menu"
						      fi
					      fi
				      else
					      echo "Returning to the menu"
					      break
					      
				      fi
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
