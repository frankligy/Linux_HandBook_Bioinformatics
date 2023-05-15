## SSH authentification

You can use your username and password to log in server like GitLab, using SFTP for remote server, etc.
But you can also set up a ssh key pair such that you have a private key `(~/.ssh/id_rsa)` stored at your computer, and
you can copy your public key `(~/.ssh/id_rsa.pub)` to the remote server, so that everytime, you don't need to type password anymore.
It will first search private key, map to public key and see if the public key is stored in the remote server, if the answer is yes,
then the connection will be established. The public key will be stored at the remote `(~/.ssh/authorized_keys)`. Also in your local computer,
there will be a file named `(~/.ssh/known_hosts)`, this is whitelisted hosts that we know are safe.

# generate pair

```bash
ssh-keygen -t tsa
```

# copy public to remote server

```bash
ssh-copy-id user@remote_server
```

# Another example using GitLab

How about SSH access?

You can either use password (HTTP), or SSH key to access the server (including the on-premise and cloud server, GitHub, etc). For SSH key, you need to first generate your local key pair (public and private):

```bash

# ed25518
ssh-keygen -t ed25519 -C "<comment>"
# 2048 bit RSA
ssh-keygen -t rsa -b 2048 -C "<comment>"

The key will be stored at `~/.ssh/`, which will be used for the configuration, you can put your public local key to the GitLab server, so that they are linked.
```

## troubleshooting

Sometimes you can not copy the public key to the server, you can use `sshpass` to bypass that.

```
sshpass -p 'password' sftp 'username@remote_server:folder/file.txt' ./
```
