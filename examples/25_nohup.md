## Talk about process in the foreground and background

You can execute bash command without need to worry about being terminated when logging out of the bash,
that's the usage of `nohup` command. `nohup` command often use with `&` at the end to also send it to 
the background, so you can do whatever tasks in the foreground.

```
nohup bash -c "sleep 20 && echo hi" &
# the log file will default to nohup.output
```

Now to check the status of your job running in the background, use `ps` command, and the process id associated with you nohup command
is the one that you should be looking for. You can also use `top` command, which will output more comprehensive processes that are ongoing.

```
ps
```

To kill the process in the background:

```
kill 9 PID  # 9 means immediately kill all associated with this PID
```