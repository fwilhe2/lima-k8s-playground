#!/bin/bash

set -x

cat my-control-plane.yaml| limactl create --name=control-plane -
cat my-node.yaml| limactl create --name=node0 -
cat my-node.yaml| limactl create --name=node1 -

limactl start control-plane
limactl start node0
limactl start node1
