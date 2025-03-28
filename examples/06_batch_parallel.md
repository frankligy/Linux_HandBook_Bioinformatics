# Batch processing and parallelization using Shell command

1. Put the input you want to pass to the program (either built-in like curl or custom function) as a txt file. Let's use one line as a entire unit.

2. using `cat` and associated functions like `xargs` and `parallel`

```bash
# built-in function, -n (how many to pass each time), the content passed from cat will be grouped as a {} and sent to the shell command
cat test.txt | xargs -n 1 -P 10 -I {} bash -c "curl {}"
cat test.txt | xargs -n 2 -P 10 -I {} bash -c "curl {}"   # if each row is one sample, n=2 will feed 2 rows to each core
cat test2.txt | xargs -n 2 -P 10 -I {} bash -c "run {}"   # if each row has two samples, n=2 will feed each row as $1 and $2 to the core
 
# custom function
function cutsom_function() {
    echo "hello $1"
}
export -f custom_function
export TMPDIR=/scratch/ligk2e
cat test.txt | parallel -P 10 custom_function {}
```

Here, it is important to register your custom_function to the global environment, so the subprocess running by `parallel` or `xargs` can access. `P` means the number of cores to employ.


2. Using `while read` and associated syntax

```bash
while read line; do echo $line; done < test.txt
while read line; do echo "$line" | awk -F "\t" '{print $3}'; done < test.txt
```

3. using `for` to traverse all matched files

```bash
for file in *.fastq.gz; do echo $file; done
```

```bash
for ((i=0; i<10; i++)); do echo $i; done
```

4. Another useful trick is to split string and assign the subset to more than 1 variables.

```bash
read var1 var2 <<< "name grade"
echo $var1 $var2
```

Since whilespace, tab are default `IRS`, you don't need to specify. But if not:

```bash
IFS=- read var1 var2 <<< "name-grade"
```

