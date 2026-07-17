#!/bin/bash

generate_command(){
        clear	
	echo "============GENERATE COMMAND============"
	echo ""

	read -p "What you want to generate: " task
	
	if [[ -z "$task" ]]; then
	      echo "You entered nothing"
	      return
        else
	      echo "you entered $task"
	fi
}


              	      
