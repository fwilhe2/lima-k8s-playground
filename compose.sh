#!/bin/bash

set -x

cat my-control-plane.yaml| limactl create --name=control-plane -
cat my-node.yaml| limactl create --name=node0 -
cat my-node.yaml| limactl create --name=node1 -

limactl start control-plane
limactl start node0
limactl start node1

limactl shell node0 sudo /opt/kubelet &
limactl shell node1 sudo /opt/kubelet &

limactl shell control-plane sudo /opt/kube-apiserver --service-cluster-ip-range 192.168.104.0/24 --etcd-servers localhost:2380 --service-account-issuer foo --service-account-signing-key-file server.key --api-audiences foo --service-account-key-file service-account.key &

