## Common downloading scenario

1. a FTP protocol, but no login credential

```bash
wget -r -l1 --no-parent ftp://massive.ucsd.edu/MSV000080527/raw/RAW/B5101/

# -r recursive, this can download a folder
# -l1 maximum depth is 1
# --no-parent don't ascend to parental folder
```


2. download srr

```bash
module load sratoolkit/2.10.4
cut -f 1 srr_list.txt | xargs -L 1 -P 4 fasterq-dump   # first compile a list with all your srr id, enable parallel downloading
for file in *.fastq; do gzip $file; done   # also, gzip the fastq
```