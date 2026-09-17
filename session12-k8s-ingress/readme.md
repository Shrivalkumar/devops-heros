# Kubernetes Ingress, ConfigMaps & Secrets

## Task

I deployed a demo application using a ConfigMap, Secret, frontend Deployment, backend Deployment, Services, and Ingress.

## Files

```text
manifests/configmap.yaml
manifests/secret.yaml
manifests/frontend.yaml
manifests/backend.yaml
manifests/ingress.yaml
```

## Commands I ran

I used `ingress-nginx` as the Ingress controller:

```bash
kubectl apply -f https://raw.githubusercontent.com/kubernetes/ingress-nginx/controller-v1.15.1/deploy/static/provider/kind/deploy.yaml
kubectl wait --namespace ingress-nginx --for=condition=Ready pod --selector=app.kubernetes.io/component=controller --timeout=180s
```

Run these commands from the `manifests` folder:

```bash
kubectl apply -f configmap.yaml -f secret.yaml -f frontend.yaml -f backend.yaml -f ingress.yaml
kubectl rollout status deployment/yatri-frontend --timeout=120s
kubectl rollout status deployment/yatri-backend --timeout=120s
kubectl get configmap yatri-app-config
kubectl get secret yatri-db-secret
kubectl get svc yatri-frontend-service yatri-backend-service
kubectl get ingress yatri-ingress
kubectl get configmap yatri-app-config -o jsonpath='{.data.ENVIRONMENT}'
kubectl get secret yatri-db-secret -o jsonpath='{.data.POSTGRES_PASSWORD}' | base64 --decode
kubectl exec <backend-pod-name> -- printenv
kubectl port-forward -n ingress-nginx service/ingress-nginx-controller 18082:80 --address 127.0.0.1
curl -H "Host: yatri.local" http://127.0.0.1:18082/
curl -H "Host: yatri.local" http://127.0.0.1:18082/api/
```

## Output

```text
NAME               DATA   AGE
yatri-app-config   5      1s

NAME              TYPE     DATA   AGE
yatri-db-secret   Opaque   3      1s

NAME                     TYPE        CLUSTER-IP      EXTERNAL-IP   PORT(S)   AGE
yatri-frontend-service   ClusterIP   10.96.240.160   <none>        80/TCP    1s
yatri-backend-service    ClusterIP   10.96.50.103    <none>        80/TCP    1s

NAME            CLASS   HOSTS         ADDRESS     PORTS   AGE
yatri-ingress   nginx   yatri.local   localhost   80      56s

production
secretpassword

ENVIRONMENT=production
LOG_LEVEL=INFO
POSTGRES_USER=yatri_admin
POSTGRES_DB=yatri_production_db
DEFAULT_CURRENCY=INR
```

Ingress routes:

```text
Host: yatri.local
/api(/|$)(.*)   yatri-backend-service:80
/               yatri-frontend-service:80
```

Backend API output:

```text
Yatri Backend API
=================
ENVIRONMENT     : production
LOG_LEVEL       : INFO
DEFAULT_CURRENCY: INR
POSTGRES_USER   : yatri_admin
POSTGRES_DB     : yatri_production_db
```

## Screenshots

![Ingress frontend route](images/ingress-frontend.png)

![Ingress backend API route](images/ingress-backend-api.png)

## What I understood

ConfigMaps store normal config values. Secrets store sensitive values. Ingress routes HTTP traffic, so `/` goes to the frontend and `/api/` goes to the backend.