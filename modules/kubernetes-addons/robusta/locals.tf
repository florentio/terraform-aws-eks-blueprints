locals {
  name = "robusta"
  default_helm_config = {
    name        = local.name
    chart       = local.name
    repository  = "https://robusta-charts.storage.googleapis.com"
    version     = "0.10.6"
    namespace   = local.name
    values      = local.default_helm_values
    description = "Robusta Helm Chart deployment configuration"
  }

  helm_config = merge(
    local.default_helm_config,
    var.helm_config
  )

  default_helm_values = [templatefile("${path.module}/values.yaml", {
    eks_cluster_id = var.addon_context.eks_cluster_id
  })]


  argocd_gitops_config = {
    enable = true
  }
}
