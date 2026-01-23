resource "aws_security_group" "web_sg"{
  name = "phase1-web-sg"

  ingress{
    description = "ssh"
    from_port = 22
    to_port = 22
    protocol="tcp"
    cidr_blocks = ["YOUR_IP/32"]
  }
  ingress{
    description = "http"
    from_port=80
    to_port=80
    protocol ="tcp"
    cide_block = ["0.0.0.0/0"]
  }
  egress{
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_block =["0.0.0.0/0"]
  }
}

resource "aws_instance" "web" {
  ami = var.amiid
  instance_type = var.instace_type
  key_name = var.key_name
  vpc_security_group_ids = [
    aws_security_group.web_sg.id
  }

  
  user_data = <<-EOF
              #!/bin/bash
              apt update -y
              apt install nginx -y
              systemctl start nginx
              systemctl enable nginx
              echo "<h1>EC2 Phase 1 via Terraform 🚀</h1>" > /var/www/html/index.html
              EOF

  tags = {
    Name = var.instance_name
  }
}
