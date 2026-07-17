#!/bin/bash

source /home/srijit/Shellmind/modules/fix_errors.sh
source /home/srijit/Shellmind/modules/generate_command.sh

echo "==============================="
echo "          SHELLMIND            "
echo "==============================="

show_menu(){
	options=("Analyze error" "Generate command" "Exit")
        

        PS3="Enter your preference [1-3]: "

	select choose_opt in "${options[@]}" ; do
		case $choose_opt in 
			"Analyze error") 
				analyze_error
				;;
			"Generate command")
				generate_command 
				;;
			"Exit")
				echo "Exiting....."
				echo "Exited!!"
				break
				;;
			*)
				echo "Invalid option, please try again"
				;;
		esac
	done
} 
