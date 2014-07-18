useradd -G sudo -d /home/kite kite
chown kite /home/kite
/usr/local/bin/supervisord -n
