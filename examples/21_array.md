## Array 

Array can be useful when you want to execute functions on a series of input

### Index Array

```bash
declare -a index_array=(item1 item2 item3)
index_array+=(item4)
for item in ${index_array[@]} 
do 
    function $item
done
```


To explain,

`${index_array[@]}` can print all items
`${#index_array[@]}` can print the length of the array
`${!index_array[@]}` can print all indices of items
`${index_array[*]}` can print all items
`${index_array[1]}` print the second item



### Associate Array

instead of using 0-1 as key, you can specify the key as string

