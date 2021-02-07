
# This is some of my notes before 2021/02/06, I will not update this files but start to maintain this Linux_Handbook_Bioinfo repository for all the 
# new insights that I want to share.



######## shortcut
# using VS code as default editor for shell script, command+K+C for block comment, command+K+U can undo that
# In unix system: Ctrl+A goes back to the first letter, Ctrl+E goes to the last letter
# Cont'd: Ctrl+ D terminate the current command, Ctrl+L clear the screen

###### resources
# personal onedrive, linux_courseware/geeksforgeeks/


#### configuration
# change the theme: open ~/.bash_profile(get executed when you are logged in) or ~/.bash_rc(everytime you open a new terminmal window, you should 
# modify /.bash_rc on cluster, mac should modify /.bash_profile), add the following to said files.

#export PS1="\e[0;31m[\u@\h \W]\$ \e[m"​
export CLICOLOR=1​
export LSCOLORS=GxFxCxDxBxegedabagaced (each two pairs – text color and bc color; 11 pairs In total representing 11 types of files)​
alias l="ls -al"   no spaces are allowed

# above PS1 would result longish command line wrap around the line, alterntive configuration
export PS1='\[\033[1;34m\]\$\[\033[0m\] '​
export CLICOLOR=1​
export LSCOLORS=GxFxCxDxBxegedabagaced


# shebang to specify the which shell to use
cat /etc/shells  # will output all available shells

# if one line is too long, use \ to newline, there is a space before \

# variable, the scope of a varibale is the shell in which the variable get defined
# the data type: file, line, numeric, string, array
var="test"    # no space is allowd !!!!!
echo $var   
echo ${var}   # line3 and line4 are the same, in case of confusion, line4 is recommended, they all mean the value of this variable
echo "$var"   # this is a better practice to use double quotation
echo $(echo $var)   # $() means execute the command in the parenthesis and will pass the internal output to the exteral command
echo `echo $var`    # equivalent to above command

# in-line arguments, 
$1, $2 .... ${10}
$*  # all the arguments were viewed as a whole, for i in "$*" , i will be the whole
$@ # all the arguments were viewed as individual, for i in "$@", i will be each argument
$#   # the number of arguments

# special character
$$ # current PID
$! # last process's PID in backend
$? # the result of last process, will be 0 if executed correctly, will be non-zero if not

# all the varibales
set  # display all the variables
unset var # delete variable

# bash arithmetic operation
echo $((5+10))
x=1
y=2
ans=$((x+y))
ans=$[$a/$b]   # bash doesn't support float-point operation, awk does.
temp=`expr 2 \* 3`   # \* means multiply, / means divide, % means take remainder

## or a more robust way
echo "$x / 100" | bc -l


# array

# index array
declare -a my_index_array    # declare -p a     to inspect the type of variable a
my_index_array+=(item1 item2)
echo ${my_index_array[@]}   # print all items
echo ${#my_index_array[@]}  # get the size
echo ${my_index_array[*]}   # print all items
echo ${my_index_array[1]}    # shell is 0-based
for i in "${my_index_array[@]}"; do echo "$i"; done   # iterate all items
for index in "${!my_index_array[@]}"; do echo "$index"; done   # iterate all indices
unset my_index_array[0]   # delete one item, but its index won't be replaced

# associated array
# https://linuxconfig.org/how-to-use-arrays-in-bash-script




# string
x="pattern"
echo ${#x}  # return the length of string
echo ${x:2:5}  # slicing the string, from position2, length=5, starting position is 0
task='0205'
task1=${task:0:2}    #02
task2=${task:2:2}    #05

echo ${text//[[:space:]]}   # remove all white space from a string


# aforementioned variables are only alive in this shell
# solution to make them permanent is to use export 
# then it will be saved in .bash_profile through which it will load automatically everytime you are logged into
export PATH=/data/home/mjchen/app/package:$PATH   # this is also how to add path to environment 
source /etc/profile   # activate the configuration file that we just made change to




# while loop, in-line format and formal format
# example1
cat list.txt | while read line; do echo $line; done
cat list.txt | while read line
do
echo $line
done

# example2
SUM=0
i=0
while [ $i -le $1]
do
	SUM=$[$SUM+$i]
	i=$[$i+1]
done
echo $SUM

# example3: until
ans="yes"
until [ $ans != "yes"]; do echo "Hi"; done





# for loop, in-line format and formal format is the same as above
# example 1
for i in ./srafiles/*; do echo $i; done    
for i in {1..500}

# example 2
SUM=0
for ((i=1;i<=100;i++))
do 
	SUM=$[$SUM+$i]
done
echo $SUM

# example 3
for i in {5..15..3}; do echo $i; done    # seems doesn't work


# different way to traverse files
for i in ./srafiles/*           # will return the relative path of every file in this folder
for i in ./srafiles              # will return the file name of every file in this folder

# backend
nohup echo "go to the backend"    # will throw the command to backend, stout will be appending into nohup.out
ps -es  # check all the processes
# then using PID
cd /proc/PID/fd 
ls -l    # will display the process's stdin, stdout, stderr, and their designated destination.

# sub-shell 
cat list.txt | while read line; do echo $line &;done  # amperand will throw each line into a sub-shell

# pipe
ls -al | cut -d "\t" -f 1    # the output of ls, ps, etc will also be used as input for other command
ps -ef | cut -d "\t" -f 1
ls | xargs touch            # for command that is not able to directly accept the last output, xargs could teach them process the last output line by line

# awk could handle all simple operations / arithematic calculation in each line
awk 'BEGIN {OFS="\t";F=[:-"\t"];}
    { if (NR > 3) {
	sum = 0;
	for (i=1;i<=NF;i++){
		sum += $i;
	}
	avg = sum/NF;
	sum = 0;
	for (i=0;i<=NF;i++){
		sum += ($i - avg)^2;
	}
	sd = sqrt(sum/NF);
	print $0, avg, sd; }

    else ($2 ~!/unix/){
        $4 = ""    # delete fourth column
        printf "var%s%s" $2 $3
    }
}' learnAWK.txt 


# sed could perform all kinds of substitution in each line
sed 's/unix/linux/g;s/1/2/g' file       # consecutive substitution


# interact with input
grep ${1} mRNA-ExonIDs.txt > mannual.txt    # ${1} menans first argument

echo -n "Enter matched position:"   # -n option means don't print the trailing newline \n
read pos        # it generate a variable pos, the value is equal to your input
echo $pos

awk -v awk_pos=$pos 'BEGIN{print "The matched one is"}    # pass the shell variable into awk namespace
{if (NR==awk_pos) print NR,$1,$2,$3,$4}
END{print "See aboved"}' mannual.txt

# if condition   :    a space is required after [ and before ]
# example 1:
if [ $another != 0 ]
then
    grep $another mRNA-ExonIDs.txt > mannual1.txt
    grep $another Hs_Ensembl_exon.txt > exonlist1.txt
elif []
then
    echo "OK,that's it"
else
	echo "Hi"
fi

# example2:
if [ 5 -gt 10 -o 10 -gt 4 ]   # -ge, -lt, -le      # -o means or, -a means and, ! means negation
then
	echo "Hi"
fi

# example3
# [ -f file ] means if it is a file ; [ -d file ] means if the file is a folder; [ -s file ] will be true when file exist and it is not empty; [! -s file]
if [ -e /root/shell/a.txt ] || [10 -gt 5]   # if exist this file   # && means and, || means or
then
	echo "Hi"
fi

# example 4
case $1 in
	"1")
	echo "Monday"
	;;
	"2")
	echo "Tuesday"
	;;
esac

# example 5
if [ -z "$str1" ]     # whether it is empty string
if [ -n "$str2" ]     # whether it is not empty string
if [ "$str1" == "$str2" ]
if [ "$str1" != "$str2" ]
if [[ "$str1" =~ "str2" ]]   

# a real example for integrating example4 and example5, determine if a substring occur in a string
i='TCGA-E2-A10A-01A-21R-A115-07.qsort'
j='TCGA-E2-A10A'

## method1
if grep -q "$j" <<< "$i"; then echo 'hi'; fi    # must use double quotation
## method2
​if [[ "$i" =~ .*"$j".* ]]; then echo 'hi'; fi
## method3
if [[ "$i" == *"$j"* ]]; then echo 'hi'; fi
## method4
​case ${i} in
	*"${j}"*)
	echo 'hi'
esac

# while and if 
while read line; do 
	if grep -q $1 $line; then 
		grep $1 $line | awk 'BEGIN{FS="\t";}{print $11}'
	else
		continue
	fi
done < tmp1.txt

# function

# built-in
basename include/stdio.h .h   # will return stdio, since here we specify the suffix, which will be trimmed off
dirname /usr/bin/    # will delete all content after last /, include / itself, if no /, then return '.' current path

# customized 
# in shell, every variable will be viewed as global variable unless you use local to declare in your function scope
function getSum(){
		local var="hi"
		SUM=$[$n1+$n2]
		echo "sum=$SUM"
		return 0     # return just used to denote whether this function is successfully executed or not
}

read -p "please type in first parameter n1: " n1
read -p "please type in second parameter n2 " n2

getSum $n1 $n2

# log file
./test.sh > log.dat 2>&1    # 0 means stdin, 1 means stdout, 2 means stderr, it means direct stderr to stdout, which is log.dat as well.



# parse the arguments
usage="Usage: $0 -S sample_name -I input_dir -O output_dir"
while getopts S:I:O: flag; do
    case $flag in
    S)
    sample=$OPTARG
    ;;
    I)
    input_dir=$OPTARG
    ;;
    O)
    output_dir=$OPTARG
    ;;
    \?)
    echo $usage >& 2    # redirect to stderr
    exit -1
    ;;
    esac
done
shift $(( OPTIND - 1));

# calculate running time
time your command

master_time_start=`date +%s`
# your program
master_time_end=`date +%s`
(master_time_exec=`expr $(( $master_time_end - $master_time_start ))`


# conda
module load anaconda3   # only on cluster
proxy_on   # only on cluster, before creating new environment or install packages
conda create -n env python = 3   # = means fuzzy match, == means exact match
conda create -p /path/to/folder/env python = 3.6
conda env list  # all the env
conda init --all bash  # only on cluster
conda/source activate env  # on cluster only use source
conda list -n env # show all the packages
conda list -n env scipy  # show specific package
conda remove -n env scipy # remove specific package
conda remove -n env --all # remove all env
conda deactivate # deactivate current env, no argument needed
proxy_on
pip install pyscenic -user  # -user only on cluster, install depends on the channels
conda config --add channels defaults
conda config --add channels bioconda
conda config --add channels conda-forge   # these are settings for anaocnda, not specific environment
conda install -c bioconda scanpy
conda install -c  anaconda git

pip install pandas --upgrade




# chmod
chmod -R 777 folder   # change the permission of the whole folder
umask 022 
umask 0022

# so by default, a newly-created file would have 666 permission, newly-created folder will have 777 permission, for example
# umask = 022, then a newly-created file would have 644 permission (666-022), newly-created folder will have 755 permission (777-022)

# sed 
sed '/HLA-B44:01/d' file   # delete the line containing 'HLA-B44:01'

# sort
sort -t ',' -k3,3 file   # sort by column3-column3

# add one line at the begining
{ echo "adding text"; cat $file; } > new.file  

# change delimiter
awk '{$1=$1}1' FS="," OFS="\t" file
# concat two column
awk '{print $4$5}' file
# awk length filter
awk 'length($4) < 8 print{$0}'
# awk max value
awk 'n < $0 {n=$0}END{print n}'
# directly change to fasta, how to do formatted print
cat hla2paratopeTable.txt | awk '{ printf ">%s\\n%s",$1,$2 }'
# convert horizotal one line to vertical layout
​cat counts.TCGA-BRCA.txt | head -n 1 | awk '{for(i=0;i<=NF;i++){print $i}}'
# convert vertical layout to horizontal
echo $(seq 3 | tr -d '\n' | awk '{$1=$1}1' FS="" OFS="\t")
# compute count/sum
cat tmp5.txt | while read line; do cat $line | awk 'BEGIN{FS="\t";count=0;}{if(NR>1){count+=$11}}END{print count}'; done > tmp12.txt


# shuffle along rows
shuf file

# echo recognize escaping
echo -e "hi\tIam\n"

# head and tail
head -n -4  # exclude last 3 lines, ends at the 4th last line
tail -n +4 # exclude first 3 lines, starts at the 4th line

# split by pattern
csplit my_file '/pattern/+1' {n}   # each subfile from the beginning to the start of the matching line, not include the matching line, matching line will become the 
# first line for next round of matching, we offset by 1 meaning include the matching line, shift the cursor forward by 1. n means repeat the matching n more times, if 
# don't specify, it will proceed 1 time, 3 means do it 2 times again.


# anytime you need a count
count=0
while read line; do
	count=$[$count+1]     # shell doesn't that explicit about if a value is integer or string, but this way is a safebet if you iniatilize the variable as a int
	