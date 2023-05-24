# compress and decompress in Linux Shell

1. `.gz file`, common in Unix system

```
gzip test.txt # will become test.txt.gz, you can add -c and redirect to make sure the original file won't be deleted
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

Specifically, `unzip` sometimes will run into error when decompressing files downloaded/compiled by Microsoft, in this case, best way is to 
first update the zip file using the utility `fix-onedrive-zip` downloadable from https://github.com/pmqs/Fix-OneDrive-Zip, make sure your `perl` is installed and your `fix-onedrive-zip` executable is in the same folder as the zip file you want to update, then:

```
perl fix-onedrive-zip file.zip
```

Now the updated zip file can be used for `unzip` as usual. This fix works for sharepoint as well.

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