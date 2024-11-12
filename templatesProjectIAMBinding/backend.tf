#.................................... Terraform Backend ....................................#

terraform {
    backend "gcs" {
    bucket  = "kd-project-quest-001"
    prefix  = "STesting/project/IAMbinding"
  }
}
