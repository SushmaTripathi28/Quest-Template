variable "project_id" {
    default     = "kd-project-437712"
type = string
}
/*variable "project_iam_binding" {
  sensitive = false
type = string
}*/

variable "project_iam_binding" {
  type = map(object({
    project_id = string
    delete     = bool
    role       = list(string)
    members    = list(string)
    condition  = list(object({
      title       = string
      description = string
      expression  = string
    }))
  }))
}
