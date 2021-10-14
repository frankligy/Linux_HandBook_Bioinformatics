## common commands for txt wrangling

First check the following cheetsheets, then geekforgeek, finally man page.

### 1. sort

sort first bases on first column, lexigraphical order, then second column, numeric order....
```
sort -k1,1 -k2,2n -k3,3n input.txt > output.txt
```

### 2. cut

```
cut -d "\t" -c 2 intput.txt > output.txt
```





