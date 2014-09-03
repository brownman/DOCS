
set -o nounset
trap_error(){
echo `caller`
exit
}
trap trap_err ERR
use print
use commander 
use dialog_confirm
use vars

dir_book=BOOK
cmd="gitbook build $dir_book"
print error "[WARNING] this will override the directory: BOOK/_book "
echo contine?
read answer
if [ $answer = y ];then
    echo "confirm again.."
#dialog_confirm "$cmd"
$cmd
fi

dirname1=${date_ws}_${time_ws}
echo keep the git
commander mv BACKUP/NEW/.git BACKUP/git
echo backup recent website
commander mv BACKUP/NEW  BACKUP/BANK/$dirname1
echo declaring new website
commander mv $dir_book/_book  BACKUP/NEW
echo moving back the .git folder
commander mv BACKUP/git BACKUP/NEW/.git
echo validating existance of the .git folder
commander ls -ld BACKUP/NEW/.git 

