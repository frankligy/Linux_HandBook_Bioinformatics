# WC command

You can use `wc` utility to check the number of lines. Remember, it always count the number of newlines. So if you forget to press "enter" key in your last line, `wc -l` will return one less result. In order to check, using `cat` to view your file before using `wc`.

## Examples

Basic usage:
```
wc -l ../data/file1.txt
#        4 file1.txt
```

If you only needs the number `4`:
```
cat ../data/file1.txt | wc -l
#       4
```