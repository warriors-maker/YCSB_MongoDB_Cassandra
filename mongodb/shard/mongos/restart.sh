echo "Stopping MongoDB"
sudo systemctl stop mongod
sleep 10;
echo "Removing data and logs"
cd /var/lib/mongodb/
rm -rf *
cd /var/log/mongodb/
rm -rf *
chown mongodb:mongodb /tmp/mongodb-27017.sock
echo "Starting Mongos"
#sudo systemctl start mongod
mongos --config /etc/mongos.conf
