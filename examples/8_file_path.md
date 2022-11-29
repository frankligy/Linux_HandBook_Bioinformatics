## manipulate file path


Get basename

```
basename -s .txt /path/sub/file.txt   # will be "file"
basename -s .R1.fastq.gz path/sub/sample.R1.fastq.gz
```

Get basename + abspath

```
x='/path/sub/file.txt.gz'
y=${x%.*}  # delete stuff after the dot
echo $y  # will be '/path/sub/file.txt'
```