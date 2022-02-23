## common commands for txt wrangling

First check the following cheetsheets, then geekforgeek, finally man page.

### 1. sort

sort first bases on first column, lexigraphical order, then second column, numeric order....
```bash
sort -k1,1 -k2,2n -k3,3n input.txt > output.txt
sort -u input.txt > output.txt   # retain unique rows
```

### 2. cut

```bash
cut -d "\t" -f-4,5-5,7- intput.txt > output.txt
```


### 3.split
we want to split a file by row and each file contains 273 rows
```bash
split -l 273 --additional-suffix ".txt"
```

### 4. uniq
```bash
# only unique lines
uniq -u file.txt
# only repeat lines
uniq -d file.txt
```

### 5. shuf
```bash
shuf input.txt
```








