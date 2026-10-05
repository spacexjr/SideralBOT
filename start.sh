#!/bin/bash

clear

printf '\033[38;5;39m'
echo '   ███████╗██╗██████╗ ███████╗██████╗  █████╗ ██╗'
echo '   ██╔════╝██║██╔══██╗██╔════╝██╔══██╗██╔══██╗██║'
printf '\033[38;5;45m'
echo '   ███████╗██║██║  ██║█████╗  ██████╔╝███████║██║'
echo '   ╚════██║██║██║  ██║██╔══╝  ██╔══██╗██╔══██║██║'
printf '\033[38;5;99m'
echo '   ███████║██║██████╔╝███████╗██║  ██║██║  ██║█████║'
echo '   ╚══════╝╚═╝╚═════╝ ╚══════╝╚═╝  ╚═╝╚═╝  ╚═╝╚════╝'
printf '\033[38;5;141m'
echo ''
echo '              ✦  S I D E R A L B O T  ✦'
echo '              Discord × Minecraft Bedrock'
printf '\033[0m'

echo '==================================='
echo 'Node and NPM versions:'
node -v
npm -v
echo '==================================='

if [ ! -d "node_modules" ]; then
    echo "[SideralBOT] Dependencies not found."
    echo "[SideralBOT] Running npm install..."
    npm install
else
    echo "[SideralBOT] Dependencies already installed."
fi

echo '==================================='
echo "[SideralBOT] Starting..."
node index.js
