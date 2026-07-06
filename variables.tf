variable "cosmosdb_gremlin_graphs" {
  description = <<EOT
Map of cosmosdb_gremlin_graphs, attributes below
Required:
    - account_name
    - database_name
    - name
    - partition_key_path
    - resource_group_name
Optional:
    - analytical_storage_ttl
    - default_ttl
    - partition_key_version
    - throughput
    - autoscale_settings (block):
        - max_throughput (optional)
    - conflict_resolution_policy (block):
        - conflict_resolution_path (optional)
        - conflict_resolution_procedure (optional)
        - mode (required)
    - index_policy (block):
        - automatic (optional)
        - composite_index (optional, block):
            - index (required, block):
                - order (required)
                - path (required)
        - excluded_paths (optional)
        - included_paths (optional)
        - indexing_mode (required)
        - spatial_index (optional, block):
            - path (required)
    - unique_key (block):
        - paths (required)
EOT

  type = map(object({
    account_name           = string
    database_name          = string
    name                   = string
    partition_key_path     = string
    resource_group_name    = string
    analytical_storage_ttl = optional(number)
    default_ttl            = optional(number)
    partition_key_version  = optional(number)
    throughput             = optional(number)
    autoscale_settings = optional(object({
      max_throughput = optional(number)
    }))
    conflict_resolution_policy = optional(object({
      conflict_resolution_path      = optional(string)
      conflict_resolution_procedure = optional(string)
      mode                          = string
    }))
    index_policy = optional(object({
      automatic = optional(bool) # Default: true
      composite_index = optional(object({
        index = list(object({
          order = string
          path  = string
        }))
      }))
      excluded_paths = optional(set(string))
      included_paths = optional(set(string))
      indexing_mode  = string
      spatial_index = optional(object({
        path = string
      }))
    }))
    unique_key = optional(object({
      paths = set(string)
    }))
  }))
  validation {
    condition = alltrue([
      for k, v in var.cosmosdb_gremlin_graphs : (
        length(v.index_policy.composite_index.index) >= 1
      )
    ])
    error_message = "Each index list must contain at least 1 items"
  }
  validation {
    condition = alltrue([
      for k, v in var.cosmosdb_gremlin_graphs : (
        length(v.partition_key_path) > 0
      )
    ])
    error_message = "must not be empty"
  }
  validation {
    condition = alltrue([
      for k, v in var.cosmosdb_gremlin_graphs : (
        v.partition_key_version == null || (v.partition_key_version >= 1 && v.partition_key_version <= 2)
      )
    ])
    error_message = "must be between 1 and 2"
  }
  validation {
    condition = alltrue([
      for k, v in var.cosmosdb_gremlin_graphs : (
        v.index_policy == null || (v.index_policy.included_paths == null || (length(v.index_policy.included_paths) > 0))
      )
    ])
    error_message = "must not be empty"
  }
  validation {
    condition = alltrue([
      for k, v in var.cosmosdb_gremlin_graphs : (
        v.index_policy == null || (v.index_policy.excluded_paths == null || (length(v.index_policy.excluded_paths) > 0))
      )
    ])
    error_message = "must not be empty"
  }
  validation {
    condition = alltrue([
      for k, v in var.cosmosdb_gremlin_graphs : (
        v.index_policy == null || (v.index_policy.spatial_index == null || (length(v.index_policy.spatial_index.path) > 0))
      )
    ])
    error_message = "must not be empty"
  }
  validation {
    condition = alltrue([
      for k, v in var.cosmosdb_gremlin_graphs : (
        v.conflict_resolution_policy == null || (v.conflict_resolution_policy.conflict_resolution_path == null || (length(v.conflict_resolution_policy.conflict_resolution_path) > 0))
      )
    ])
    error_message = "must not be empty"
  }
  validation {
    condition = alltrue([
      for k, v in var.cosmosdb_gremlin_graphs : (
        v.conflict_resolution_policy == null || (v.conflict_resolution_policy.conflict_resolution_procedure == null || (length(v.conflict_resolution_policy.conflict_resolution_procedure) > 0))
      )
    ])
    error_message = "must not be empty"
  }
  validation {
    condition = alltrue([
      for k, v in var.cosmosdb_gremlin_graphs : (
        v.unique_key == null || (length(v.unique_key.paths) > 0)
      )
    ])
    error_message = "must not be empty"
  }
  # --- Unconfirmed validation candidates, derived from azurerm_cosmosdb_gremlin_graph's provider source ---
  # Not auto-enabled: either a bespoke provider validator we can't safely translate,
  # or a path that crosses a list-typed block (needs its own for_each wrapping).
  # Review, translate into a real validation{} block above, and delete once confirmed.
  # path: name
  #   source:    [from validate.CosmosEntityName] len(value) < 1 || len(value) > 255
  # path: resource_group_name
  #   condition: length(value) <= 90
  #   message:   [from resourcegroups.ValidateName: invalid when len(value) > 90]
  #   source:    [from resourcegroups.ValidateName: invalid when len(value) > 90]
  # path: resource_group_name
  #   condition: !endswith(value, ".")
  #   message:   [from resourcegroups.ValidateName: must not end with "."]
  #   source:    [from resourcegroups.ValidateName: must not end with "."]
  # path: resource_group_name
  #   condition: length(value) != 0
  #   message:   [from resourcegroups.ValidateName: invalid when len(value) == 0]
  #   source:    [from resourcegroups.ValidateName: invalid when len(value) == 0]
  # path: resource_group_name
  #   source:    [from resourcegroups.ValidateName] !matched
  # path: account_name
  #   source:    [from validate.CosmosAccountName] !matched
  # path: database_name
  #   source:    [from validate.CosmosEntityName] len(value) < 1 || len(value) > 255
  # path: analytical_storage_ttl
  #   source:    validation.All(...) - no translation rule yet, add one
  # path: throughput
  #   source:    [from validate.CosmosThroughput] value < 400
  # path: throughput
  #   source:    [from validate.CosmosThroughput] value%100 != 0
  # path: autoscale_settings.max_throughput
  #   source:    [from validate.CosmosMaxThroughput] !ok
  # path: autoscale_settings.max_throughput
  #   source:    [from validate.CosmosMaxThroughput] v < 1000
  # path: autoscale_settings.max_throughput
  #   source:    [from validate.CosmosMaxThroughput] v%1000 != 0
  # path: index_policy.indexing_mode
  #   source:    validation.StringInSlice value list is not a literal []string - likely a generated PossibleValuesFor*() helper; resolve separately
  # path: index_policy.composite_index.index.path
  #   condition: length(value) > 0
  #   message:   must not be empty
  # path: index_policy.composite_index.index.order
  #   source:    validation.StringInSlice value list is not a literal []string - likely a generated PossibleValuesFor*() helper; resolve separately
  # path: conflict_resolution_policy.mode
  #   source:    validation.StringInSlice value list is not a literal []string - likely a generated PossibleValuesFor*() helper; resolve separately
}

