variable "iam_path" {
  type    = string
  description = "Default path user"
}

variable "iam_name" {
  type = string
  description = "IAM User name"
}

variable "iam_tags" {
  type = object({
    Environment = string
    Terraform   = string
  })
  sensitive = true
  # validation {
  #   condition     = contains(["Test", "true"], var.iam_tags)
  #   error_message = "Tags are not valid for test purposes."
  # }
}