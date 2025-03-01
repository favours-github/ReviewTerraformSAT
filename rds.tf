# Create Database Subnet Group
resource "aws_db_subnet_group" "database_subnet_group" {
  name        = var.database_subnet_group_name
  subnet_ids  = [aws_subnet.private_data_subnet_az1.id, aws_subnet.private_data_subnet_az2.id]
  description = "Subnets for database instance"

  tags = {
    Name = var.database_subnet_group_name
  }
}

# Get the Latest Database Snapshot
data "aws_db_snapshot" "latest_db_snapshot" {
  db_snapshot_identifier = var.db_snapshot_identifier
  most_recent            = var.most_recent_snapshot
  snapshot_type          = var.snapshot_type
}

# Create Database Instance Restored from Snapshot
resource "aws_db_instance" "database_instance" {
  instance_class          = var.db_instance_class
  skip_final_snapshot     = var.skip_final_snapshot
  availability_zone       = var.db_availability_zone
  identifier              = var.db_identifier
  snapshot_identifier     = data.aws_db_snapshot.latest_db_snapshot.id
  db_subnet_group_name    = aws_db_subnet_group.database_subnet_group.name
  multi_az                = var.multi_az
  vpc_security_group_ids  = [aws_security_group.database_security_group.id]

  tags = {
    Name = var.db_identifier
  }
}
