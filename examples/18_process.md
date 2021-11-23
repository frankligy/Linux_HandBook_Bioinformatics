## Process (display, kill)

1. To display all the processes that are running 

```bash
ps
```

2. To kill

```bash
kill -9 PID    # kill can only know PID, also -9 means one type of killing, which works well most of time
```

Or 

```bash
pkill -9 wget  # it will infer PID for you based on other information
```
