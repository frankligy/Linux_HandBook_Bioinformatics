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
curl -o after_pca.txt https://raw.githubusercontent.com/frankligy/DeepImmuno/main/reproduce/data/after_pca.txt
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

6. downlaod EGA

We need to first get the permission through a very complicated process, after that, 

```bash
# instructions: https://github.com/EGA-archive/ega-download-client
# build a mamba env and install python3.7 and pyega3
# the credential file is the username and password they give you the permission for certain study
# EGAD is data, EGAS is study, EGAF is actual file that will be downloaded
conda activate ./pyega3_mamba_env
pyega3 -cf credential_file.json fetch EGAD00001005097 --output-dir ./
```

7. download SRA from S3 bucket

Occasionally there will be some issues for the deposited sra file on the website, so using the raw S3 bucket maybe a workaround. Like in this [SRR page](https://trace.ncbi.nlm.nih.gov/Traces/?view=run_browser&acc=SRR13279452&display=data-access), you have both AWS and GCP cloud copy of this file. If it is "Free Egress", then you can directly download. If not, then you need to provide a bucket (charge will incur) using [SRA data delivery service](https://www.ncbi.nlm.nih.gov/Traces/cloud-delivery/), you need to have eRA account and bucket name.


8. download from SharePoint, OneDrive, Dropbox

Using FireFox browser, open the web developer tool and go to network tab. Now click the link of download, you can see the file in the dowload 
section in the download tab in the upper right corner. Now interrupt the download, you should be able to see the failed POST request, now right click the tranfer and obtain the cURL. This is just a curl command, you can add `-o file.zip` then do it programmatically. You may need specific curl version (curl/7.60.0) to recognize `--data-raw` flag.

In terms of path mapping, you may need to figure out how the filename is encoded in the string, which can potentially be in a few other requests prior to the POST request.
