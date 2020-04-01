#! /bin/sh

git add --all &
wait

git commit -m "edit post" &
wait

git push -f origin master
wait

