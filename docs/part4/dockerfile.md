# Add a `Dockerfile`

The final task is to add a Dockerfile and to build the container.

Create the file `~/.node-red/projects/<name-of-project>/Dockerfile` with the following
contents:

```
FROM node:lts as build

RUN apt-get update \
  && apt-get install -y build-essential

WORKDIR /data

COPY ./package.json /data/

RUN npm install

COPY ./settings.js /data/
COPY ./flows.json /data/
COPY ./flows_cred.json /data/

## Release image

FROM node:lts-slim
RUN apt-get update

RUN mkdir -p /data

COPY --from=build /data /data

WORKDIR /data

ENV PORT 1880
ENV NODE_ENV=production
ENV NODE_PATH=/data/node_modules
EXPOSE 1880
CMD ["npm", "start"]
```

This Dockerfile has two parts. It first creates a build image using the latest
`node:lts` image. It installs the build tools, copies in the project's `package.json`
,installs all of the node modules and then copies in the remaining project
files.

After that, it creates the real image using the `node:lts-slim` image - a smaller
base image. It copies over the required parts from the build image, sets up some
default environment variables and then runs Node-RED.

## Building the image

To build the image, run the following command from the `~/.node-red/projects/<name-of-project>/`
directory:

```
docker build . -t node-red-photobooth
```

This will take a few minutes the first time you run it as it will have to download
the base images. Subsequent runs will be quicker as those downloads are cached.

## Running the image locally

Once built, you can test the image locally by running:

```
docker run -p 9000:1880 --name photobooth node-red-photobooth
```

Once that runs, you will be able to open `http://localhost:9000` to access the
photo booth dashboard.


!!! note "Cleaning up Docker"
    To stop the running image, you can run the command:

    ```
    docker stop photobooth
    ```

    To delete the container, run:

    ```
    docker rm photobooth
    ```

    To delete the image, run:

    ```
    docker rmi node-red-photobooth
    ```



## Next Steps

The very last (optional) step is to push the [project to GitHub](one-more-thing.md).
