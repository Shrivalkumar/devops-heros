# Session 20 — Monitoring, Observability & GitOps

This session combines a local Prometheus/Grafana monitoring lab with a Kubernetes GitOps deployment managed by Argo CD.

## Deliverables

- [Monitoring demo](09-monitoring-demo/README.md): metrics, logs, CPU/memory, health check, and a real alert rule.
- [Observability notes](02-metrics-logs-traces/README.md): the metrics, logs, and traces pillars.
- [GitOps mini project](08-mini-project/README.md): declarative Kubernetes manifests and Argo CD reconciliation.

## Observability in one view

| Pillar | What it answers | Examples | Typical tools |
| --- | --- | --- | --- |
| Metrics | How much, how often, and how fast? | CPU, memory, error rate, latency | Prometheus, Grafana, CloudWatch |
| Logs | What happened? | Request events, warnings, stack traces | Loki, Elasticsearch, Fluent Bit |
| Traces | Where did one request spend time? | API → service → database | OpenTelemetry, Jaeger, Tempo |

Observability is required because dashboards and alerts identify that a service is unhealthy, while logs and traces help explain why. It reduces time to detect and diagnose failures.

## Kubernetes observability

Kubernetes adds nodes, pods, containers, and controllers to the system being observed. Useful signals include Pod readiness, restarts, resource requests/limits, CPU and memory, events, and container logs. A common stack is metrics-server plus Prometheus/Grafana for metrics, Fluent Bit plus Loki or Elasticsearch for logs, and OpenTelemetry with Tempo or Jaeger for traces.

## GitOps

GitOps treats Git as the source of truth for declarative infrastructure and application manifests. Developers change YAML through commits and pull requests; a reconciler such as Argo CD continuously compares Git’s desired state with the cluster’s actual state and applies or repairs drift.

```text
Git commit → Git repository (desired state) → Argo CD reconciliation → Kubernetes (actual state)
```

The GitOps demo uses automated sync, pruning, and self-healing. A manual scale change is drift; Argo CD restores the committed replica count.
