output "build_id" {
  value = null_resource.build.id
  description = "Arbitraty value that changes each time the build is executed. Can be used to cause other resources to be updated or replaced."
}
