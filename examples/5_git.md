# Let's talk about git

The commands that I usually used, the best practice I had so far:

I usually first create new repository on github or bitbucket first, then 

```
git clone
```

After I made changes to my local repository master branch, and want to push it to remote master branch

```
git status
git add .
git commit -m 'whatever'
git push origin master
```

what if in remote repository, we want multiple branches? I will first create branch through web portal in github or bitbucket. Then,

```
git clone
```

probabaly `git pull` or `git fetch` would work as well, but hasn't tested yet.

Then, after making changes in my local master branch,

```
git status
git add .
git commit -m 'whatever'
git show-ref
git push origin HEAD:branch_name
```