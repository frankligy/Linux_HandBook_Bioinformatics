## manipulate file path

```
basename -s .R1.fastq.gz path/sub/sample.R1.fastq.gz # will be sample
dirname /path/sub/file.txt  # will be /path/sub
basename $(dirname /path/sub/file.txt) # will be sub, so basename will no suffix
```

```
x='/path/sub/file.txt.gz'
y=${x%.*}  # delete stuff after the dot
echo $y  # will be '/path/sub/file.txt'
```