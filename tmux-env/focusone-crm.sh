#!/bin/sh 
cd /Users/twoeight/Desktop/FocusOneCRM
tmux new-session -s "dev-tmux" -d
tmux split-window -h
cd /Users/twoeight/Desktop/focus-one-link
tmux split-window -v
cd /Users/twoeight/Desktop/circulo
tmux -2 attach-session -d 

