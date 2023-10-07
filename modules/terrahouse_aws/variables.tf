variable "user_uuid" {
  description = "The UUID of the user"
  type        = string
  validation {
    condition        = can(regex("^[0-9a-fA-F]{8}-[0-9a-fA-F]{4}-[1-5][0-9a-fA-F]{3}-[89abAB][0-9a-fA-F]{3}-[0-9a-fA-F]{12}$", var.user_uuid))
    error_message    = "The user_uuid value is not a valid UUID."
  }
}

variable "bucket_name" {
  description = "AWS S3 bucket name"
  type        = string
  validation {
    condition     = (
      length(var.bucket_name) >= 3 && length(var.bucket_name) <= 63 &&
      can(regex("^([a-zA-Z0-9.-]{3,63})$", var.bucket_name))
    )
    error_message = "Bucket name is not valid. It must be 3-63 characters long and only contain letters, numbers, hyphens, and periods."
  }
}

variable "index_html_path" {
  description = "Path to the index.html file on your local system"
  type        = string  
  
  validation {
    condition     = fileexists(var.index_html_path)
    error_message = "The specified index.html file does not exist."
  }
}

variable "error_html_path" {
  description = "Path to the error.html file on your local system"
  type        = string
    
  validation {
    condition     = fileexists(var.error_html_path)
    error_message = "The specified error.html file does not exist."
  }
}
