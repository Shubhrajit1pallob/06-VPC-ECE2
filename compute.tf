resource "aws_instance" "web" {
  # AMI ID UBUNTU - ami-02183c955d69e6bb5
  # AMI ID NGINX - ami-010e099e651d8635e
  ami                         = "ami-010e099e651d8635e"
  associate_public_ip_address = true
  instance_type               = "t2.micro"
  subnet_id                   = aws_subnet.public.id
  vpc_security_group_ids      = [aws_security_group.public_http_traffic.id]
  root_block_device {
    delete_on_termination = true
    volume_size           = 10
    volume_type           = "gp2"
  }

  tags = merge(local.common_tags, {
    Name = "06-resources-ec2"
  })

  # The lifecycle block ensures that the instance is created before the previous one is destroyed.
  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_security_group" "public_http_traffic" {
  description = "Rule to allow HTTP traffic from the internet on port 443 and 80"
  name        = "public_http_traffic"
  vpc_id      = aws_vpc.main.id

  tags = merge(local.common_tags, {
    Name = "06-resources-sg"
  })
}

resource "aws_vpc_security_group_ingress_rule" "http" {
  security_group_id = aws_security_group.public_http_traffic.id
  cidr_ipv4         = "0.0.0.0/0"
  from_port         = 80
  to_port           = 80
  ip_protocol       = "tcp"
}

resource "aws_vpc_security_group_ingress_rule" "https" {
  security_group_id = aws_security_group.public_http_traffic.id
  cidr_ipv4         = "0.0.0.0/0"
  from_port         = 443
  to_port           = 443
  ip_protocol       = "tcp"
}