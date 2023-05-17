# Permission of files


## Permission string

```
-rwx------@  1 ligk2e  staff   180M Oct 24  2020 Hs_Ensembl_exons_100.txt
-rwx------@  1 ligk2e  staff   164M Dec 23  2021 Hs_Ensembl_exons_91.txt
-rwx------@  1 ligk2e  staff   101M Mar 20  2018 Hs_Ensembl_exons_91_ori.txt
drwxr-xr-x   3 ligk2e  staff    96B Apr  3 12:42 ProteoWizard
```

`-` is regular file, `d` means folder, `@` at the end indicates there is extra attributes associated with this file. `l` means soft link, you can create softlink (short-cut) for both file or folder.

```bash
ln -s ./test_may_23 test_soft_link_folder
ln -s ./check.txt test_soft_link_file.txt 
```

## Number of hard links

Second column means how many hard links, regular file should be 1 as there is one hard link (no short cut) pointing to the actual data, the folder may have hard links more than 1 as they have multiple files in the directory. Soft link is also 1.


## owner and the group of file

You can check `cat /etc/group` to check all the group, it is displayed like:

```bash
# group_name:password:GID:user_list_sep_by_comma, no user_list means no users assgined
group:*:16:
staff:*:20:root
```

You can change the permission:

```bash
# r-4,w-2,x-1
chmod 765 file.txt
chmod -R 765 folder
```

You can change the group or user

```bash
chown :newgroup file.txt
chown newuser file.txt
chown newuser:newgroup file.txt
```