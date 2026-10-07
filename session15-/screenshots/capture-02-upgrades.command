#!/bin/zsh
cd /Users/shrivalkumar/Desktop/devops-heros || exit 1
clear
helm upgrade devops-heroes ./session15-/devops-heroes-chart --namespace devops-lab --set replicaCount=2 --set-string 'application.message=Version 2: scaled to two replicas' --wait
kubectl get deploy,pods --namespace devops-lab
helm upgrade devops-heroes ./session15-/devops-heroes-chart --namespace devops-lab --set replicaCount=3 --set-string 'application.message=Version 3: second upgrade complete' --wait
echo ''
kubectl get deploy,pods --namespace devops-lab
echo ''
helm status devops-heroes --namespace devops-lab | sed -n '1,30p'
echo ''
echo 'Screenshot 2: both upgrades complete.'
sleep 45
