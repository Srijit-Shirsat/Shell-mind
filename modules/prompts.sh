#!/bin/bash

get_error_prompt(){
	cat <<EOF
You are a Linux expert.

Analyze the following Linux error and provide:

1. Cause
2. Solution
3. Command(s) to fix it (if applicable)
4. Prevention tip (1-2 lines)

Keep the response concise, beginner-friendly, and focused on Ubuntu Linux.

Error:
$err
EOF
}
