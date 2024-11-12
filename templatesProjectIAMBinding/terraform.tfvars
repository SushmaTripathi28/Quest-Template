project_iam_binding = {
  "kd-project-437712" = {
    project_id = "kd-project-437712"
    delete                          = false
    role       = ["roles/storage.objectViewer"]  # Provide role as a list to match `for_each` requirement.
    members    = [
      "user:sushma.tripathi@hcl.com"
    ]
    condition = [{
      title       = "expires_after_2024_11_13"
      description = "Expiring at midnight of 2024_11_13"
      expression  = "request.time < timestamp(\"2024-11-01T00:00:00Z\")"
    }]
  }
}
