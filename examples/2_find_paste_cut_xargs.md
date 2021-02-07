# Find, xargs, paste, cut

Imagine you want to search for all the .txt files in a parental folder, and you want to merge them together horizontally.

```
find . -type f -name "*.txt" | xargs paste
```

Explaination:

```find``` is useful to find all files even the files sit under the child folders.

```xargs``` allows you to direct output to utilities that are not able to read the input line by line.

```paste``` is super useful to merge files horizontally.



If you want to pick a certain a certain column.

```
cut -d '\t' -f 1
```


