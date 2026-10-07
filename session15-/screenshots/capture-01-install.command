#!/bin/zsh
cd /Users/shrivalkumar/Desktop/devops-heros || exit 1
clear
helm uninstall devops-heroes --namespace devops-lab 2>/dev/null || true
helm install devops-heroes ./session15-/devops-heroes-chart --namespace devops-lab --create-namespace --wait
echo ''
helm list --namespace devops-lab
echo ''
helm status devops-heroes --namespace devops-lab | sed -n '1,45p'
echo ''
echo 'Screenshot 1: install, list, and status complete.'
sleep 45
