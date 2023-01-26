output "cluster_id" {
  value       = module.eks.cluster_id
  description = "ID of the created EKS cluster"
}

output "autoscaling_group_names" {
  value = { for name, value in module.eks.eks_managed_node_groups : name => lookup(lookup(value, "node_group_autoscaling_group_names")[0], "name") }
}