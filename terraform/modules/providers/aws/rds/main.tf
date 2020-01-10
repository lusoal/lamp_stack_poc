


resource "aws_db_instance" "aws_rds" {
  identifier              = "${var.identifier}"
  name                    = "${var.name}"
  allocated_storage       = "${var.allocated_storage}"
  storage_type            = "${var.storage_type}"
  engine                  = "${var.engine}"
  engine_version          = "${var.engine_version}"
  instance_class          = "${var.instance_class}"
  username                = "${var.username}"
  password                = "${var.password}"
  parameter_group_name    = "${aws_db_parameter_group.default.name}"
  availability_zone       = "${var.availability_zone}"
  db_subnet_group_name    = "${var.db_subnet_group_name}"
  multi_az                = "${var.multi_az}"
  maintenance_window      = "${var.maintenance_window}"
  backup_window           = "${var.backup_window}"
  publicly_accessible     = "${var.publicly_accessible}"
  apply_immediately       = "${var.apply_immediately}"
  vpc_security_group_ids  = "${var.rds_sg_id}"
  
 
  tags = "${var.tags}"

  depends_on = ["aws_db_parameter_group.default"]
}

//Always create a parameter group for the RDS instance

resource "aws_db_parameter_group" "default" {
  name   = "${var.name}-parameter-group"
  family = "${var.params_engine_version}"

  //Those paramters are Default
  parameter {
    name  = "character_set_server"
    value = "utf8"
  }

  parameter {
    name  = "character_set_client"
    value = "utf8"
  }
}