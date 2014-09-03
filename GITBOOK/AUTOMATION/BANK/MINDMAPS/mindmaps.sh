#echo `ls -1g --time-style="+%m_%Y" | cut -d' ' -f7`
#stat --printf "Last access: %x\nLast modification: %y\nLast change %z\n" your.file
#stat --printf "%y" your.file
#git log --format=%aD

set -e
set -o nounset


set_env(){
file_list=/tmp/images.txt
file_list0=/tmp/images0.txt
dir_mindmaps="$dir_root/6/VENDOR/mindmap_aday"
dir_image=$dir_mindmaps/IMAGE
}

git_pull(){
cd "$dir_mindmaps"
git pull 2>/tmp/err
ls -1t $dir_image 1>$file_list

}
create_list(){
#ls $dir_image -1g --time-style="+%m_%Y" | cut -d' ' -f7- 1>$file_list
ls -1 $dir_image >/tmp/0
cat /tmp/0
while read line;do
file="$dir_image/$line"
#echo "$file"
git log --format=%aD "$file"
done </tmp/0
#-1g --time-style=\"+%m_%Y\""
#commander "$cmd"
}

parse_list(){
dir_source="$dir_vendor/mindmap_aday"
while read line;do
#echo "$line"
  #  time=$( echo $line | cut -d' ' -f1 )
    file=$( echo $line | cut -d' ' -f1 )
#echo "$str"
filename=`basename "$file" | cut -d'.' -f1`
#filename=`basename "$str" | cut -d'.' -f1`
echo "- [$filename](https://raw.githubusercontent.com/brownman/mindmap_aday/master/IMAGE/${file})"
done <$file_list
#cat /tmp/out 
}
steps(){
    set_env
   git_pull 
#   create_list > $file_list0
   #create_list
   #1>$file_list0
#   return
   #cat $file_list0 | cut -d' ' -f5- > $file_list
   #cat $file_list
   parse_list 1>/tmp/out
#   cat -n /tmp/out
   cat /tmp/out | xsel --clipboard
   cat /tmp/out | head -2
#  update_clipboard "`cat /tmp/out`"
}
steps
