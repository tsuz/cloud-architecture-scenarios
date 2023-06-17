
resource "aws_security_group" "ssh" {
  provider    = aws.dc1
  name        = "${var.name}-ssh-security-group"
  description = "Allow only ssh"
  vpc_id      = aws_vpc.jumphost.id

  ingress {
    description      = "Port 22 from VPC"
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name = "${var.name}-ssh"
  }
}

resource "aws_security_group" "too_open" {
  provider    = aws.dc1
  name        = "${var.name}-too-open"
  description = "TODO make restrictive"
  vpc_id      = aws_vpc.ec2.id

  ingress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name = "allow_tls"
  }
}
