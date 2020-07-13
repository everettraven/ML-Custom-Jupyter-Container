# ML-Custom-Jupyter-Container
This repository contains the Dockerfile to create a customized Jupyter Docker Container based off the Tensorflow Docker Container

**NOTE:** *The resulting docker container is meant to be used with machines that have GPUs*

# Instructions

## Install Docker
Steps for installing Docker here: https://docs.docker.com/get-docker/

## Clone the Git Repo

```
git clone https://github.com/everettraven/ML-Custom-Jupyter-Container.git
```

## Build the Docker Image

This Dockerfile has build arguments, so make sure to take that into consideration when building your image.

The following are the build arguments

**jupyter_token** - **DEFAULT: unsecuretoken** - This is the token that will need to be put into the token form field when browsing to the Jupyter Server web page

**port** - **DEFAULT: 8888** - This is the port the Jupyter Server will be run on.

I recommend using the -t option when building so you can apply whatever name you'd like to the Docker image, making it easier to run in the future.

### Without build args

```
docker build -t ML-Custom-Jupyter-Container <PATH/TO/SOURCE>
```

### With build args
```
docker build --build-arg jupyter_token="newtokenhere" --build-arg port="5000"  -t ML-Custom-Jupyter-Container <PATH/TO/SOURCE>
```

**NOTE:** *Make sure to replace '<PATH/TO/SOURCE>' with the path to your Dockerfile*

## Run the Docker Image

This Docker image uses environment variables by the same name as the build arguments. When running the Docker image you can pass the '-e' flag to change the values without having to rebuild the image.

If you build the Docker image to use a different port, make sure to change the ports that come after the -p flag

### Without Setting Environment Variables

```
docker run --gpus all -it -p 8888:8888 ML-Custom-Jupyter-Container
```

### With Setting Environment Variables

This example changes the port to port 8000 instead of the default port 8888

```
docker run -e port=8000 --gpus all -it -p 8000:8000 ML-Custom-Jupyter-Container
```
