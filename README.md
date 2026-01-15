# helm-argo-rollouts

Installs the Argo Rollouts Helm chart using Crossplane and the Helm provider.

## Getting Started

1) Install the configuration package.
2) Apply a minimal claim:

```yaml
apiVersion: helm.hops.ops.com.ai/v1alpha1
kind: ArgoRollouts
metadata:
  name: argo-rollouts
  namespace: default
spec:
  clusterName: my-cluster
```

## Growing

- Customize chart values through `spec.values`.
- Override all defaults with `spec.overrideAllValues`.
- Set a non-default Helm provider with `spec.providerConfigRef`.

## Enterprise Scale

- Run in GitOps mode using the `.gitops/deploy` chart.
- Pin versions using release tags in your GitOps pipeline.

## Import Existing

Importing existing Helm releases is not exposed by this XRD yet. Create a new
release and migrate workloads using Argo Rollouts techniques.
