   resource "aws_instance" "web" {
   name                        = "demo"
   ami                         =  "ami-0509f816fdd94dec7"
   instance_type               = "t2.nano"
   vpc_security_group_ids      = "launch-wizard-1"
   key_name                    = "docker"
   subnet_id                   = "subnet-067da5e146926b7ce"
   root_block_device = {
       encrypted   = true
       volume_type = "gp2"
       volume_size = 80
   }
 }