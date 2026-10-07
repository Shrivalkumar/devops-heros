# Troubleshooting notes

I use the files in this folder as deliberate failure exercises. I apply one in a disposable namespace, inspect it, fix it, then verify the workload becomes ready.

## Broken image

`broken-image.yaml` uses an image name that does not exist.

```bash
kubectl apply -f troubleshooting/broken-image.yaml
kubectl get pods
kubectl describe pod <pod-name>
```

The symptom is `ImagePullBackOff`; `describe` shows the failed pull. I correct the image reference or pull secret, reapply, and confirm the Pod reaches `Running`.

## Broken service selector

`broken-service.yaml` uses a selector that does not match the application labels.

```bash
kubectl apply -f troubleshooting/broken-service.yaml
kubectl get endpoints broken-service
kubectl get pods --show-labels
```

The Service has no endpoints even though the Pod can be healthy. I align the selector with the Pod labels and check that endpoints appear.

## Real validation issue

The original frontend Nginx configuration proxied to `backend`, which works in Compose but not Kubernetes. The frontend logs showed `host not found in upstream "backend"`, so it entered `CrashLoopBackOff`.

I compared the Compose and Kubernetes service names and added `helm/taskboard/templates/frontend-nginx-configmap.yaml`. The mounted config proxies to `taskboard-taskboard-backend:8000`. After `helm upgrade`, the frontend reached 2/2 ready replicas and `/api/tasks` worked through the frontend Service.
