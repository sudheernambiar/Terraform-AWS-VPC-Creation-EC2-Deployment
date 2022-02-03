variable "ami" {
    default = "ami-03fa4afc89e4a8a09"
}

variable "instance" {
    default = "t2.micro"
}

resource "aws_key_pair"  "savier" {
    
  key_name = "terraform"
  public_key = file("save.pub")
  tags = {
    Name = "terraform"
  }
}


#BastienServer
resource "aws_instance" "bastien" {
  ami           = var.ami
  instance_type = var.instance
  subnet_id     = aws_subnet.pub1.id
  security_groups = [ aws_security_group.bastien.id ]
  key_name = aws_key_pair.savier.id
  user_data = file("enableroot.sh")

  tags = {
    Name = "${var.project}-BASTIEN-${var.env}"
    Admin = var.owner
    Environment = var.env
  } 
}

#WebServer
resource "aws_instance" "WebServer" {
  ami           = var.ami
  instance_type = var.instance
  subnet_id     = aws_subnet.pub2.id
  security_groups = [ aws_security_group.webserver.id ]
  key_name = aws_key_pair.savier.id
  user_data = file("enableroot.sh")

  tags = {
    Name = "${var.project}-WebServer-${var.env}"
    Admin = var.owner
    Environment = var.env
  } 
}

#WebServer
resource "aws_instance" "MySQL" {
  ami           = var.ami
  instance_type = var.instance
  subnet_id     = aws_subnet.prv1.id
  security_groups = [ aws_security_group.webserver.id ]
  key_name = aws_key_pair.savier.id
  user_data = file("enableroot.sh")

  tags = {
    Name = "${var.project}-MySQL-${var.env}"
    Admin = var.owner
    Environment = var.env
  } 
}