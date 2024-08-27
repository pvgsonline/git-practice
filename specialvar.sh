#!/bin/bash

echo "All variables passed to the script : $@ "
echo "Number of variables passed : $# "
echo "Script name : $0 "
echo "Current working directory : $PWD"
echo "Home directory of the current user : $HOME"
echo "PID of teh script executing : $$ "
sleep 100 &
echo "PID of the background command : $! '
