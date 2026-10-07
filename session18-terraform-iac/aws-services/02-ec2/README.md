# EC2 — Compute

Amazon EC2 provides virtual machines called instances. An instance is launched from an **AMI** (Amazon Machine Image), which contains the operating system and optional software.

## Main concepts

- **Instance types** combine a family and size, such as `t3.micro` or `m7i.large`; they trade CPU, memory, networking, and price.
- **Key pairs** provide the public key placed on a Linux instance and the private key used for SSH. Session Manager can reduce the need for inbound SSH.
- **Security Groups** are stateful virtual firewalls attached to network interfaces. They should allow only required inbound ports.
- **EBS** is persistent block storage. Its volumes can be encrypted, resized, snapshotted, and kept after an instance stops if configured.
- **Public IPs** are reachable through an Internet Gateway when security group and route rules allow it. **Private IPs** are used inside a VPC and are normally safer for application and database tiers.

## Lifecycle

An instance can be pending, running, stopping, stopped, shutting-down, or terminated. Stopped instances retain EBS-backed disks but do not consume instance compute charges; terminated instances are removed.

## Common uses

Web servers, build runners, batch jobs, self-managed databases, and temporary development machines.

Reference: [AWS EC2 User Guide](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/concepts.html).
