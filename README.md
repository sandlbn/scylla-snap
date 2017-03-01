# scylla-snap

##ScyllaDB configuration 

Clone the scylla-snap repository
```
$git clone https://github.com/sandlbn/scylla-snap.git 

$cd scylla-snap
```

Configure ScyllaDB repo
```
sudo wget -O /etc/yum.repos.d/scylla.repo http://downloads.scylladb.com/rpm/centos/scylla-1.6.repo
```

Because ABRT conflict with Scylla coredump configuration. Remove it before installing Scylla: 
```
$sudo yum remove -y abrt
```

Install epel repository and wget package
```
$sudo yum install -y epel-release wget
```

Install scylladb
```
$sudo yum install -y scylla
```

For additional configuration and tweaks you can run scylla configuration tool:
```
$sudo scylla_setup
```

##Blueflood configuration
Create data structure for blueflood 
```
$cqlsh 127.0.0.1 -f ./load/load.cdl
```
Install java
```
$sudo yum install -y openjdk
```

You are ready now to run blueflood 

```
$./bin/blueflood-start.sh
```

Let's configure snap
```
curl -s https://packagecloud.io/install/repositories/intelsdi-x/snap/script.rpm.sh | sudo bash
sudo yum install -y snap-telemetry
```


