#!/bin/zsh
clear
cd /Users/shrivalkumar/Desktop/devops-heros/session21-python
kubectl -n taskboard get deployments,pods,services,pvc
helm status taskboard -n taskboard
curl -fsS http://127.0.0.1:8088/api/tasks
curl -fsS http://127.0.0.1:8088/health
