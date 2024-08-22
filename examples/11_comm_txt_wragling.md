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

### 6. concat
```bash
# vertically
cat file1.txt file2.txt
# horizontally
paste file1.txt file2.txt
```

### 7. comm
```bash
# 1,2,3 mean unique to file1, unique to file2, comm to file1+file2
# -12 means suppress 1 and 2
comm -12 file1.txt file2.txt
```

### 8. tail and haed
```bash
# get rid of first line
cat file.txt | tail -n +2   
```

### 9. tr

```bash
# inspect the new line character
cat -v sample.txt 
# remove
echo $line | tr -d '\n'
echo $line | tr -d '\r'
```

### 10. grep acts like comm and filter

```bash
grep -Fxvf done.txt all.txt > absent.txt
grep -Ff absent.txt complete_df.txt > filter_df.txt
grep -Fvf done.txt complete_df.txt > filter_df.txt


# F is fixed string, no regex
# x is match whole line
# v is inverted match
# f is supply a file
```








