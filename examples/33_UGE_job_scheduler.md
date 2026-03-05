# UGE job scheduler

## Stuff unique to notre dame

- Doc: https://docs.crc.nd.edu/new_user/quick_start.html
- VPN: https://nd.service-now.com/nd_portal?id=kb_article_view&sys_kb_id=d7d6b726c37b261033dc78fdd40131c1&spa=1#mcetoc_1h3i7t2u48
- In-person office hours are available every Wednesday and Thursday from 2-3PM in 812 Flanner Hall
- The maintenance period for CRC machines is from 2:00 - 10:00 A.M. each Sunday
- GUI cyberduck

```bash
ssh netID@crcfe01.crc.nd.edu 
ssh netID@crcfe02.crc.nd.edu
```

```bash
# for home directory AFS disk: /users/netID
quota
# for scratch folder panasas disk: /scratch365/netID
pan_df -H /scratch365/your_login_id
# new GBCF group and LTS
/groups/gbcf/
/bluefs/gbcf/
# old GBCF 
/afs/crc/group/genomics/
/afs/crc/group/Bioinformatics
# sequencer connect
ssh lightsheetfs
/data/BIO/illumina01/genomics
# my lab space
/placeholder
```

## UGE system

```bash
#!/bin/bash

#$ -M netid@nd.edu   # Email address for job notification
#$ -m abe            # Send mail when job begins, ends and aborts
#$ -pe smp 24        # Specify parallel environment and legal core size
#$ -q long           # Specify queue
#$ -N job_name       # Specify job name
```

```bash
qsub sub_all.job
qstat -u netID
qstat -j job_id
qdel -j job_id
free_nodes.sh -G
```

```bash
#!/bin/bash

#$ -pe smp 1           # Specify parallel environment and legal core size
#$ -q long             # Specify queue
#$ -N job_name         # Specify job name
#$ -t 1-3              # Specify number of tasks in array

module load python

fruits=( "orange" "apple" "pair" )

# Note that different tasks will use different input parameters.
python pie_recipe.py ${fruits[$SGE_TASK_ID-1]}
```



