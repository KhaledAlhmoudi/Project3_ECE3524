#!/usr/bin/bash

if (( $# != 0 )); then #check that there are exactly 2 agruments inputted

     echo "Invalid Argument Number" #print error message

    exit #exit program

fi

dname="$1" #obtain the target directory

fname="$2" #obtain the file name
filepath=`pwd`
fstart="$1"
fstart="${fstart:2}" #manipulate the input string to generate the file header
ded="/filename.html"
varr=$filepath$ded
cd ~ #change into the tagret directory
#use find . with -perm -444 to only find directores that are atleast readable and send any error messages to null
#use the sed command to start eliminatg all text untl the last / is ecountered and replace it with |-- to act as the nodes
find . -perm -444 2>/dev/null | sed -e "s/[^-][^\/]*\// |---/g" -e "s/|\([^ ]\)/|-\1/" > file

head -n -1 file > temp.txt ; mv temp.txt file #delete the last line of the text file that includes the output file
{ printf '%s\n' "$fstart"; sed '1d' file; } > tmp.txt && mv tmp.txt file #replace the first line in the output file with the title of the directory
awk '{print $0 "</br>"}' file >file2 #print </br> in each line so that the html text gets formatted properly

mv file2 $varr #use the argument name
rm file

cd $filepath #go to home
markdown filename.html >htm #use markdown to convert file to html format
mv htm filename.html #change the name of the resulting html file







