resource "google_project_iam_binding" "project_iam_bindings" {
  for_each = var.project_iam_bindings

  members = each.value.members
  project = each.value.project
  role    = each.value.role

  dynamic "condition" {
    for_each = each.value.condition != null ? [each.value.condition] : []
    content {
      description = condition.value.description
      expression  = condition.value.expression
      title       = condition.value.title
    }
  }
}

