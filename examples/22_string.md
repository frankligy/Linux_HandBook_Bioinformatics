## Array 

String manipulation


### get length, slicing
```bash
x="pattern"
echo ${#x}  # return the length of string
echo ${x:2:5}  # slicing the string, from position2, length=5, starting position is 0
task='0205'
task1=${task:0:2}    #02
task2=${task:2:2}    #05
```


### split
```bash
bn=groups.YBX3_shRNA_K562.txt
arrbn=(${bn//./ })  # split by . (replace with space), then convert to array
id=${arrbn[1]}  # YBX3_shRNA_K562
```

