## Common downloading scenario

1. a FTP protocol, but no login credential

```bash
wget -r -l1 --no-parent ftp://massive.ucsd.edu/MSV000080527/raw/RAW/B5101/

# -r recursive, this can download a folder
# -l1 maximum depth is 1
# --no-parent don't ascend to parental folder
```

2. FTP protocol, single file

```bash
wget ftp://ftp.ebi.ac.uk/pride-archive/2017/11/PXD007635/OvCa111_classI_Rep%231.raw
# although it may seem to be http in the browser, we have to change it to ftp
# make sure there's not special character in the URL, # needs to be escaped by %23
```

3. HTTP protocol, single file

```bash
curl -0 after_pca.txt https://raw.githubusercontent.com/frankligy/DeepImmuno/main/reproduce/data/after_pca.txt
# OR
curl https://raw.githubusercontent.com/frankligy/DeepImmuno/main/reproduce/data/after_pca.txt > after_pca.txt
```


4. download srr

```bash
module load sratoolkit/2.10.4
cut -f 1 srr_list.txt | xargs -L 1 -P 4 fasterq-dump   # first compile a list with all your srr id, enable parallel downloading
for file in *.fastq; do gzip $file; done   # also, gzip the fastq
```