#!/bin/bash

cat control-plane.yaml| limactl create --name=cp -
limactl start cp

cat node.yaml| limactl create --name=node01 -
limactl start node01
limactl shell node01 -- sudo $(cat ~/.lima/cp/copied-from-guest/join-command.txt)
