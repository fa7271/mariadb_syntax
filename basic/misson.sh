sudo apt update
sudo apt install mariadb-server
y enter

cd
mkdir dump
cd dump
git clone https://github.com/fa7271/mariadb_syntax
cd mariadb_syntax/

mysql -u root -p board < dumpfile.sql