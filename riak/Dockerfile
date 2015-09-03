FROM centos:7
MAINTAINER Pete Slater "psl@trifork.com"

# Install wget
RUN yum -q update -y && yum -q -y install wget

# Install tar
RUN yum -q update -y && yum -q -y install tar

# Install libraries needed for Java
RUN yum -q update && yum -q -y install glibc.i686
RUN yum -q update && yum -q -y install libgcc_s.so.1

# Install a Java runtim (JRE)
RUN wget -q --no-check-certificate --no-cookies --header "Cookie: oraclelicense=accept-securebackup-cookie" http://download.oracle.com/otn-pub/java/jdk/8u45-b14/jre-8u45-linux-x64.rpm && \
		yum -q install -y jre-8u45-linux-x64.rpm && \
		rm jre-8u45-linux-x64.rpm

# Install supervisor
RUN yum -q update -y && yum -q -y install python-setuptools
RUN easy_install pip
RUN pip install supervisor
RUN mkdir /var/log/supervisor
COPY supervisord.conf /etc/supervisord.conf
COPY supervisor.conf /etc/supervisor/conf.d/supervisor.conf

# Install Riak via RPM
RUN wget http://s3.amazonaws.com/downloads.basho.com/riak/2.1/2.1.1/rhel/7/riak-2.1.1-1.el7.centos.x86_64.rpm && \
		rpm -Uvh riak-2.1.1-1.el7.centos.x86_64.rpm && \
		rm riak-2.1.1-1.el7.centos.x86_64.rpm
COPY riak.conf /etc/riak/riak.conf

# Expose Riak ports
EXPOSE 8087 8098

# Run the supervisor command to start everything we need in this Docker image
CMD ["/usr/bin/supervisord", "-c", "/etc/supervisord.conf"]
