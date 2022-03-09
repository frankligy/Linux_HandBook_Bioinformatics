# Batch processing and parallelization using Shell command

1. Put the input you want to pass to the program (either built-in like curl or custom function) as a txt file. Let's use one line as a entire unit.

2. using `cat` and associated functions like `xargs` and `parallel`

```bash
# built-in function
cat test.txt | xargs -L 1 -P 10 -I {} sh -c "curl {}"
# custom function
export -f custom_function
export TMPDIR=/scratch/ligk2e
cat test.txt | parallel -P 10 custom_function {}
```

Here, it is important to register your custom_function to the global environment, so the subprocess running by `parallel` or `xargs` can access. `P` means the number of cores to employ.

The custom function accept one line! In terms of how to construct own function and pass argument, see the example below:

```bash
# define, passed arguments will be $1 and $2
function custom(){
    result=$1+$2
    return 0
}
# run, passed arguments will be $1 and $2
custom 4 5
```


3. Using `while read` and associated syntax

```bash
while read line; do echo $line; done < test.txt
while read -r var1 var2; do whatever; done < test.txt
```

4. using `for` to traverse all matched files

```bash
for file in *.fastq.gz; do echo $file; done
```

```bash
for ((i=0; i<10; i++)); do echo $i; done
```

5. Another useful trick is to split string and assign the subset to more than 1 variables.

```bash
read var1 var2 <<< "name grade"
echo $var1 $var2
```

Since whilespace, tab are default `IRS`, you don't need to specify. But if not:

```bash
IFS=- read var1 var2 <<< "name-grade"
```

