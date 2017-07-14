# Smelt: Batch Package Manager
## Install this package manager:
1. Download the `smelt` folder and its contents.
2. Double-click `install.bat`
3. There will be two new folders: `logs` and `extension`.
4. You're done!
----
* [Install commands pre-downloaded from other sources](#install-local)
* [Install commands available here](#install-global)
* [Upgrade commands pre-downloaded from other sources](#upgrade-local)
* [Upgrade commands available here](#upgrade-global)
* [Uninstall commands the long way](#uninstall-long)
* [Uninstall commands the short way](#uninstall-short)
----
<h2 id="install-local">To install commands pre-downloaded from other sources:</h2>

1. Move the downloaded commands into the `extension` folder.
2. Double-click `install.bat`
3. You're done! A log of what happened will be available at `logs\install.log`.

<h2 id="install-global">To install commands available here:</h2>

1. Open Command Prompt (Win+R, type `cmd` and hit Enter/Win+X, C)
2. Type `sbpm install <package>`, replacing `<package>` with the name of the desired package.
3. You're done! A log of what happened will be available at `logs\install.log`.

<h2 id="upgrade-local">To upgrade commands pre-downloaded from other sources:</h2>

1. Delete the previous versions of the commands from the `extension` folder.
2. Move the new versions into the `extension` folder.
3. Double-click `reinstall.bat`
4. You're done! A log of what happened will be available at `logs\uninstall.log` and `logs\install.log`.

<h2 id="upgrade-global">To upgrade commands available here:</h2>

1. Open Command Prompt (Win+R, type `cmd` and hit Enter/Win+X, C)
2. Type `sbpm install <package> /u`, replacing `<package>` with the name of the desired package.
3. You're done! A log of what happened will be available at `logs\install.log`.

<h2 id="uninstall-long">To uninstall commands (the long way):</h2>

1. Delete the unwanted commands from `extension`.
2. Double-click `reinstall.bat`
3. You're done! A log of what happened will be available at `logs\uninstall.log` and `logs\install.log`.

<h2 id="uninstall-short">To uninstall commands (the short way):</h2>

1. Open Command Prompt (Win+R, type `cmd` and hit Enter/Win+X, C)
2. Type `sbpm uninstall <package>`, replacing `<package>` with the name of the desired package.
3. You're done! A log of what happened will be available at `logs\uninstall.log`.
