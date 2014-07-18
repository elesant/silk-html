FROM ubuntu

# REPOS
RUN apt-get update; apt-get install -y -q software-properties-common python-software-properties

# LANGUAGE
RUN apt-get install -y -q language-pack-en
ENV LANGUAGE en_US.UTF-8
ENV LANG en_US.UTF-8
ENV LC_ALL en_US.UTF-8
RUN locale-gen en_US.UTF-8; dpkg-reconfigure locales

# DEFAULT
RUN apt-get install -y -q curl git make wget openssh-server sudo zip tmux vim nano memcached python python-setuptools python-pip openjdk-6-jdk sqlite3
RUN easy_install supervisor

# NGINX
RUN apt-get install -y -q nginx
ADD ./configs/default /etc/nginx/sites-available/default
ADD ./configs/supervisord.conf /etc/supervisord.conf
ADD app /home/kite/workspace
RUN mkdir /var/log/supervisor/
RUN mkdir /var/run/sshd
RUN adduser --disabled-password --gecos "" kite; usermod -a -G sudo kite
RUN echo "kite	ALL=NOPASSWD: ALL" >> /etc/sudoers
ADD ./start.sh /start.sh
RUN chmod 755 /start.sh

EXPOSE 8000
EXPOSE 22

CMD ["/bin/bash", "/start.sh"]
