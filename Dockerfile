FROM centos:7

RUN yum -y update && \
    yum -y install openssh-server && \
    sed -i 's/UsePAM yes/UsePAM no/g' /etc/ssh/sshd_config && \
    sed -i 's/#Port 22/Port 8888/g' /etc/ssh/sshd_config && \
    echo "root:147258"|chpasswd
    
ADD ssh_host_rsa_key /etc/ssh/ssh_host_rsa_key
ADD ssh_host_rsa_key.pub /etc/ssh/ssh_host_rsa_key.pub

EXPOSE 8888

COPY start.sh /

CMD ["/start.sh"]
