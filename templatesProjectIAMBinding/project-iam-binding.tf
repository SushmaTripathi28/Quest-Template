module "project_iam_binding" {
  for_each     = {
    for k, v in try(var.project_iam_binding,{}): k => v if v.delete != true
  }
  source         = "../terraform-google-cloud-project-iam-binding"
  project_id     = each.key
  roles          = each.value.role
  members        = each.value.members
  condition      = each.value.condition
}
