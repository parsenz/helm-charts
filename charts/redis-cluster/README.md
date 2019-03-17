Redis Cluster Helm Chart
========================

Redis cluster chart with automated cluster initialization. Minimizes data volatility by using
[persistent volumes claims](https://kubernetes.io/docs/concepts/storage/dynamic-provisioning/).

Deploys a statefulset with `{{ .Values.replicaCount }}` pods. Once all pods are up, creates a
redis cluster with `{{ .Values.redplicaTolerance }}` slaves by issuing a
[redis cluster create](https://redis.io/topics/cluster-tutorial) command
reading pod IP addresses from the downward API.

## Bin all that, how do I use it?
```
$ helm install --name redis-cluster charts/redis-cluster
```

Todo
====

1. Prefer custom operator for state and pod maintenance.
2. Improve value flexibility.

Profit!
