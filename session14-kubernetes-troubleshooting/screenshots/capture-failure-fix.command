#!/bin/zsh
clear
cd /Users/shrivalkumar/Desktop/devops-heros/session14-kubernetes-troubleshooting
kubectl delete pod crash-demo image-demo pending-demo --ignore-not-found
kubectl apply -f 06-crashloopbackoff/broken-pod.yaml
kubectl apply -f 07-imagepullbackoff/broken-pod.yaml
kubectl apply -f 08-pending-pods/broken-pod.yaml
sleep 7
kubectl get pods
kubectl logs crash-demo --previous 2>/dev/null || kubectl logs crash-demo 2>/dev/null
kubectl describe pod image-demo | grep -E 'ErrImagePull|ImagePullBackOff|Failed to pull'
kubectl describe pod pending-demo | grep -E 'nodeSelector|FailedScheduling'
kubectl delete pod crash-demo image-demo pending-demo
kubectl apply -f 06-crashloopbackoff/fixed-pod.yaml
kubectl apply -f 07-imagepullbackoff/fixed-pod.yaml
kubectl apply -f 08-pending-pods/fixed-pod.yaml
kubectl wait --for=condition=Ready pod/crash-demo pod/image-demo pod/pending-demo --timeout=90s
kubectl get pods -o wide
