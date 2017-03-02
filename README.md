# scylla-snap

##ScyllaDB configuration 

Clone the scylla-snap repository
```
$git clone https://github.com/sandlbn/scylla-snap.git 

$cd scylla-snap
```

Install epel repository and wget package
```
$sudo yum install -y epel-release wget
```

Configure ScyllaDB repo
```
sudo wget -O /etc/yum.repos.d/scylla.repo http://downloads.scylladb.com/rpm/centos/scylla-1.6.repo
```

Because ABRT conflict with Scylla coredump configuration. Remove it before installing Scylla: 
```
sudo yum remove -y abrt
```

Install scylladb
```
sudo yum install -y scylla
```

For additional configuration and tweaks you can run scylla configuration tool:
```
sudo scylla_setup
```
##Elastic search configuration

Import gpg key for elasticsearch repository
```
sudo rpm --import https://packages.elastic.co/GPG-KEY-elasticsearch
```

Install Elasticsearch service
```
sudo cp config/elasticsearch.repo /etc/yum.repos.d/elasticsearch.repo
sudo yum install elasticsearch
sudo chkconfig --add elasticsearch
sudo service elasticsearch start
```

##Blueflood configuration
Create data structure for blueflood 
```
cqlsh 127.0.0.1 -f load/load.cdl
```

You are ready now to run blueflood 

```
./bin/blueflood-start.sh
```

##Snap configuration
Let's configure snap
```
curl -s https://packagecloud.io/install/repositories/intelsdi-x/snap/script.rpm.sh | sudo bash
sudo yum install -y snap-telemetry
```

Download plugins
```
sudo wget https://raw.githubusercontent.com/sandlbn/dot/master/bin/snap-plugin-publisher-blueflood -O /opt/snap/plugins/snap-plugin-publisher-blueflood
sudo wget https://github.com/intelsdi-x/snap-plugin-collector-psutil/releases/download/8/snap-plugin-collector-psutil_linux_x86_64 -O /opt/snap/plugins/snap-plugin-collector-psutil
sudo chmod +x /opt/snap/plugins/snap-plugin-publisher-blueflood
sudo chmod +x /opt/snap/plugins/snap-plugin-collector-psutil
/opt/snap/bin/snapctl plugin load /opt/snap/plugins/snap-plugin-publisher-blueflood
/opt/snap/bin/snapctl plugin load /opt/snap/plugins/snap-plugin-collector-psutil
```

Start a task

```

/opt/snap/bin/snapctl task create -t tasks/blueflood.yaml 

```

