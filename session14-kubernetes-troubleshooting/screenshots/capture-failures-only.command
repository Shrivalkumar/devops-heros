#!/bin/zsh
clear
cd /Users/shrivalkumar/Desktop/devops-heros/session14-kubernetes-troubleshooting

kubectl delete pod crash-demo image-demo pending-demo --ignore-not-found
kubectl apply -f 06-crashloopbackoff/broken-pod.yaml
kubectl apply -f 07-imagepullbackoff/broken-pod.yaml
kubectl apply -f 08-pending-pods/broken-pod.yaml
sleep 8

kubectl get pods
echo '\nCrashLoopBackOff evidence:'
kubectl logs crash-demo --previous 2>/dev/null || kubectl logs crash-demo 2>/dev/null
echo '\nImage pull evidence:'
kubectl describe pod image-demo | grep -E 'ErrImagePull|ImagePullBackOff|Failed to pull'
echo '\nPending scheduling evidence:'
kubectl describe pod pending-demo | grep -E 'nodeSelector|FailedScheduling'
