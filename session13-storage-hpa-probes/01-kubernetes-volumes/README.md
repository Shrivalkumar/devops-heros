# Kubernetes volumes

I used this session to understand how Kubernetes keeps or shares data beyond a single container process.

| Volume type | What I learned | Practical fit |
|---|---|---|
| emptyDir | Kubernetes creates it when the Pod starts and removes it when that Pod is removed. | Temporary cache, generated files, or sidecar hand-off. |
| hostPath | It mounts a path from the node filesystem. | Local node agents; I avoid it for portable production apps. |
| PersistentVolume | It represents storage made available to the cluster. | An administrator-provisioned disk or share. |
| PersistentVolumeClaim | It is the application's request for storage. | A Pod mounts the claim without knowing the storage implementation. |
| StorageClass | It defines a provisioner and storage policy. | Choosing a cloud disk class. |
| Dynamic provisioning | Kubernetes creates a PV when a PVC asks for a StorageClass. | Normal cloud or Kind development workflows. |

The original hands-on examples are in ../01-volumes and ../02-persistent-storage. The mini project uses a web-data PVC mounted at /data by the web application.
