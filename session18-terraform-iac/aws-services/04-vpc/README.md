# VPC — Networking

A Virtual Private Cloud (VPC) is an isolated virtual network in AWS. It starts with a **CIDR** range, for example `10.0.0.0/16`, from which subnet ranges are allocated.

## Building blocks

- **Subnets** divide the VPC CIDR into smaller ranges. A subnet belongs to one Availability Zone.
- **Route tables** decide where traffic goes. Every subnet is associated with a route table.
- An **Internet Gateway** connects a VPC to the public internet. A public subnet has a route to it and instances can use public IPs.
- A **NAT Gateway** lets instances in a private subnet make outbound internet connections without accepting unsolicited inbound traffic. It normally lives in a public subnet.
- **Security Groups** are stateful, instance or ENI-level firewalls. **Network ACLs** are stateless, subnet-level filters; return traffic must be allowed explicitly.

## Public and private subnets

A public subnet routes `0.0.0.0/0` to an Internet Gateway. A private subnet does not; it may route outbound traffic through a NAT Gateway. Typical designs place load balancers in public subnets and application/database resources in private subnets.

Reference: [Amazon VPC User Guide](https://docs.aws.amazon.com/vpc/latest/userguide/what-is-amazon-vpc.html).
