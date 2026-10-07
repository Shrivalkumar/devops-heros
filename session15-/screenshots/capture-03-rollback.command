#!/bin/zsh
cd /Users/shrivalkumar/Desktop/devops-heros || exit 1
clear
helm rollback devops-heroes 2 --namespace devops-lab --wait
echo ''
kubectl get deploy,pods --namespace devops-lab
echo ''
helm get values devops-heroes --namespace devops-lab
echo ''
helm history devops-heroes --namespace devops-lab
echo ''
echo 'Screenshot 3: rollback to revision 2 verified.'
sleep 45
