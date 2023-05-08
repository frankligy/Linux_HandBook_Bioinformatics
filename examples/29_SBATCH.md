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
sinfo

# interactive job
srun --partition=cpu_short --time=00:10:00 --nodes=1 --ntasks-per-node=8 --mem=5Gb --job-name="test" --pty bash

# rsync or scp
scp path_in_local kid@bigpurple.nyumc.org:full_path_to_target

# sbatch command and directive in file

#!/bin/bash
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=2
#SBATCH --time=2-00:00:00
#SBATCH --mem=4G
#SBATCH --gres=gpu:a100:4

sbatch example.sbatch
```



