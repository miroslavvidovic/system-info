#!/usr/bin/env bash

# -------------------------------------------------------
# Info:
# 	Miroslav Vidovic
# 	system-info.sh
# 	08.07.2016.-17:13:54
# -------------------------------------------------------
# Description:
#   Run all system info scripts to generate html pages.
# Usage:
#   sudo bash system-info.sh
# -------------------------------------------------------
# Script:

cd scripts
scripts=(*)
for script in "${scripts[@]}"
do
  echo $script
  sudo bash $script
done


exit 0
