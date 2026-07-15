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
	response=$(curl "https://generativelanguage.googleapis.com/v1beta/models/gemini-3.1-flash-lite:generateContent?key=$GEMINI_API_KEY" \
    		   -H 'Content-Type: application/json' \
   		   -X POST \
   		   -d "$request_body" 2> /dev/null
		  )


	echo "$response"
}


