#! /bin/bash 

ask_ai(){
	prompt="$1"
	source /home/srijit/Shellmind/config/config.sh
	
	if [[ -z "$GEMINI_API_KEY" ]]; then
		echo "API KEY not found"
		return
	fi

	request_body=$(jq -n --arg prompt "$prompt" '
{
  contents: [
    {
      parts: [
        {
          text: $prompt
        }
      ]
    }
  ]
}')
	response=$(curl "$BASE_URL/$MODEL_NAME:$ENDPOINT?key=$GEMINI_API_KEY" \
    	-H 'Content-Type: application/json' \
   	-X POST \
	-d "$request_body" 2> logs/curl_error.log )

	if echo "$response" | jq -e '.error' >/dev/null; then
		echo "Gemini API Error:"
		echo "$response" | jq -r '.error.message'
		return 1
	fi
	
	if [[ $? -eq 0 ]] then
		answer=$(echo "$response" | jq -r '.candidates[0].content.parts[0].text')
		echo "$answer" 
	else
		echo "Unable to connect to Gemini.
		      Please check your internet connection."
	fi

}


