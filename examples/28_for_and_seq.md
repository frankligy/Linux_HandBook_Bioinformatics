## typical usage of iterating a list of numerical variables

1. for

```bash
for i in 1 2 3 4 5; do echo $i; done
```

2. seq, can be used with xargs for parallelization

```bash
seq 5; do echo $i; done
seq 5 | xargs -L 1 -P 5 -I {} sh -c "wget ftp://ftp.pride.ebi.ac.uk/pride/data/archive/2021/08/PXD022949/NCI_3784Mel_Epitope_Rep{}.raw"
```

