#!/bin/bash

# Install Docker using the package manager in CentOS
sudo yum install -y -q docker

# Start the Docker service on CentOS
sudo service docker start

# Build and run the riak image.
cd /vagrant/riak
sudo docker build -t test/riak .
if [[ -n `sudo docker ps -q -f "name=riak"` ]]; then
	sudo docker stop $(sudo docker ps -q -f "name=riak")
fi
sudo docker rm riak
sudo docker run -d -p 8098:8098 -p 8087:8087 --name riak -t test/riak
