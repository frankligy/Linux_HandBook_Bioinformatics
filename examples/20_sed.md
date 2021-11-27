## sed


1. replace is the main functionality

```bash
sed 's/unix/linux/g;s/1/2/g' file       # consecutive substitution
```


2. delete lines

```bash
sed '/HLA-B44:01/d' file   # delete the line containing 'HLA-B44:01'
```

