resources " aws_intance" "web" {
  ami = data.aws_ami.ubuntu.id 
  instance_type = var.instance_type
  key_name =var.key_name
  vpc_security_group_ids = [ 
    aws_security_group.web_sg.id]
  ]
  tags={
    Name = " ec2-phase1"
   }
  }
  
