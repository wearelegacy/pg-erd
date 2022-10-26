# pg-erd

PostgreSQL database Entity-Relationship diagram generator

# What is pg-erd?

pg-erd is a script to generate **Entity-Relationship diagram** for **PostgreSQL** databases. It uses [`planter`](https://github.com/achiku/planter) to generate **PlantUML** discription file from a specific database, then with the help of [`python-plantuml`](https://github.com/dougn/python-plantuml) helper, passes the generated description file to a desired **PlantUML** server and receives the generated image back.

# How to build the Docker image

## `Dockerfile`

To organize the repository a bit more, the `Dockerfile` along with the **Docker Hub** is placed in the `.docker` directory.

## Build arguments

### `PLANTER_VERSION`

This specifies the version of `planter` to install in the image. This argument is mandatory and should be specified build time.

### `PYTHON_PLANTUML_VERSION`

This specifies the version of `python-plantuml` to install in the image. This argument is mandatory and should be specified build time.

## Running the build command

```shell
$ docker build --build-arg PLANTER_VERSION=4a27d29 --build-arg PYTHON_PLANTUML_VERSION=0.3.0 --file .docker/Dockerfile --tag wearelegacy/pg-erd:0.1.0 .
```

# Deployment pipeline

**GitHub Actions** is configured to run the deployment pipeline on new tags. Once a tag is pushed (i.e v0.1.0), the following steps are performed:

1. Required build arguments and environment variables are populated from `deploy.env`.

2. Docker image is built and tagged with the specified tag name (`0.1.0`) along with some additional ones (`0.1`, `0` and `latest`).

3. Built image is then pushed to the **Docker Hub**.

4. And finally, **Docker Hub** description for this repository is updated with `.docker/README.md` file.

Note: To update versions for `planter` and `python-plantuml` you need to change corresponding variables in `deploy.env` file.
