# Shell data type

## String

```
var="test"    # no space is allowd !!!!!
echo $var   
echo ${var}   # line3 and line4 are the same, in case of confusion, line4 is recommended, they all mean the value of this variable
echo "$var"   # this is a better practice to use double quotation
echo $(echo $var)   # $() means execute the command in the parenthesis and will pass the internal output to the exteral command
echo `echo $var`    # equivalent to above command
```

```
x="pattern"
echo ${#x}  # return the length of string
echo ${x:2:5}  # slicing the string, from position2, length=5, starting position is 0
task='0205'
task1=${task:0:2}    #02
task2=${task:2:2}    #05

echo ${text//[[:space:]]}   # remove all white space from a string


```

## int and float

shell doesn't support float in general.

```
echo $((5+10))
x=1
y=2
ans=$((x+y))
ans=$[$a/$b]   # bash doesn't support float-point operation, awk does.
temp=`expr 2 \* 3`   # \* means multiply, / means divide, % means take remainder
```

This is one way to get float point in shell.
```
echo "$x / 100" | bc -l
```

## array

```
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
```
