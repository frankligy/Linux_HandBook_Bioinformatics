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
git push origin main
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

what if you accidentally push to remote master?

Go to remote, find the commit ID you want to restore

```
git reset --hard commitID
git push origin master
```

But by doing that, your updates in local master branch will be removed. So more smart way is to first create new branch to save the current updates.

```
git branch backup
git checkout backup
git checkout master
git reset --hard commitID
git push origin master
```

How to construct `.gitignore` file?

Please add `**/.DS_Store` in the file. `**` means any folder and its sub-folders.

```
# if you need to remove something already been staged or committed
git rm file.txt
```

How about SSH access?

You can either use password (HTTP), or SSH key to access the server (including the on-premise and cloud server, GitHub, etc). For SSH key, you need to first generate your local key pair (public and private):

```
# ed25518
ssh-keygen -t ed25519 -C "<comment>"
# 2048 bit RSA
ssh-keygen -t rsa -b 2048 -C "<comment>"
```

The key will be stored at `~/.ssh/`, which will be used for the configuration, you can put your public local key to the GitLab server, so that they are linked.