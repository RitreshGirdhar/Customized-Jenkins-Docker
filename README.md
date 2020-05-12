# Set Up jenkins via docker plus includes pre-configured pipelines jenkins jobs

This sample application will help you in building a custom jenkins docker image which contains pre-installed plugins and sample jobs.



My requirement was to share our current CI/CD pipeline jobs with the list of plugins to the Operation or another team who are also working on same project. Instead of sharing the common server and making dependencies we preferred this approach.

### How to run it.
* Checkout the code first
```
docker build -t 'jenkins-with-docker' .
```
For Linux & Mac
```
docker run -d -p 8080:8080 --name "jenkins-with-docker" -v /var/run/docker.sock:/var/run/docker.sock -v $(which docker):/usr/bin/docker jenkins-with-docker
```

For Windows 
```
docker run -d -p 8080:8080 --name "jenkins-with-docker" -v /var/run/docker.sock:/var/run/docker.sock -v $(where docker):/usr/bin/docker jenkins-with-docker
```


![Alt text](/images/jenkins-set-up-with-default-job.png?raw=true "Jenkins with default job")
