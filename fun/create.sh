#!/bin/bash 

#define name of cluster
fargatecluster=fargate-cluster

# Does the cluster exist then create it.
if eksctl get cluster $fargatecluster;then
    echo Found $fargatecluster
    eks_status=$(eksctl get cluster $fargatecluster |awk '{print $3}' |tail -1)
    if [ "$eks_status" != "ACTIVE" ];then 
        echo Cluster $fargatecluster found, but not active.  This should not happen.
        echo Maybe you should wait or delete this cluster.
        exit 1
    else
        echo Found cluster $fargatecluster not creating a cluster.
    fi
else 
    echo Cluster $fargatecluster not found creating
    sed "s/  name:.*/  name: $fargatecluster/" fargate.yaml >/tmp/$fargatecluster-$$.yaml
    eksctl create cluster -f  /tmp/$fargatecluster-$$.yam
    rm /tmp/$fargatecluster-$$.yam
    kubectl create ns nginx
fi

# Use apply so it will create or update
kubectl create configmap nginx-html --from-file=html -o yaml --dry-run=client |kubectl label -f- --dry-run=client -o yaml --local app.kubernetes.io/name=nginx |kubectl -n nginx apply -f
kubectl -n nginx apply -f nginx-lb.yaml

# Probe if things are up
  # extract lb 
  # curl lb
