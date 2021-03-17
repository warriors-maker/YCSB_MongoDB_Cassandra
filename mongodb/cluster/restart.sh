echo "Stopping MongoDB"
systemctl stop mongod
sleep 10;
echo "Removing data and logs"
cd /var/lib/mongodb/
rm -rf *
cd /var/log/mongodb/
rm -rf *
chown mongodb:mongodb /tmp/mongodb-27017.sock
echo "Starting MongoDB"
sudo systemctl start mongod
sleep 3;
echo $(systemctl status mongod);
