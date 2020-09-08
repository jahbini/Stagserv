#!/bin/bash
cd /home/retro/stagserv
#cp nohup.out sessions/server.log
#>nohup.out
cd sessions
git add .
git commit -m " commit as of `date`"
git push origin

