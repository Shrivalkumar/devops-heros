# Kubernetes Networking & Services

## Task

I practiced Kubernetes service networking using ClusterIP, NodePort, LoadBalancer, ExternalName, and Headless Service.

## Files

```text
manifests/01-clusterip/
manifests/02-nodeport/
manifests/03-loadbalancer/
manifests/04-externalname/
manifests/05-headless/
```

## Commands I ran

Run these commands from this assignment folder:

```bash
kubectl apply -f manifests/01-clusterip
kubectl rollout status deployment/web-app-clusterip --timeout=120s
kubectl wait --for=condition=Ready pod/curl-client --timeout=120s
kubectl get pods -l app=web-clusterip -o wide
kubectl get svc web-service-clusterip
kubectl get endpoints web-service-clusterip
kubectl exec curl-client -- curl -s http://web-service-clusterip:8080

kubectl apply -f manifests/02-nodeport
kubectl apply -f manifests/03-loadbalancer
kubectl apply -f manifests/04-externalname
kubectl apply -f manifests/05-headless
kubectl get svc
kubectl exec dns-test-client -- nslookup external-database-service
kubectl exec headless-dns-client -- nslookup web-service-headless
kubectl port-forward service/web-service-clusterip 18081:8080 --address 127.0.0.1
```

## Output

```text
NAME                    TYPE        CLUSTER-IP      EXTERNAL-IP   PORT(S)    AGE
web-service-clusterip   ClusterIP   10.96.240.159   <none>        8080/TCP   1s

NAME                    ENDPOINTS                                      AGE
web-service-clusterip   10.244.0.12:80,10.244.0.14:80,10.244.0.15:80   1s

NAME                        TYPE           CLUSTER-IP      EXTERNAL-IP        PORT(S)        AGE
web-service-nodeport        NodePort       10.96.154.139   <none>             80:30081/TCP   0s
web-service-clusterip       ClusterIP      10.96.240.159   <none>             8080/TCP       49s
web-service-loadbalancer    LoadBalancer   10.96.50.192    <pending>          80:30255/TCP   14s
external-database-service   ExternalName   <none>          nencyravaliya.me   <none>         14s
web-service-headless        ClusterIP      None            <none>             80/TCP         14s

external-database-service.default.svc.cluster.local canonical name = nencyravaliya.me

Name: web-service-headless.default.svc.cluster.local
Address: 10.244.0.24
Name: web-service-headless.default.svc.cluster.local
Address: 10.244.0.23
Name: web-service-headless.default.svc.cluster.local
Address: 10.244.0.25
```

`LoadBalancer` showed `<pending>` because I tested this on a local `kind` cluster.

## Screenshot

![ClusterIP service running through port-forward](images/clusterip-service.png)

## What I understood

Services give pods stable networking. ClusterIP is internal, NodePort exposes a node port, LoadBalancer is used in cloud setups, ExternalName maps to DNS, and Headless Service returns pod IPs.