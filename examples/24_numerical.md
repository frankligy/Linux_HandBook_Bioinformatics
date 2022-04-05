## Numerical calculation

```bash
count=8  
# just to execute
(($count%5))
# to view and pass it to outer executation
echo $(($count%5))
# two shortcut
echo $(($count-=1))
echo $(($count+=1))
```