# Note for using NYU bigpurple cluster (Slurm)

## Access and VPN

You need to first get your kerberos ID and email, then you apply for HPC cluster access.

You need to set up your VPN following this [tutorial](https://servicecatalog.nyumc.org/Pages/NYU_Langone_Advanced_Access_App.aspx).


## Connect

```bash
ssh kid@bigpurple.nyumc.org

# home
/gpfs/home/lig08

# scratch
/gpfs/scratch/lig08

```

System is like below:

```
NAME="Red Hat Enterprise Linux Server"
VERSION="7.9 (Maipo)"
ID="rhel"
ID_LIKE="fedora"
VARIANT="Server"
VARIANT_ID="server"
VERSION_ID="7.9"
PRETTY_NAME="Red Hat Enterprise Linux"
ANSI_COLOR="0;31"
CPE_NAME="cpe:/o:redhat:enterprise_linux:7.9:GA:server"
HOME_URL="https://www.redhat.com/"
BUG_REPORT_URL="https://bugzilla.redhat.com/"

REDHAT_BUGZILLA_PRODUCT="Red Hat Enterprise Linux 7"
REDHAT_BUGZILLA_PRODUCT_VERSION=7.9
REDHAT_SUPPORT_PRODUCT="Red Hat Enterprise Linux"
REDHAT_SUPPORT_PRODUCT_VERSION="7.9"
```

## scheduler (Slurm)

```bash
# check all partition(queue) and the nodes
# please refer to http://bigpurple-ws.nyumc.org/wiki/index.php/Getting-Started
# please refer to the bigpurple slides deck if needed
sinfo

# interactive job
srun --partition=cpu_short --time=00:10:00 --nodes=1 --ntasks-per-node=8 --mem=5Gb --job-name="test" --pty bash

# rsync or scp
scp path_in_local kid@bigpurple.nyumc.org:full_path_to_target

# sbatch command and directive in file

#!/bin/bash
#SBATCH --partition=cpu_medium
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=1
#SBATCH --time=1-00:00:00
#SBATCH --mem=100Gb
#SBATCH --job-name="data_transfer"
#SBATCH --output=/gpfs/data/yarmarkovichlab/Frank/job_dump/data_transfer.out

sbatch example.sbatch
```

flags are as below:

![flag](../data/bigpurple_flags.png)

## GUI

Different from CCHMC server, you can not map the drive to Finder, you have to use Filezilla which may have something to do with the network used here.
You can also use Ondemand (https://ondemand.hpc.nyumc.org) to check files, jobs, launch shell, interative apps and finally the mate desktop.

## Mount

CCHMC use SMB share so you can directly use Finder, here you have to use SFTP through Filezilla, please use bigpurple.nyumc.org and port 22


