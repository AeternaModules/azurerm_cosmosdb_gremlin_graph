output "cosmosdb_gremlin_graphs" {
  description = "All cosmosdb_gremlin_graph resources"
  value       = azurerm_cosmosdb_gremlin_graph.cosmosdb_gremlin_graphs
}
output "cosmosdb_gremlin_graphs_account_name" {
  description = "List of account_name values across all cosmosdb_gremlin_graphs"
  value       = [for k, v in azurerm_cosmosdb_gremlin_graph.cosmosdb_gremlin_graphs : v.account_name]
}
output "cosmosdb_gremlin_graphs_analytical_storage_ttl" {
  description = "List of analytical_storage_ttl values across all cosmosdb_gremlin_graphs"
  value       = [for k, v in azurerm_cosmosdb_gremlin_graph.cosmosdb_gremlin_graphs : v.analytical_storage_ttl]
}
output "cosmosdb_gremlin_graphs_autoscale_settings" {
  description = "List of autoscale_settings values across all cosmosdb_gremlin_graphs"
  value       = [for k, v in azurerm_cosmosdb_gremlin_graph.cosmosdb_gremlin_graphs : v.autoscale_settings]
}
output "cosmosdb_gremlin_graphs_conflict_resolution_policy" {
  description = "List of conflict_resolution_policy values across all cosmosdb_gremlin_graphs"
  value       = [for k, v in azurerm_cosmosdb_gremlin_graph.cosmosdb_gremlin_graphs : v.conflict_resolution_policy]
}
output "cosmosdb_gremlin_graphs_database_name" {
  description = "List of database_name values across all cosmosdb_gremlin_graphs"
  value       = [for k, v in azurerm_cosmosdb_gremlin_graph.cosmosdb_gremlin_graphs : v.database_name]
}
output "cosmosdb_gremlin_graphs_default_ttl" {
  description = "List of default_ttl values across all cosmosdb_gremlin_graphs"
  value       = [for k, v in azurerm_cosmosdb_gremlin_graph.cosmosdb_gremlin_graphs : v.default_ttl]
}
output "cosmosdb_gremlin_graphs_index_policy" {
  description = "List of index_policy values across all cosmosdb_gremlin_graphs"
  value       = [for k, v in azurerm_cosmosdb_gremlin_graph.cosmosdb_gremlin_graphs : v.index_policy]
}
output "cosmosdb_gremlin_graphs_name" {
  description = "List of name values across all cosmosdb_gremlin_graphs"
  value       = [for k, v in azurerm_cosmosdb_gremlin_graph.cosmosdb_gremlin_graphs : v.name]
}
output "cosmosdb_gremlin_graphs_partition_key_path" {
  description = "List of partition_key_path values across all cosmosdb_gremlin_graphs"
  value       = [for k, v in azurerm_cosmosdb_gremlin_graph.cosmosdb_gremlin_graphs : v.partition_key_path]
}
output "cosmosdb_gremlin_graphs_partition_key_version" {
  description = "List of partition_key_version values across all cosmosdb_gremlin_graphs"
  value       = [for k, v in azurerm_cosmosdb_gremlin_graph.cosmosdb_gremlin_graphs : v.partition_key_version]
}
output "cosmosdb_gremlin_graphs_resource_group_name" {
  description = "List of resource_group_name values across all cosmosdb_gremlin_graphs"
  value       = [for k, v in azurerm_cosmosdb_gremlin_graph.cosmosdb_gremlin_graphs : v.resource_group_name]
}
output "cosmosdb_gremlin_graphs_throughput" {
  description = "List of throughput values across all cosmosdb_gremlin_graphs"
  value       = [for k, v in azurerm_cosmosdb_gremlin_graph.cosmosdb_gremlin_graphs : v.throughput]
}
output "cosmosdb_gremlin_graphs_unique_key" {
  description = "List of unique_key values across all cosmosdb_gremlin_graphs"
  value       = [for k, v in azurerm_cosmosdb_gremlin_graph.cosmosdb_gremlin_graphs : v.unique_key]
}

