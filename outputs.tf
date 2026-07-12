output "cosmosdb_gremlin_graphs_id" {
  description = "Map of id values across all cosmosdb_gremlin_graphs, keyed the same as var.cosmosdb_gremlin_graphs"
  value       = { for k, v in azurerm_cosmosdb_gremlin_graph.cosmosdb_gremlin_graphs : k => v.id }
}
output "cosmosdb_gremlin_graphs_account_name" {
  description = "Map of account_name values across all cosmosdb_gremlin_graphs, keyed the same as var.cosmosdb_gremlin_graphs"
  value       = { for k, v in azurerm_cosmosdb_gremlin_graph.cosmosdb_gremlin_graphs : k => v.account_name }
}
output "cosmosdb_gremlin_graphs_analytical_storage_ttl" {
  description = "Map of analytical_storage_ttl values across all cosmosdb_gremlin_graphs, keyed the same as var.cosmosdb_gremlin_graphs"
  value       = { for k, v in azurerm_cosmosdb_gremlin_graph.cosmosdb_gremlin_graphs : k => v.analytical_storage_ttl }
}
output "cosmosdb_gremlin_graphs_autoscale_settings" {
  description = "Map of autoscale_settings values across all cosmosdb_gremlin_graphs, keyed the same as var.cosmosdb_gremlin_graphs"
  value       = { for k, v in azurerm_cosmosdb_gremlin_graph.cosmosdb_gremlin_graphs : k => v.autoscale_settings }
}
output "cosmosdb_gremlin_graphs_conflict_resolution_policy" {
  description = "Map of conflict_resolution_policy values across all cosmosdb_gremlin_graphs, keyed the same as var.cosmosdb_gremlin_graphs"
  value       = { for k, v in azurerm_cosmosdb_gremlin_graph.cosmosdb_gremlin_graphs : k => v.conflict_resolution_policy }
}
output "cosmosdb_gremlin_graphs_database_name" {
  description = "Map of database_name values across all cosmosdb_gremlin_graphs, keyed the same as var.cosmosdb_gremlin_graphs"
  value       = { for k, v in azurerm_cosmosdb_gremlin_graph.cosmosdb_gremlin_graphs : k => v.database_name }
}
output "cosmosdb_gremlin_graphs_default_ttl" {
  description = "Map of default_ttl values across all cosmosdb_gremlin_graphs, keyed the same as var.cosmosdb_gremlin_graphs"
  value       = { for k, v in azurerm_cosmosdb_gremlin_graph.cosmosdb_gremlin_graphs : k => v.default_ttl }
}
output "cosmosdb_gremlin_graphs_index_policy" {
  description = "Map of index_policy values across all cosmosdb_gremlin_graphs, keyed the same as var.cosmosdb_gremlin_graphs"
  value       = { for k, v in azurerm_cosmosdb_gremlin_graph.cosmosdb_gremlin_graphs : k => v.index_policy }
}
output "cosmosdb_gremlin_graphs_name" {
  description = "Map of name values across all cosmosdb_gremlin_graphs, keyed the same as var.cosmosdb_gremlin_graphs"
  value       = { for k, v in azurerm_cosmosdb_gremlin_graph.cosmosdb_gremlin_graphs : k => v.name }
}
output "cosmosdb_gremlin_graphs_partition_key_path" {
  description = "Map of partition_key_path values across all cosmosdb_gremlin_graphs, keyed the same as var.cosmosdb_gremlin_graphs"
  value       = { for k, v in azurerm_cosmosdb_gremlin_graph.cosmosdb_gremlin_graphs : k => v.partition_key_path }
}
output "cosmosdb_gremlin_graphs_partition_key_version" {
  description = "Map of partition_key_version values across all cosmosdb_gremlin_graphs, keyed the same as var.cosmosdb_gremlin_graphs"
  value       = { for k, v in azurerm_cosmosdb_gremlin_graph.cosmosdb_gremlin_graphs : k => v.partition_key_version }
}
output "cosmosdb_gremlin_graphs_resource_group_name" {
  description = "Map of resource_group_name values across all cosmosdb_gremlin_graphs, keyed the same as var.cosmosdb_gremlin_graphs"
  value       = { for k, v in azurerm_cosmosdb_gremlin_graph.cosmosdb_gremlin_graphs : k => v.resource_group_name }
}
output "cosmosdb_gremlin_graphs_throughput" {
  description = "Map of throughput values across all cosmosdb_gremlin_graphs, keyed the same as var.cosmosdb_gremlin_graphs"
  value       = { for k, v in azurerm_cosmosdb_gremlin_graph.cosmosdb_gremlin_graphs : k => v.throughput }
}
output "cosmosdb_gremlin_graphs_unique_key" {
  description = "Map of unique_key values across all cosmosdb_gremlin_graphs, keyed the same as var.cosmosdb_gremlin_graphs"
  value       = { for k, v in azurerm_cosmosdb_gremlin_graph.cosmosdb_gremlin_graphs : k => v.unique_key }
}

