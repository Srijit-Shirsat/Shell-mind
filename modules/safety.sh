#!/bin/bash

dangerous_commands() {

    local cmd="$1"

    dangerous_commands=(
        "rm -rf"
	"rm -f"
        "mkfs"
        "dd"
        "shutdown"
        "reboot"
        "poweroff"
        "init 0"
        "chmod -R 777 /"
        "chown -R"i    ":(){ :|:& };:"
    )

    for dangerous in "${dangerous_commands[@]}"
    do
        if [[ "$cmd" == *"$dangerous"* ]]; then
            return 0
        fi
    done

    return 1
}
