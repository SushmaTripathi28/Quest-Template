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
