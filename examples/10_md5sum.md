## checking md5sum is important

Two ways to do that usually, when you have a bunch of files you want to check:

### Parallelize, followed by manual check
```bash
cat files_to_check.txt | xargs -L -P 10 md5sum > md5sum_hash_output.txt
```

### sequential, but programmatically check
You first need to build a file (correct_md5sum_hash.txt) like below, two space in between, this is tricky because scripting langulage like Python pandas, it requires delimiter 
to be string of length one. So please first one rarely-used delimiter like "#", then replace them with "  " double whitespace.
```bash
9bc85c9cdbcc88403efa8cbb15044e59  ./fastq/file1.fastq.gz
2198d365235604d0b3eb2a0280acc1b9  ./fastq/file2.fastq.gz
e21cf370ddb9eddd07c9f8b8be58ba9f  ./fastq/file3.fastq.gz
81b902e7cbfa65544837f35a1acf46c4  ./fastq/file4.fastq.gz
2f9046ce528a0a649b0ecf15d8e541f6  ./fastq/file5.fastq.gz
8257ed47ee19ec3a236dc4c85b4645c8  ./fastq/file6.fastq.gz
213d836c8955a59f1763e5c3b1e02cdb  ./fastq/file7.fastq.gz
c6928885a982b20ac5148043710b4c16  ./fastq/file8.fastq.gz
536c2c751398bfe656ce92d1232abca7  ./fastq/file9.fastq.gz
fedb4616b7e2819846983b4195a84ece  ./fastq/file10.fastq.gz
```

then, run below, check the stdout and stderr
```
md5sum -c correct_md5sum_hash.txt
```





