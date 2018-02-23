# redis cluster build

## Create Redis Cluster Configuration

```
kubectl create configmap redis-conf --from-file=redis.conf
```

## Create Redis Nodes

```
kubectl create -f replicasets
```

## Create Redis Services

```
kubectl create -f services
```

## Connect Nodes

```
kubectl run -i --tty ubuntu --image=ubuntu \
  --restart=Never /bin/bash
```

```
apt-get update
apt-get install ruby vim wget redis-tools
gem install redis
wget http://download.redis.io/redis-stable/src/redis-trib.rb
chmod 755 redis-trib.rb
```

```
./redis-trib.rb create --replicas 1 \
  10.107.255.1:6379 \
  10.107.255.2:6379 \
  10.107.255.3:6379 \
  10.107.255.4:6379 \
  10.107.255.5:6379 \
  10.107.255.6:6379
```

### Add a new node

```
kubectl create -f replicaset/redis-7.yaml
```

```
kubectl create -f services/redis-7.yaml
```

```
CLUSTER MEET 10.107.255.7 6379
```
