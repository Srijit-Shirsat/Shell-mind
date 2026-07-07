#! /bin/bash 

ask_ai(){
	prompt="$1"
	
	source /home/srijit/Shellmind/config/config.sh
	
	if [[ -z "$GEMINI_API_KEY" ]]; then
		echo "API KEY not found"
		return
	else
		echo "API KEY VALIDATED"
	fi

	request_body=$(cat <<EOF
{
  "contents": [
    {
      "parts": [
        {
          "text": "$prompt"
        }
      ]
    }
  ]
}
EOF
)


	echo "$request_body"
}


