output "ebs_volume_id" {
  value = aws_ebs_volume.data_volume.id
}
output "instance_id" {
  value  = aws_instance.webserver.id
}
