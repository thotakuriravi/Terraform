
variable "instance_type" {
  type        = string
  description = "In this file i am going to create the tfvar file and saving the variable names in that file"
  
  validation {
    condition = length(var.instance_type) > 4
    error_message = "The instance id must be more than 4 characters."
  }
}
