# jenkins-with-docker

This sample application will help you in building a custom jenkins docker image which contains pre-installed plugins and sample jobs.

My requirement was to share our current CI/CD pipeline jobs with the list of plugins to the Operation or another team who are also working on same project. Instead of sharing the common server and making dependencies we preferred this approach.

How to run it.

```
docker build -t 'jenkins-with-docker' .
```
Linux 
```
docker run -d -p 8080:8080 --name "jenkins-with-docker" -v /var/run/docker.sock:/var/run/docker.sock -v $(which docker):/usr/bin/docker jenkins-with-docker
```


Windows 
```
docker run -d -p 8080:8080 --name "jenkins-with-docker" -v /var/run/docker.sock:/var/run/docker.sock -v $(where docker):/usr/bin/docker jenkins-with-docker
```
