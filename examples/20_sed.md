## sed


1. replace is the main functionality

```bash
sed 's/unix/linux/g;s/1/2/g' file       # consecutive substitution
```

```bash
sed -i 's/\r$//' star_align_two_pass.sbatch   # -i means in place, it can resolve newline issue from Windows to Unix
```


2. delete lines

```bash
sed '/HLA-B44:01/d' file   # delete the line containing 'HLA-B44:01'
```

3. if file is saved from windows

```bash
sed -i 's/\r$//' downloadPDCData_11252025.py
```

4. change the line 

```bash
new_line="directory=${DIR}/${TASK}"
sed -i "8c $new_line" /path/settings_frank2_run.ini
```

