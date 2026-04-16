## awk

1. the outmost quatation is single quatation
2. space is not important
3. the string should be in double quatation

```bash
# by default, it can handle any whitespaces
awk '$3 ~ /ERV/' input.txt

awk '$5 !~ /^ENSG/' input_file.txt

awk '$5 != "None"' input_file.txt

awk '{print $1}' input_file.txt

awk '$5 ~ /\([7-9]\/9\)/' input_file.txt # match (7/9) or (8/9) or (9/9)
```

```bash
# long version
awk 'BEGIN {OFS = "\t"} {if ($3 == "AAAWYLWEV" || $3 == "AAGLQDCTM" || $3 == "AARNIVRRA") {print $3, length($3),$2,$13, $15}}'
```





