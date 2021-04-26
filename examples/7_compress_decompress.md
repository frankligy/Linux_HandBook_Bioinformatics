# compress and decompress in Linux Shell

1. `.gz file`, common in Unix system

```
gzip test.txt # will become test.txt.gz
gunzip test.txt.gz # the gz file will diasppear
gunzip -c test.txt.gz > test.txt  # -c only to stdout, need to redirect
zcat test.txt.gz  # same as gunzip -c
```

2. `tar.gz file`, archive file

```
tar -czvf folder.tar.gz folder

# -c : create an archive
# -z : gzip the archive
# -v : verbose, display the progress
# -f : specify the tar.gz file name

tar -xzvf folder.tar.gz

# -x : extract the archive
```