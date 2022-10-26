# Quick reference

- **Maintained by**:  
  [the Legacy development team](https://github.com/wearelegacy/pg-erd)

- **GitHub repository**:  
  [wearelegacy/pg-erd](https://github.com/wearelegacy/pg-erd)

- **Where to file issues**:  
  [wearelegacy/pg-erd/issues](https://github.com/wearelegacy/pg-erd/issues)

- **Supported architectures**:  
  `amd64`, `arm64`

- **Source of this discription**:  
  [repo's `.docker` directory](https://github.com/wearelegacy/pg-erd/tree/main/.docker)

# Supported tags and respective `Dockerfile` links

- [`0.1.0`, `0.1`, `0`, `latest`](https://github.com/wearelegacy/pg-erd/blob/v0.1.0/.docker/Dockerfile)

# What is pg-erd?

pg-erd is a script to generate **Entity-Relationship diagram** for **PostgreSQL** databases. It uses [`planter`](https://github.com/achiku/planter) to generate **PlantUML** discription file from a specific database, then with the help of [`python-plantuml`](https://github.com/dougn/python-plantuml) helper, passes the generated description file to a desired **PlantUML** server and receives the generated image back.

# How to use this image

## Run an instance of `pg-erd`

Running a **pg-erd** instance with the latest version is simple:

```shell
$ docker run -it --rm wearelegacy/pg-erd help
```

## Environment variables

### `DB_HOST`

This specifies the database host to connect to. This variable is optional and the default value is `localhost`.

### `DB_NAME`

This specifies the database name to extract the information from. This variable is optional and the default value is `postgres`.

### `DB_USERNAME`

This specifies the database username to use for the authentication. This variable is optional and the default value is `postgres`.

### `DB_PASSWORD`

This specifies the database password to use for the authentication. This variable is optional and the default value is `postgres`.

### `PLANTUML_SERVER_URL`

This specifies the **PlantUML** server URL to use for image generation. This variable is optional and the default value is `https://www.plantuml.com/plantuml`.

## How to run a local **PlantUML** server

```shell
$ docker run --detach --name plantuml-server --publish 8080:8080 plantuml/plantuml-server
```

Note: In this case, `pg-erd` needs to run in `host` network mode to be able to communicate with the **PlantUML** server. Like the following:

```shell
$ docker run -it --rm --env PLANTUML_SERVER_URL=http://localhost:8080 --network host wearelegacy/pg-erd svg
```
