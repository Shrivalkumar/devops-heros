#!/bin/zsh
clear
cd /Users/shrivalkumar/Desktop/devops-heros/session21-python
kubectl -n taskboard get deployments,pods,services,pvc
helm status taskboard -n taskboard
kubectl -n taskboard get configmaps,secrets
