# Docker and Singularity

## Docker

```bash
# build image
docker build --no-cache -t altanalyze .

# push image to hub
docker tag altanalyze frankligy123/altanalyze:0.5.0   # first create repository on DockerHub 
docker push frankligy123/altanalyze:0.5.0

# To pull
docker pull frankligy123/altanalyze:0.5.0

# To run 

docker run -v $PWD:/mnt -t frankligy123/altanalyze:0.5.0 bam    # don't mount your pwd to a folder in docker system that has file, because all the files will be wiped to be consistent with $PWD

# To run (interactive)
docker run --rm -it --entrypoint bash frankligy123/altanalyze 

# To check
docker images
docker ps
docker stop container_id
docker image rm -f altanalyze

# purge if you encounter space issue when repeatly build the dockerfile
docker container prune
docker image prune
docker volume prune
```



## Singularity

```bash
# For singularity interactive 
singularity shell --writable ./altanalyze
```
