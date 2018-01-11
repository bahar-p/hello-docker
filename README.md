# hello-docker
A dockerized "Hello World" nodejs server application to goof around with docker container and images, publishing to docker registery and other cool stuffs!
The node server is built using Express.

### Build docker image
Run the following to build 
```
$ docker build -t <username>/hello-docker-node .
```
If all goes well, you can now see the image built by following command:
```
$ docker images
```
Sample output you should expect:
```
REPOSITORY                    TAG                 IMAGE ID            CREATED             SIZE
bpourazar/hello-docker-node   1.0.0               18b5eceb2b28        33 minutes ago      680MB
```

#### Run docker image
Now run the docker image:

```
$ docker run -p 3000:3000 -d <username>/hello-docker-node
```
At this point, you should be able to see the container up and running. You can confirm this byfollowing command:
```
$ docker ps
```
and the newly built container should be listed. If you do not see the container, there had been an error to run the image and start the container. 
you can check container logs by:
```
$ docker logs <containerid>
```
<containerid> can be retrieved by *docker ps -a* in case your container has failed to start, the "-a" list all existing containers regardless of their state.

_Note_: If you want to define more options for running docker container such as memory, you can use "-m" arg; example:
```docker run -m "200M" --memory-swap "1G" -p 3000:3000 -d <username>/hello-docker-node```

I'd recommend taking a look at docker node best practices here for more options:
[Docker and Node.js Best Practices](https://github.com/nodejs/docker-node/blob/master/docs/BestPractices.md)

### Test 
You can test your app by opening broswer and loading [localhost:3000](localhost:3000). You should see "Hello World!" message printed on the page.
You can also test it by simply running a curl command in your terminal:
```
$ curl -i localhost:3000
```
Output:
```
HTTP/1.1 200 OK
X-Powered-By: Express
Content-Type: text/html; charset=utf-8
Content-Length: 13
ETag: W/"d-oLZZOWcLwsAQ9NXWoLPk5FkPuSs"
Date: Thu, 11 Jan 2018 16:36:18 GMT
Connection: keep-alive

Hello World!
```
Voila! You built your own first docker app! :) Happy dockerizing! 

## Push/Pull from docker registery
This docker image is published to my private docker registery, you can simply pull it from there by:
```
$ docker pull bpourazar/hello-docker-node:tagname
``` 

If you wish to publish your own image you can use the following (obviously, you need to havea docker ID created first and login to docker registery)
```
$ docker login
$ docker push <username>/<image name>
```

## tutorials
There are tons of documentations and resources out there; Here are some good tutorials to start with:
 - https://docs.docker.com/get-started/
 - https://nodejs.org/en/docs/guides/nodejs-docker-webapp/
