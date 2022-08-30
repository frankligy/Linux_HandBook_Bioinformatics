## BSUB command


1. submit jobs, in your bash script, you must add shebang as `#!/bin/bash`, and `#BSUB` is recognized by `bsub` command. You can define global variable between shebang and `#BSUB`.

```bash
#BSUB -W 10:00   # time
#BSUB -M 50000   # memory, in byte, you can also use format like 500G 
#BSUB -n 10      # cores
#BSUB -R "rusage[mem=50G] span[hosts=1]"   # make sure cores will be on the same host, otherwise, non MPI-aware program won't able to detect cores in another host
#BSUB -J md5sum   # name
#BSUB -o /data/salomonis2/LabFiles/Frank-Li/job_dump/%J.out  # throw output
#BSUB -e /data/salomonis2/LabFiles/Frank-Li/job_dump/%J.err  # throw error
```

If using gpu, here's some additinal directive:

```bash
#BSUB -q "gpu-v100"
#BSUB -gpu "num=1"
```

2. interactive session
```bash
bsub -W 3:00 -M 100000 -n 1 -Is bash
bsub -W 3:00 -R "rusage[mem=100G] span[hosts=1]" -M 100G -n 1 -Is /bin/bash
```

3. inspect jobs
```bash
bjobs -l job_id
bpeek job_id
bkill job_id
```

4. inspect global usage
```bash
bhosts # check the number of nodes for each host
bjobs -a all # check all jobs (you and others) running/pending
```

5. check running hour balance
```bash
module load gold
gbalance -u ligk2e -h
```

6. How to check internet connection?
```bash
# set up internet connection
export http_proxy=http://username:password@bmiproxyp.chmcres.cchmc.org:80
export https_proxy=http://username:password@bmiproxyp.chmcres.cchmc.org:80
# check to see if getting http 200 code, using website what hasn't been whitelisted otherwise it doesn't matter
curl -I https://linuxhint.com/
curl -I http://linuxhint.com/
```










