output "cosmosdb_gremlin_graphs_id" {
  description = "Map of id values across all cosmosdb_gremlin_graphs, keyed the same as var.cosmosdb_gremlin_graphs"
  value       = { for k, v in azurerm_cosmosdb_gremlin_graph.cosmosdb_gremlin_graphs : k => v.id if v.id != null && length(v.id) > 0 }
}
output "cosmosdb_gremlin_graphs_account_name" {
  description = "Map of account_name values across all cosmosdb_gremlin_graphs, keyed the same as var.cosmosdb_gremlin_graphs"
  value       = { for k, v in azurerm_cosmosdb_gremlin_graph.cosmosdb_gremlin_graphs : k => v.account_name if v.account_name != null && length(v.account_name) > 0 }
}
output "cosmosdb_gremlin_graphs_analytical_storage_ttl" {
  description = "Map of analytical_storage_ttl values across all cosmosdb_gremlin_graphs, keyed the same as var.cosmosdb_gremlin_graphs"
  value       = { for k, v in azurerm_cosmosdb_gremlin_graph.cosmosdb_gremlin_graphs : k => v.analytical_storage_ttl if v.analytical_storage_ttl != null }
}
output "cosmosdb_gremlin_graphs_autoscale_settings" {
  description = "Map of autoscale_settings values across all cosmosdb_gremlin_graphs, keyed the same as var.cosmosdb_gremlin_graphs"
  value       = { for k, v in azurerm_cosmosdb_gremlin_graph.cosmosdb_gremlin_graphs : k => v.autoscale_settings if v.autoscale_settings != null && length(v.autoscale_settings) > 0 }
}
output "cosmosdb_gremlin_graphs_conflict_resolution_policy" {
  description = "Map of conflict_resolution_policy values across all cosmosdb_gremlin_graphs, keyed the same as var.cosmosdb_gremlin_graphs"
  value       = { for k, v in azurerm_cosmosdb_gremlin_graph.cosmosdb_gremlin_graphs : k => v.conflict_resolution_policy if v.conflict_resolution_policy != null && length(v.conflict_resolution_policy) > 0 }
}
output "cosmosdb_gremlin_graphs_database_name" {
  description = "Map of database_name values across all cosmosdb_gremlin_graphs, keyed the same as var.cosmosdb_gremlin_graphs"
  value       = { for k, v in azurerm_cosmosdb_gremlin_graph.cosmosdb_gremlin_graphs : k => v.database_name if v.database_name != null && length(v.database_name) > 0 }
}
output "cosmosdb_gremlin_graphs_default_ttl" {
  description = "Map of default_ttl values across all cosmosdb_gremlin_graphs, keyed the same as var.cosmosdb_gremlin_graphs"
  value       = { for k, v in azurerm_cosmosdb_gremlin_graph.cosmosdb_gremlin_graphs : k => v.default_ttl if v.default_ttl != null }
}
output "cosmosdb_gremlin_graphs_index_policy" {
  description = "Map of index_policy values across all cosmosdb_gremlin_graphs, keyed the same as var.cosmosdb_gremlin_graphs"
  value       = { for k, v in azurerm_cosmosdb_gremlin_graph.cosmosdb_gremlin_graphs : k => v.index_policy if v.index_policy != null && length(v.index_policy) > 0 }
}
output "cosmosdb_gremlin_graphs_name" {
  description = "Map of name values across all cosmosdb_gremlin_graphs, keyed the same as var.cosmosdb_gremlin_graphs"
  value       = { for k, v in azurerm_cosmosdb_gremlin_graph.cosmosdb_gremlin_graphs : k => v.name if v.name != null && length(v.name) > 0 }
}
output "cosmosdb_gremlin_graphs_partition_key_path" {
  description = "Map of partition_key_path values across all cosmosdb_gremlin_graphs, keyed the same as var.cosmosdb_gremlin_graphs"
  value       = { for k, v in azurerm_cosmosdb_gremlin_graph.cosmosdb_gremlin_graphs : k => v.partition_key_path if v.partition_key_path != null && length(v.partition_key_path) > 0 }
}
output "cosmosdb_gremlin_graphs_partition_key_version" {
  description = "Map of partition_key_version values across all cosmosdb_gremlin_graphs, keyed the same as var.cosmosdb_gremlin_graphs"
  value       = { for k, v in azurerm_cosmosdb_gremlin_graph.cosmosdb_gremlin_graphs : k => v.partition_key_version if v.partition_key_version != null }
}
output "cosmosdb_gremlin_graphs_resource_group_name" {
  description = "Map of resource_group_name values across all cosmosdb_gremlin_graphs, keyed the same as var.cosmosdb_gremlin_graphs"
  value       = { for k, v in azurerm_cosmosdb_gremlin_graph.cosmosdb_gremlin_graphs : k => v.resource_group_name if v.resource_group_name != null && length(v.resource_group_name) > 0 }
}
output "cosmosdb_gremlin_graphs_throughput" {
  description = "Map of throughput values across all cosmosdb_gremlin_graphs, keyed the same as var.cosmosdb_gremlin_graphs"
  value       = { for k, v in azurerm_cosmosdb_gremlin_graph.cosmosdb_gremlin_graphs : k => v.throughput if v.throughput != null }
}
output "cosmosdb_gremlin_graphs_unique_key" {
  description = "Map of unique_key values across all cosmosdb_gremlin_graphs, keyed the same as var.cosmosdb_gremlin_graphs"
  value       = { for k, v in azurerm_cosmosdb_gremlin_graph.cosmosdb_gremlin_graphs : k => v.unique_key if v.unique_key != null && length(v.unique_key) > 0 }
}

