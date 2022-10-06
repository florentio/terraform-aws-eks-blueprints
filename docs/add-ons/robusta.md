# ROBUSTA

Robusta is an open source platform for Kubernetes troubleshooting. It sits on top of your monitoring stack (Prometheus, Elasticsearch, etc.) and tells you why alerts occurred and how to fix them.

[ROBUSTA](https://github.com/robusta-dev/robusta/tree/master/helm/robusta) chart bootstraps ROBUSTA infrastructure on a Kubernetes cluster using the Helm package manager.

For complete project documentation, please visit the [ROBUSTA documentation site](https://docs.robusta.dev/master/installation.html).

## Usage

Robusta can be deployed by enabling the add-on via the following.

```hcl
enable_robusta = true
```

Deploy Robusta with custom `values.yaml`

```hcl
  # Optional Map value; pass robusta-values.yaml from consumer module
  robusta_helm_config = {
    name       = "robusta"                                               # (Required) Release name.
    repository = "https://robustacore.github.io/charts"                  # (Optional) Repository URL where to locate the requested chart.
    chart      = "robusta"                                               # (Required) Chart name to be installed.
    version    = "0.10.6"                                                 # (Optional) Specify the exact chart version to install. If this is not specified, it defaults to the version set within default_helm_config: https://github.com/aws-ia/terraform-aws-eks-blueprints/blob/main/modules/kubernetes-addons/robusta/locals.tf
    namespace  = "robusta"                                               # (Optional) The namespace to install the release into.
    values = [templatefile("${path.module}/robusta-values.yaml", {})]
  }
```

### GitOps Configuration

The following properties are made available for use when managing the add-on via GitOps.

```
robusta = {
  enable             = true
}
```
