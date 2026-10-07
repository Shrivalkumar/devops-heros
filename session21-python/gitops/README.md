# GitOps hand-off

I use this Argo CD `Application` as the GitOps hand-off. Argo CD watches the Helm chart in this repository, compares Git with the cluster, and reconciles drift automatically. Before using it in a shared cluster, I replace the local validation image names in `values-gitops.yaml` with immutable GHCR image tags from the CI workflow.

```bash
kubectl apply -f gitops/argocd-application.yaml
kubectl -n argocd get applications.argoproj.io taskboard
```
