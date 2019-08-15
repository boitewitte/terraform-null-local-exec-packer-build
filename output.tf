output "build_id" {
  value = null_resource.build.id
  description = "Arbitraty value that changes each time the build is executed. Can be used to cause other resources to be updated or replaced."
}

output "command" {
  value = "${var.packer_binary} build -color=false ${local.except} ${local.force} ${local.on_error} ${local.only} ${local.parallel_builds} ${local.var_files} ${local.vars} ${var.template_file}"
}

output "working_dir" {
  value = local.working_dir
}

output "environment" {
  value = var.environment
}

output "vars" {
  value = var.vars
}
