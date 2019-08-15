terraform {
  required_version = ">= 0.12"
}

locals {
  except = length(var.except) > 0 ? "-except=${join(",", distinct(var.except))}" : ""
  force = var.force ? "-force" : ""
  on_error_is_valid = index(["cleanup", "abort", "ask"], var.on_error)
  on_error = "-on-error=${var.on_error}"
  only = length(var.only) > 0 ? "-only=${join(",", distinct(var.only))}" : ""
  parallel_builds = "-parallel-builds=${var.parallel_builds}"

  var_files = join(" ", [
    for file in var.var_files:
      "-var-file ${file}"
  ])
  vars = join(" ", [
    for key, value in var.vars:
      "-var '${key}=\"${value}\"'"
  ])

  environment_string = join(" ", [
    for key, value in var.environment:
      "${key}=${value}"
  ])

  working_dir = var.working_dir != null ? var.working_dir : path.cwd
  force_build = var.force_build ? "${timestamp()}" : "false"
}

resource "null_resource" "build" {
  triggers = {
    force_build = local.force_build
    binary = var.packer_binary
    except = local.except
    force = local.force
    on_error = local.on_error
    only = local.only
    parallel_builds = local.parallel_builds
    var_files = local.var_files
    vars = local.vars
    template_file = var.template_file
    working_dir = var.working_dir
    environment = local.environment_string
  }

  provisioner "local-exec" {
    command = "${var.packer_binary} build -color=false ${local.except} ${local.force} ${local.on_error} ${local.only} ${local.parallel_builds} ${local.var_files} ${local.vars} ${var.template_file}"
    environment = var.environment
    working_dir = local.working_dir
  }
}
