viewvc-docker
=============

Viewvc docker to use with rancid docker

git clone https://github.com/jalmeida/viewvc-docker.git

sudo docker build -t=jalmeida/viewvc:test .
sudo docker run -t -i jalmeida/viewvc:test

sudo docker run -p 55581:80 -d -v /opt/docker-shared/rancid/var:/opt/cvs jalmeida/viewvc:test
