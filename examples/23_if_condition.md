## If condition

### it is required to have a whitespace in the two end within the square bracket
### it is advisable to enclose string variable

1. Basic logis for numerical

```bash
if [ $var != 0 ]     # ! means negation, -o means or (|| is the same), -a means and (&&)
then
    echo "ha"
elif [ $var -gt 0]   # -gt greater, -lt less than, -le less or equal -ge greater or equal == equal
then
    echo "haha"
else
	echo "hahaha"
fi
```

2. special symbol for special meaning

```bash
if [ -d folder ]; then
    echo "folder exists"
fi

if [ -f file ]; then
    echo "file exists"
fi

if [ ! -z "$string" ]; then
    echo "variable is not empty"
else
    echo "variable is empty"
fi
```


3. String comparison

```bash
# whether j is a substring of i
if [[ "$i" == *"$j"* ]]; then echo 'hi'; fi
```

