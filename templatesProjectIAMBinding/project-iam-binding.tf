module "project_iam_binding" {
  for_each     = {
    for k, v in try(var.project_iam_binding,{}): k => v if v.delete != true
  }
  source         = "git::https://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@github.com/SushmaTripathi28/Quest-Module.git//terraform-google-cloud-project-iam-binding?ref=v1.0.0"
  project_id     = each.key
  roles          = each.value.role
  members        = each.value.members
  condition      = each.value.condition
}
