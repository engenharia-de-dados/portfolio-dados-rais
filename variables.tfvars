prefix   = "mwaa"
vpc_cidr = "10.192.0.0/16"
public_subnet_cidrs = [
  "10.192.10.0/24",
  "10.192.11.0/24"
]
private_subnet_cidrs = [
  "10.192.20.0/24",
  "10.192.21.0/24"
]
mwaa_max_workers = 2