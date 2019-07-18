output "triggers" {
  value = {
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
}

output "command" {
  value = "${var.packer_binary} build ${local.except} ${local.force} ${local.on_error} ${local.only} ${local.parallel_builds} ${local.var_files} ${local.vars} ${var.template_file}"
}
