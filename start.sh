useradd -G sudo -d /home/kite kite
chown kite /home/kite
echo $SSH_KEY > /home/kite/.ssh/authorized_keys
/usr/local/bin/supervisord -n
