/******************************************
  Google Cloud Project IAM Policy
 *****************************************/
resource "google_project_iam_binding" "project_iam" {
  for_each  = toset(var.roles)
  project   = var.project_id
  #count     = length(var.roles)
  role      = each.key
  members   = var.members

  /*++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++*/
  dynamic "condition" {
    for_each = var.condition  == null ? [] :var.condition[*]
    content {
      expression        = lookup(condition.value, "expression")
      title             = lookup(condition.value, "title")
      description       = lookup(condition.value, "description" )  
    }   
  }
   /*++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++*/
}
