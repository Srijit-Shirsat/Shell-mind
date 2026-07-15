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
	response=$(curl "$BASE_URL/$MODEL_NAME:$ENDPOINT?key=$GEMINI_API_KEY" \
    		   -H 'Content-Type: application/json' \
   		   -X POST \
   		   -d "$request_body" 2> /dev/null
		  )
   	
	answer=$(echo "$response" | jq -r '.candidates[0].content.parts[0].text')


	echo "$answer"
}


