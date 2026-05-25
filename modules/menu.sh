#!/bin/bash

echo "==============================="
echo "          SHELLMIND            "
echo "==============================="

show_menu(){
	options=("Analyze error" "Generate command" "Exit")
        

        PS3="Enter your preference [1-3]: "

	select choose_opt in "${options[@]}" ; do
		case $choose_opt in 
			"Analyze error")
				read -p "Enter your error: " error
				;;
			"Generate command")
				read -p "Enter your prompt to generate a command: " cmd 
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
