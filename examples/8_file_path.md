## manipulate file path


Get basename

```
basename /path/sub/file.txt .txt  # will be "file"
```

Get basename + abspath

```
x='/path/sub/file.txt.gz'
y=${x%.*}  # delete stuff after the dot
echo $y  # will be '/path/sub/file.txt'
```