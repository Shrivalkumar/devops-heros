# Kubernetes Fundamentals

## Task

I created a local Kubernetes cluster using `kind` and ran a basic pod that prints `Hello Kubernetes`.

## Commands I ran

```bash
kind create cluster --name devops-assignment --wait 180s
kubectl cluster-info --context kind-devops-assignment
kubectl get nodes -o wide
kubectl apply -f hello.yml
kubectl wait --for=jsonpath='{.status.phase}'=Succeeded pod/hello-pod --timeout=60s
kubectl get pod hello-pod -o wide
kubectl logs hello-pod
```

## Output

```text
Kubernetes control plane is running at https://127.0.0.1:62555
CoreDNS is running at https://127.0.0.1:62555/api/v1/namespaces/kube-system/services/kube-dns:dns/proxy

NAME                              STATUS   ROLES           AGE     VERSION   INTERNAL-IP   EXTERNAL-IP   OS-IMAGE                       KERNEL-VERSION             CONTAINER-RUNTIME
devops-assignment-control-plane   Ready    control-plane   2m23s   v1.37.0   172.18.0.2    <none>        Debian GNU/Linux 13 (trixie)   6.12.76-linuxkit (arm64)   containerd://2.3.4

NAME        READY   STATUS      RESTARTS   AGE   IP           NODE                              NOMINATED NODE   READINESS GATES
hello-pod   0/1     Completed   0          6s    10.244.0.5   devops-assignment-control-plane   <none>           <none>

Hello Kubernetes
```

## What I understood

Kubernetes uses objects to run workloads. A Pod is the smallest unit, and I checked its output using `kubectl logs`.