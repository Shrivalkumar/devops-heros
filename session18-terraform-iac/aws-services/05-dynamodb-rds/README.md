# DynamoDB and RDS — Database services

## DynamoDB

DynamoDB is a managed NoSQL database. Data is stored in **tables** made of **items**, and each item has named **attributes**. It is designed for predictable, low-latency access at scale.

- A **partition key** determines where an item is stored and is required for a simple primary key.
- A **sort key** is optional and, with a partition key, creates a composite primary key that supports ordered queries within a partition.
- Good use cases include shopping carts, session data, game state, high-volume event metadata, and key-value lookups.

## RDS

Amazon RDS is a managed relational database service. It supports engines including Amazon Aurora, PostgreSQL, MySQL, MariaDB, Oracle Database, Microsoft SQL Server, and Db2.

- A **DB instance** supplies compute, memory, storage, backups, and networking for the selected engine.
- Use private subnets, security groups, encryption, strong credentials or IAM database authentication, and parameter groups for security and tuning.
- Automated backups provide point-in-time recovery. **Multi-AZ** improves availability by maintaining a standby; **read replicas** scale read traffic and may be used across Regions for supported engines.
- Common use cases include transactional business applications, reporting systems, CMS platforms, and applications that need SQL joins and relational constraints.

References: [DynamoDB Developer Guide](https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/Introduction.html) and [Amazon RDS User Guide](https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/Welcome.html).
