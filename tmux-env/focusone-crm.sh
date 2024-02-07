#!/bin/sh 
cd /Users/twoeight/Desktop/FocusOneCRM
tmux new-session -s "dev-tmux" -d
cd /Users/twoeight/Desktop/focus-one-link
tmux split-window -h
cd /Users/twoeight/Desktop/circulo
tmux split-window -v
tmux -2 attach-session -d 

