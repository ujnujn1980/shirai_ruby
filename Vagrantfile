# -*- mode: ruby -*-
# vi: set ft=ruby :
#
#仮想環境にログイン
#vagrant ssh
#psql関連: pg_hba.confを検索し、peerをtrustに変更　これでパスワード無しで行ける
#sudo find / -name "pg_hba.conf" 
#vim /var/lib/pgsql/9.6/data/pg_hba.conf
#http://programming.ironsand.net/2014/create-postgres-superuser-for-rails/
#http://qiita.com/tomlla/items/9fa2feab1b9bd8749584
#sudo /etc/rc.d/init.d/postgresql-9.6 start
#sudo su
#sudo -u postgres psql
#CREATE ROLE vagrant superuser login;
#テーブルを作成 
#create database railsdb_development owner vagrant;
#create database railsdb_test owner vagrant;
#\q
#exit
#cd ~/data/

Vagrant.configure("2") do |config|
  config.vm.box = "hoge"
  config.vm.hostname = "wealthcare-api-1"
  config.vm.network "forwarded_port", guest: 3000, host: 3000
  config.vm.network "private_network", ip: "192.168.33.13"
  config.vm.synced_folder "./", "/home/vagrant/data"
  config.vm.provider "virtualbox" do |vb|
    # Display the VirtualBox GUI when booting the machine
    vb.gui = false
    # Customize the amount of memory on the VM:
    vb.memory = ENV["VM_MEMORY"] || "1024"
  end
  config.vm.provision "shell", privileged: true, inline: <<-SHELL
    function install {
      echo installing $1
      shift
      yum -y install "$@" >/dev/null 2>&1
    }
    pwd
    yum -y update >/dev/null 2>&1
    install "vim" vim
    install "development tools"  gcc-c++ glibc-headers openssl-devel readline libyaml-devel readline-devel zlib zlib-devel wget
    install "Git" git
    install "sqlite" sqlite sqlite-devel
    install "Nokogiri dependencies" libxml2 libxslt libxml2-devel libxslt-devel libffi-devel.x86_64
    install "ImageMagick" ImageMagick ImageMagick-devel
    
    #redis
    yum -y install --enablerepo=epel gperftools
    rpm --import http://dl.fedoraproject.org/pub/epel/RPM-GPG-KEY-EPEL-6
    rpm -Uvh http://ftp-srv2.kddilabs.jp/Linux/distributions/fedora/epel/6/x86_64/epel-release-6-8.noarch.rpm
    rpm --import http://rpms.famillecollet.com/RPM-GPG-KEY-remi
    rpm -ivh http://rpms.famillecollet.com/enterprise/remi-release-6.rpm
    yum -y install --enablerepo=remi redis
    service redis start
    
    #postgres
    rpm -ivh /home/vagrant/data/pgdg-centos96-9.6-3.noarch.rpm 
    yum install -y postgresql96 postgresql96-devel postgresql96-server postgresql postgresql-devel postgresql-server
    service postgresql-9.6 initdb
    /etc/rc.d/init.d/postgresql-9.6 start
    chkconfig postgresql-9.6 on
    
    #etc
    cp /etc/localtime /etc/localtime.org
    ln -sf  /usr/share/zoneinfo/Asia/Tokyo /etc/localtime
    echo "ZONE=\"Asia/Tokyo\"" > /etc/sysconfig/clock
    service crond restart
  SHELL

  config.vm.provision "shell", privileged: false, inline: <<-SHELL
    echo installing rbenv
    git clone https://github.com/sstephenson/rbenv.git ~/.rbenv
    git clone https://github.com/sstephenson/ruby-build.git ~/.rbenv/plugins/ruby-build
    echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.bash_profile
    echo 'eval "$(rbenv init -)"' >> ~/.bash_profile
    source ~/.bash_profile
    echo 'gem: --no-ri --no-rdoc' >> ~/.gemrc
    echo installing ruby#2.4.0
    cd /home/vagrant/.rbenv/plugins/ruby-build && git pull && cd -
    rbenv install 2.4.0
    rbenv global 2.4.0
    echo installing Bundler
    gem install bundler -N >/dev/null 2>&1
    SHELL
    
end


