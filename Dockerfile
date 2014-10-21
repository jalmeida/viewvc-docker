# CentOS 6.4 + Apache
# VERSION 0.1

FROM centos:centos6
MAINTAINER Juan Maria Almeida <juanma.almeida@gmail.com>

# Install apache
RUN yum install -y httpd

# Shared folder
VOLUME ["/var/www", "/opt/cvs"]

# Expose port
EXPOSE 80

# Entry
RUN yum install rcs wget tar -y
RUN wget http://viewvc.tigris.org/files/documents/3330/49347/viewvc-1.1.22.tar.gz
RUN tar xzvf viewvc-1.1.22.tar.gz
RUN cd viewvc-1.1.22
RUN /viewvc-1.1.22/viewvc-install --prefix=/usr/local/viewvc-1.1.22/ --destdir=
ADD config/viewvc.conf /usr/local/viewvc-1.1.22/viewvc.conf
ADD config/httpd.conf /etc/httpd/conf/httpd.conf
RUN chown apache:apache /opt/cvs -R

CMD ["-D", "FOREGROUND"]
ENTRYPOINT ["/usr/sbin/httpd"]
#CMD ["/bin/bash"]
