#!/bin/bash

# 兼容zsh
# export DISABLE_AUTO_TITLE="true"

session="work"

tmux has-session -t $session
if [ $? = 0 ];then
    tmux attach-session -t $session
    exit
fi

tmux new -d -s $session

tmux renamew -t $session:1 ros
tmux select-window -t $session:ros
tmux source-file ~/.tmux/mylayout
tmux send-keys -t $session:ros.1 'fish' Enter
tmux send-keys -t $session:ros.2 'fish' Enter
tmux send-keys -t $session:ros.3 'fish' Enter

tmux new-window -t $session:2 -n chat
tmux select-window -t $session:chat
tmux source-file ~/.tmux/mylayout
tmux send-keys -t $session:chat.1 'fish' C-m
tmux send-keys -t $session:chat.1 'cd /home/hack.chat;node server.js' C-m
tmux send-keys -t $session:chat.2 'fish' C-m
tmux send-keys -t $session:chat.2 'cd /home/hack.chat/client;http-server -p 11111' C-m
tmux send-keys -t $session:chat.3 'fish' Enter

tmux new-window -t $session:3 -n mojo
tmux select-window -t $session:mojo
tmux source-file ~/.tmux/mylayout
tmux send-keys -t $session:mojo.1  'fish' C-m
tmux send-keys -t $session:mojo.1  'cd /home/mojo_web;morbo Mojo_web.pl' C-m
tmux send-keys -t $session:mojo.2  'fish' C-m
tmux send-keys -t $session:mojo.3  'fish' C-m

tmux new-window -t $session:4 -n excel
tmux select-window -t $session:excel
tmux source-file ~/.tmux/mylayout
tmux send-keys -t $session:excel.1  'fish' C-m
tmux send-keys -t $session:excel.1  'cd /usr/local/node-v8.5.0-linux-x64/lib/node_modules/ethercalc/bin;ethercalc' C-m
tmux send-keys -t $session:excel.2  'fish' C-m
tmux send-keys -t $session:excel.3  'fish' C-m

tmux new-window -t $session:5 -n upload
tmux select-window -t $session:upload
tmux source-file ~/.tmux/mylayout
tmux send-keys -t $session:upload.1  'fish' C-m
tmux send-keys -t $session:upload.1  'cd /home/upload;morbo -m production -l http://[::]:4000 ./upload.pl' C-m
tmux send-keys -t $session:upload.2  'fish' C-m
tmux send-keys -t $session:upload.2  'cd /home/upload;morbo -m production -l http://[::]:4001 ./android_upload.pl' C-m
tmux send-keys -t $session:upload.3  'fish' C-m

tmux new-window -t $session:6 -n mock
tmux select-window -t $session:mock
tmux source-file ~/.tmux/mylayout
tmux send-keys -t $session:mock.1  'fish' C-m
tmux send-keys -t $session:mock.1  'cd /home;plackup --port 12345 -r --access-log mock.log mock.psgi' C-m
tmux send-keys -t $session:mock.2  'fish' C-m
tmux send-keys -t $session:mock.2  'cd /home' C-m
tmux send-keys -t $session:mock.3  'fish' C-m
tmux send-keys -t $session:mock.3  'cd /home;tail -f mock.log' C-m

tmux select-window -t $session:ros
# tmux attach-session -t $session

