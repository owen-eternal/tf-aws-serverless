variable "region" {
  type        = string
  description = "AWS region resources are created under."
}

variable "account_id" {
  type        = string
  description = "ID of the AWS account."
}

variable "deployment_stage" {
  type        = string
  description = "The environment to deploy the API into."
}