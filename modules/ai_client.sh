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
	response=$(curl --connect-timeout 10 \ 
	        	--max-time 30 \
			"$BASE_URL/$MODEL_NAME:$ENDPOINT?key=$GEMINI_API_KEY" \
    			-H 'Content-Type: application/json' \
   			-X POST \
			-d "$request_body" 2> logs/curl_error.log )

	curl_status=$?

	if [[ $curl_status -ne 0 ]]; then
		case $curl_status in
			6)
				echo "Unable to resolve host. Please check your internet connection."
				;;
			7)
				echo "Failed to connect to Gemini."
				;;
			28)
				echo "Request timed out."
				;;
			*)
				echo "Network error (curl: $curl_status)"
				;;
		esac
		
		return 1
	fi

	if echo "$response" | jq -e '.error' >/dev/null; then
		echo "Gemini API Error:"
		echo "$response" | jq -r '.error.message'
		return 1
	fi
	
	answer=$(echo "$response" | jq -r '.candidates[0].content.parts[0].text')
	echo "$answer"

}


