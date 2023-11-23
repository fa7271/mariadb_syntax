sudo apt-get -y upgrade
sudo apt install -y mariadb-server
sudo systemctl start mariadb
sudo systemctl enable mariadb

-- db 접속
sudo mysql -u root -p
1234
create database board;
exit;

-- 디렉토리 생성, 덤프복원명령어 실행
mkdir dump
cd dump
git clone https://github.com/fa7271/mariadb_syntax
cd mariadb_syntax/project/

sudo mysql -u root -p board < dumpfile.sql
