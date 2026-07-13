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
      automatic = optional(bool)
      composite_index = optional(list(object({
        index = list(object({
          order = string
          path  = string
        }))
      })))
      excluded_paths = optional(set(string))
      included_paths = optional(set(string))
      indexing_mode  = string
      spatial_index = optional(list(object({
        path = string
      })))
    }))
    unique_key = optional(list(object({
      paths = set(string)
    })))
  }))
  validation {
    condition = alltrue([
      for k, v in var.cosmosdb_gremlin_graphs : (
        v.index_policy == null || (v.index_policy.composite_index == null || alltrue([for item in v.index_policy.composite_index : (length(item.index) >= 1)]))
      )
    ])
    error_message = "Each index list must contain at least 1 items"
  }
  validation {
    condition = alltrue([
      for k, v in var.cosmosdb_gremlin_graphs : (
        length(v.resource_group_name) <= 90
      )
    ])
    error_message = "[from resourcegroups.ValidateName: invalid when len(value) > 90]"
  }
  validation {
    condition = alltrue([
      for k, v in var.cosmosdb_gremlin_graphs : (
        !endswith(v.resource_group_name, ".")
      )
    ])
    error_message = "[from resourcegroups.ValidateName: must not end with \".\"]"
  }
  validation {
    condition = alltrue([
      for k, v in var.cosmosdb_gremlin_graphs : (
        length(v.resource_group_name) != 0
      )
    ])
    error_message = "[from resourcegroups.ValidateName: invalid when len(value) == 0]"
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
        v.index_policy == null || (v.index_policy.included_paths == null || (alltrue([for x in v.index_policy.included_paths : length(x) > 0])))
      )
    ])
    error_message = "must not be empty"
  }
  validation {
    condition = alltrue([
      for k, v in var.cosmosdb_gremlin_graphs : (
        v.index_policy == null || (v.index_policy.excluded_paths == null || (alltrue([for x in v.index_policy.excluded_paths : length(x) > 0])))
      )
    ])
    error_message = "must not be empty"
  }
  validation {
    condition = alltrue([
      for k, v in var.cosmosdb_gremlin_graphs : (
        v.index_policy == null || (v.index_policy.composite_index == null || alltrue([for item in v.index_policy.composite_index : (alltrue([for item in item.index : (length(item.path) > 0)]))]))
      )
    ])
    error_message = "must not be empty"
  }
  validation {
    condition = alltrue([
      for k, v in var.cosmosdb_gremlin_graphs : (
        v.index_policy == null || (v.index_policy.spatial_index == null || alltrue([for item in v.index_policy.spatial_index : (length(item.path) > 0)]))
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
        v.unique_key == null || alltrue([for item in v.unique_key : (alltrue([for x in item.paths : length(x) > 0]))])
      )
    ])
    error_message = "must not be empty"
  }
  # Note: 13 additional provider-side validators are enforced at apply time but not mirrored as validation{} blocks here (bespoke or non-mechanically-translatable).
}

