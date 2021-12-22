## BSUB command


1. submit jobs
```bash
#BSUB -W 10:00   # time
#BSUB -M 50000   # memory, in byte
#BSUB -n 10      # cores
#BSUB -R "span[hosts=1]"   # make sure cores will be on the same host, otherwise, non MPI-aware program won't able to detect cores in another host
#BSUB -J md5sum   # name
#BSUB -o /data/salomonis2/LabFiles/Frank-Li/job_dump/%J.out  # throw output
#BSUB -e /data/salomonis2/LabFiles/Frank-Li/job_dump/%J.err  # throw error
```

2. interactive session
```bash
bsub -W 3:00 -M 100000 -n 1 -Is bash
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










