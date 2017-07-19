#!/bin/bash
set +v
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
if [ ! -d "$DIR/logs" ]; then
	mkdir "$DIR/logs"
fi; if ["$1" = "-h"]; then
	printf "Installs a command.\r\n\r\nsbpm install <package> [-u | --upgrade]\r\n\r\n  package         Name of the package to be installed.\r\n  --upgrade       Upgrades the specified package (used to avoid overwrite prompts)"
elif ["$1" = ""]; then
	if [ ! -d "$DIR/extension" ]; then
		mkdir "$DIR/extension"
		printf "'Extension' folder doesn't exist, created and terminated."
		exit
	fi
	printf "Copy bash files..."
	printf "Copy bash files..." > "$DIR/logs/install.txt"
	cp "$DIR/extension/*.sh" ~ >> "$DIR/logs/install.txt"
else
	if ["$2" = "--upgrade"] || ["$2" = "-u"]; then
		printf "Deleting bash file..."
		printf "Deleting bash file..." > "$DIR/logs/install.txt"
		rm ~/$1.sh >> "$DIR/logs/install.txt"
	fi
	printf "Downloading bash file..."
	wget -O ~/$1.sh "https://smelt-modding.github.io/bash-packages/$1.sh"
fi
printf "Add aliases..."
printf "Add aliases..." >> "$DIR/logs/install.txt"
TEXT=""
for i in "$DIR/extension/*.sh"; do
	FILE=$(basename "$i")
	NAME="${FILE%.*}"
done
