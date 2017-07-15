#!/bin/bash
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
if [ -d "$DIR/logs" ]; then
	mkdir "$DIR/logs"
fi
if ["$1" = "-h"]; then
	printf "Installs a command.\r\n\r\nsbpm install <package> [-u | --upgrade]\r\n\r\n  package         Name of the package to be installed.\r\n  --upgrade       Upgrades the specified package (used to avoid overwrite prompts)
fi
