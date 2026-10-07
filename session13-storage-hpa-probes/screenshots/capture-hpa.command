#!/bin/zsh
clear
cd /Users/shrivalkumar/Desktop/devops-heros/session13-storage-hpa-probes
kubectl get hpa
kubectl get pods
kubectl top pods
kubectl describe hpa hpa-demo | grep -E 'Metrics:|SuccessfulRescale|ValidMetricFound'
