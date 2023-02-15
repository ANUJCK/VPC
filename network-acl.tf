
################################################################################
# Public Network ACLs
################################################################################

resource "aws_network_acl" "public" {
  count = var.create_vpc && length(var.public_subnets) > 0 ? 1 : 0

  vpc_id     = element(concat(aws_vpc.this.*.id, [""]), 0)
  subnet_ids = aws_subnet.public.*.id

  tags = module.tags.commontags
}

################################################################################
# Private Network ACLs
################################################################################

resource "aws_network_acl" "private" {
  count = var.create_vpc && length(var.private_subnets) > 0 ? 1 : 0

  vpc_id     = element(concat(aws_vpc.this.*.id, [""]), 0)
  subnet_ids = aws_subnet.private.*.id

  tags = module.tags.commontags
}
