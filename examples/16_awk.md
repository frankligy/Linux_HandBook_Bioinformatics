## awk

1. the outmost quatation is single quatation
2. space is not important
3. the string should be in double quatation

```bash
awk -F "\t" '$3 ~ /ERV/' input.txt
```

```bash
awk 'BEGIN {OFS = "\t"} {if ($3 == "AAAWYLWEV" || $3 == "AAGLQDCTM" || $3 == "AARNIVRRA") {print $3, length($3),$2,$13, $15}}'
```





