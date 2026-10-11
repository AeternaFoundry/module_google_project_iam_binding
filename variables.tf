variable "project_iam_bindings" {
  description = <<EOT
Map of project_iam_bindings, attributes below
Required:
    - members
    - project
    - role
Optional:
    - condition (block):
        - description (optional)
        - expression (required)
        - title (required)
EOT

  type = map(object({
    members = set(string)
    project = string
    role    = string
    condition = optional(object({
      description = optional(string)
      expression  = string
      title       = string
    }))
  }))
}

