### What's changed in v0.1.0

* feat: helm chart xrd (by @patrickleet)

* fix: standardize GitHub workflows (by @patrickleet)

* fix: add status rendering (by @patrickleet)

* chore(deps): update unbounded-tech/workflow-vnext-tag action to v1.21.0 (#2) (by @renovate[bot])

  Co-authored-by: renovate[bot] <29139614+renovate[bot]@users.noreply.github.com>

* fix: update e2e test to use Rapid channel and typed model (by @patrickleet)

  - Use autoUpgrade.channel = "Rapid" instead of pinning version
  - Use typed helmv1alpha1.ArgoRollouts model for manifest
  - Add defaultConditions, timeoutSeconds, cleanupTimeoutSeconds
  - Use helm.m.crossplane.io/v1beta1 for ProviderConfig API

  Co-Authored-By: Claude Opus 4.5 <noreply@anthropic.com>

* fix: add ClusterRoleBinding for RBAC permissions in e2e test (by @patrickleet)

  The Helm provider needs cluster-admin permissions to create
  namespaces and install charts with InjectedIdentity credentials.
  This matches the pattern used in the cert-manager e2e test.

  Co-Authored-By: Claude Opus 4.5 <noreply@anthropic.com>


