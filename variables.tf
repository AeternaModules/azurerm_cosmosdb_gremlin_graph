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
}

