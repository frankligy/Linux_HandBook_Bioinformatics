# compress and decompress in Linux Shell

1. `.gz file`, common in Unix system

```
gzip test.txt # will become test.txt.gz
gunzip test.txt.gz # the gz file will diasppear   # sometimes it will not work, using zcat can remedy that
gunzip -c test.txt.gz > test.txt  # -c only to stdout, need to redirect
zcat test.txt.gz > test.txt  # same as gunzip -c
zcat < test.txt.gz > test.txt # may work better at MacOS
```

2. `.zip file`

```
zip -r file.zip /folder1 /folder2   # zip several folders
zip file.zip file1.txt file2.txt    # zip several txt files
unzip file.zip  # original archive will not disapper
unzip -l file.zip  #list the contents of a zip file
unzip -n file.zip  #skip the content in the zip file that has already been decompressed and exist in current folder
```

3. `tar.gz file`, archive file

```
tar -czvf folder.tar.gz folder

# -c : create an archive
# -z : gzip the archive
# -v : verbose, display the progress
# -f : specify the tar.gz file name

tar -xzvf folder.tar.gz

# -x : extract the archive
```