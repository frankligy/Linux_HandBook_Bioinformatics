## using python to run shell script

Usually subproces module should be enough, I am talking about in python3.6 specifically because I used it a lot

1. normal simple command, just use item in a python list to demarcate them.
```python
subprocess.run(['head','-n','5','file1.txt'])
```

2. need to redirect
```python
with open('file.log','w') as f:
    subprocess.run(['head','-n','5','file1.txt'],stdout=f,universal_newlines=True) # universal_newlines make the return as string instead of byte string
```

3. need to capture the output
```python
result = subprocess.run(['head','-n','5','file1.txt'],stdout=subprocess.PIPE,universal_newlines=True) # universal_newlines make the return as string instead of byte string
# result here is a Context object
result.stdout.split('\n')[:-1]  # will be a list, usually the last one is an empty element
```

4. need to run long command
```python
ori_dir = os.getcwd()
os.chdir(bed_folder_path)
all_beds = subprocess.run("for file in *.bed; do echo $file; done",shell=True,stdout=subprocess.PIPE,universal_newlines=True).stdout.split('\n')[:-1]
os.chdir(ori_dir)
```