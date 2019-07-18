

variable "environment" {
  type = map(string)
  description = "Set Environment Variables for the Packer execution."
  default = {}
}

variable "except" {
  type = list(string)
  description = "Run all the builds and post-processors except those with the given names."
  default = []
}

variable "force" {
  type = bool
  description = "Forces a builder to run when artifacts from a previous build prevent a build from running."
  default = false
}

variable "on_error" {
  type = string
  description = "Selects what to do when the build fails. (valid values: cleanup, abort, ask)"
  default = "cleanup"
}

variable "only" {
  type = list(string)
  description = "Only run the builds with the given names."
  default = []
}

variable "packer_binary" {
  type = string
  description = "Path to the Packer Binary"
  default = "packer"
}

variable "parallel_builds" {
  type = number
  description = "Limit the number of builds to run in parallel, 0 means no limit"
  default = 0
}

variable "template_file" {
  type = string
  description = "The template file for Packer"
}

variable "var_files" {
 type = list(string)
 description = "Set template variables from a file."
 default = []
}

variable "vars" {
  type = map(string)
  description = "Set variables in your packer template."
  default = {}
}

variable "working_dir" {
  type = string
  description = "Specifies the working directory where the packer command will be executed."
  default = null
}
