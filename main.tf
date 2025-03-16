resource "aws_security_group" "main" {
    name = local.sg_final_name
    description = "Allow TLS inbound traffic and all outbound traffic"
    vpc_id = var.vpc_id

    egress {
        from_port = 0
        to_port = 0
        protocol = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }

    tags = merge(
        var.common_tags,
        var.sg_tags,
        {
            Name = local.sg_final_name
        }
    )
}

#Note: 
    #During module development the variable would be included empty,which means the user has to supply the values to the variables which are empty in the module development
    #provider.tf must be indluded in during the module usage process