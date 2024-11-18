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
