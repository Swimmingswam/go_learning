#!/bin/bash

ulimit -c unlimited
export GOTRACEBACK=crash

cd /data/home/swimmingswam/go-learning/bin
./go-learning -conf ../conf/go_learning.yaml