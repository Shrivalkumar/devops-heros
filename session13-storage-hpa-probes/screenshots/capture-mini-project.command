#!/bin/zsh
clear
cd /Users/shrivalkumar/Desktop/devops-heros/session13-storage-hpa-probes
kubectl -n production-webapp get deploy,pods,svc,pvc,hpa
kubectl -n production-webapp describe deployment web-app | tail -n 28
