#!/bin/bash
dir_book=BOOK
#echo nvm1
msg='[reminder] run: nvm1'
#echo nvm2
print ok "$msg"
cmd="gitbook serve $dir_book"
eval "$cmd"
ls $dir_book/_book -l
