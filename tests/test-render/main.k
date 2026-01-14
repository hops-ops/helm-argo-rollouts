import models.ai.com.ops.hops.helm.v1alpha1 as helmv1alpha1
import models.io.upbound.dev.meta.v1alpha1 as metav1alpha1
import models.k8s.apimachinery.pkg.apis.meta.v1 as metav1

_items = [
    metav1alpha1.CompositionTest {
        metadata.name = "minimal-renders-helm-release"
        spec = {
            compositionPath = "apis/argorollouts/composition.yaml"
            xrdPath = "apis/argorollouts/definition.yaml"
            timeoutSeconds = 60
            validate = False
            xr = helmv1alpha1.ArgoRollouts {
                metadata.name = "test-argo-rollouts"
                spec.clusterName = "test-cluster"
            }
            assertResources = [
                {
                    apiVersion = "helm.m.crossplane.io/v1beta1"
                    kind = "Release"
                    metadata.name = "test-argo-rollouts"
                }
            ]
        }
    }

    metav1alpha1.CompositionTest {
        metadata.name = "custom-labels-merged-with-defaults"
        spec = {
            compositionPath = "apis/argorollouts/composition.yaml"
            xrdPath = "apis/argorollouts/definition.yaml"
            timeoutSeconds = 60
            validate = False
            xr = helmv1alpha1.ArgoRollouts {
                metadata.name = "labeled-rollouts"
                spec = {
                    clusterName = "test-cluster"
                    labels = {team = "platform"}
                }
            }
            assertResources = [
                {
                    apiVersion = "helm.m.crossplane.io/v1beta1"
                    kind = "Release"
                    metadata = {
                        name = "labeled-rollouts"
                        labels = {
                            "hops.ops.com.ai/managed" = "true"
                            "hops.ops.com.ai/argorollouts" = "labeled-rollouts"
                            team = "platform"
                        }
                    }
                }
            ]
        }
    }

    metav1alpha1.CompositionTest {
        metadata.name = "override-all-values"
        spec = {
            compositionPath = "apis/argorollouts/composition.yaml"
            xrdPath = "apis/argorollouts/definition.yaml"
            timeoutSeconds = 60
            validate = False
            xr = helmv1alpha1.ArgoRollouts {
                metadata.name = "override-test"
                spec = {
                    clusterName = "my-cluster"
                    overrideAllValues = {fullnameOverride = "custom-rollouts", dashboard = {enabled = True}}
                }
            }
            assertResources = [
                {
                    apiVersion = "helm.m.crossplane.io/v1beta1"
                    kind = "Release"
                    metadata.name = "override-test"
                    spec.forProvider.values = {
                        fullnameOverride = "custom-rollouts"
                        dashboard = {enabled = True}
                    }
                }
            ]
        }
    }
]

items = _items
