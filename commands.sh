kubectl create configmap redis-conf --from-file=redis.conf

kubectl create -f replicasets
kubectl create -f services
