## Header for BSUB on cluster

```bash
#BSUB -W 10:00   # time
#BSUB -M 50000   # memory, in byte
#BSUB -n 10      # cores
#BSUB -R "span[ptile=10]"   # make sure cores will be on the same host, otherwise, non MPI-aware program won't able to detect cores in another host
#BSUB -J md5sum   # name
#BSUB -o /data/salomonis2/LabFiles/Frank-Li/job_dump/%J.out  # throw output
#BSUB -e /data/salomonis2/LabFiles/Frank-Li/job_dump/%J.err  # throw error
```




