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
docker run --rm -it frankligy123/altanalyze bash
exit

# to run a web app
docker run -p 3838:3838 web_pipeline:0.0.4 # make sure host in your web should be 0.0.0.0
docker run -e PORT=5000 -p 5000:5000 web_pipeline:0.0.4

# To check
docker images
docker ps
docker stop container_id
docker image rm -f altanalyze

# purge if you encounter space issue when repeatly build the dockerfile
docker container prune
docker image prune
docker volume prune
docker system df
docker builder prune

# copy to a container, only modify the container
docker --rm -it --entrypoint bash altanalyze  # first make sure it is running, now open another shell 
docker cp /host/to/file.txt container_id_or_name:/docker/to/dir
docker cp container_id_or_name:/docker/to/file.txt /host/to/dir  # but when you do COPY in dockerfile, you need to specifiy des dir name not just parental dir


# since Mac M series chip use ARM as archtecture, which is not compatible with linux/amd64, we need other ways to build
docker buildx create --name mybuilder --use  # this will create a local image
docker buildx inspect --bootstrap  # this will create a container
docker buildx build --platform linux/amd64 --no-cache -t altanalyze:0.0.1 --load .   # create an image locally, then tag and push as normal
docker buildx build --platform linux/amd64 --no-cache -t frankligy123/altanalyze:0.0.1 --push .    # shortcut for dockerhub

# you can also push to other registry, following their tutorial for how to login (may need parituclar token),
# cgc-images.sbgenomics.com/li2g2uc/altanalyze:0.0.1
docker login cgc-images.sbgenomics.com # using username and the token, not password
docker tag altanalyze:0.0.1 cgc-images.sbgenomics.com/li2g2uc/altanalyze:0.0.1  # or you can directly load with the registry name
docker push cgc-images.sbgenomics.com/li2g2uc/altanalyze:0.0.1
```





## Singularity

```bash
# build and run a read-only version
singularity build my_software.sif docker://fred2/optitype
singularity run -B $(pwd):/mnt my_software.sif -i ${sample}.1.fastq ${sample}.2.fastq --rna -v -o /mnt

# build and run a writable version
singularity build --sandbox altanalyze/ docker://frankligy123/altanalyze:0.5.0.1
singularity run -B $PWD:/usr/src/app/run --writable altanalyze/ bam

# For singularity interactive 
singularity shell my_software.sif
singularity shell --writable ./altanalyze

# when pulling private docker image
export SINGULARITY_DOCKER_USERNAME=frankligy123
export SINGULARITY_DOCKER_PASSWORD=redacted
```
