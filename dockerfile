FROM docker.io/centos:7.4.1708

RUN curl -O /etc/yum.repos.d/CentOS-Base.repo http://mirrors.aliyun.com/repo/Centos-7.repo /etc/yum.repos.d/epel.repo http://mirrors.aliyun.com/repo/epel-7.repo
ADD tc1.conf /etc/nginx/conf.d/
ADD nginx.repo /etc/yum.repos.d/


ENV path=/bin:/sbin:/usr/bin:/usr/sbin
RUN yum -y install nginx net-tools
EXPOSE 80/tcp

ADD init.sh /init.sh
CMD ["/bin/bash","/init.sh"]
CMD ["/usr/sbin/init"]
