#!/bin/zsh
clear
cd /Users/shrivalkumar/Desktop/devops-heros/session14-kubernetes-troubleshooting
kubectl get endpoints web-service troubleshooting-service
kubectl exec dns-test -- nslookup web-service.default.svc.cluster.local
kubectl exec dns-test -- wget -qO- http://web-service | head -c 55
printf '\n'
kubectl top pods
kubectl get deployment troubleshooting-app
