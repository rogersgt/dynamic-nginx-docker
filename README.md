## Dynamic Nginx Docker Image
First create a self signed cert and key under `server/ssl/` called `api-self-signed.crt` and `api-self-signed.key`.

The first line of the following builds a docker image tagged as `dynamic-nginx-docker:latest` from the current directory. The second
line creates a container named `nginx` from the built image, links it to a container called `another-container`, passes in 2 environment variables, and allows
the default start up command from the Dockerfile to be run on start.

```bash
docker build -t dynamic-nginx-docker:latest .
docker run -p 443:443 --name nginx --link another-container --env PROXY_PORT=8080 --env LINK_CONTAINER_NAME=another-container dynamic-nginx-docker
```
