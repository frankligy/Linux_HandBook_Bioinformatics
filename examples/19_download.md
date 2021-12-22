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
cut -f 1 srr_list.txt | xargs -L 1 -P 4 -I {} sh -c "fasterq-dump -e 20 -ngc redacted.ngc {}"  # I is for defining replace string, sh -c launch a subprocess, if it is encrypted, need -ngc parameter
for file in *.fastq; do echo $file; done | xargs -L 1 -P 10 -I {} sh -c "gzip {}"   # also, gzip the fastq
```

5. download dbGap 

```bash
# 1. request access on dbGap
# 2. using aspera to download
# # Q is to disable progress bar
# # T is to disable encryption
# # r is for remote log directory
# # -l is for max rate
# # -k is how to configure resume
# # -i is private key file, default to etc folder, ready when installing aspera
module load aspera
ascp -QTr -l 300M -k 1 -i "/usr/local/aspera/3.9.1/etc/asperaweb_id_dsa.openssh" -W redacted_credential redacted_server_address .
# 3. decrypt for the phenotype/genotype/studymeta data
module load sratoolkit/2.10.4
vdb-decrypt --ngc redacted.ngc 85634  # njc file needs to go to dbGap download link page, "get repository key"
```

