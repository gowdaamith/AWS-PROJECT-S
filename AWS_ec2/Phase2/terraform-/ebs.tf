resource "aws_ebs_volume" "data_volume"{
  availability_zone = aws_instance.web_server.availability_zone
  size = var.ebs_size
  type = "gp3"

  tags = {
    Name  = "phasae2-data-volume"
    Environment = "dev"
    Project = " terraform-ec2-learning"
  }
}
resource "aws_volume_attachment" "ebs_volume"{
  device_name = "dev/sdh"
  volume_id = aws_ebs_volume.example.id
  instance_id - aws_instance.web_server.id
}
