FROM kite/base

# NGINX
RUN apt-get install -y -q nginx
ADD default /etc/nginx/sites-available/
ADD app /home/kite/workspace

EXPOSE 8000

ADD start.sh /
ADD restart.sh /
