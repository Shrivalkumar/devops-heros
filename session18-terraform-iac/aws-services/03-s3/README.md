# S3 — Object storage

Amazon S3 stores data as objects in buckets. A bucket name is globally unique and objects are addressed by a key, for example `reports/2026/summary.csv`.

## Important features

- **Buckets** are the top-level containers and are created in an AWS Region.
- **Objects** contain data, metadata, an optional version ID, and a key. S3 is designed for files and object data, not block-device access.
- **Storage classes** let you choose cost and retrieval characteristics: Standard, Intelligent-Tiering, Standard-IA, One Zone-IA, Glacier Instant Retrieval, Glacier Flexible Retrieval, and Deep Archive.
- **Versioning** keeps earlier object versions so accidental overwrite or deletion can be recovered.
- **Lifecycle policies** transition objects to lower-cost storage or expire them on a schedule.
- **Encryption** can use S3-managed keys (SSE-S3), KMS keys (SSE-KMS), or customer-provided keys. Encryption at rest should be enabled.
- **Bucket policies** are resource policies that control access to the bucket and objects. Keep public access blocked unless public hosting is intentional.

## Common uses

Application uploads, logs, backups, static assets, data lakes, Terraform remote state, and archive storage.

Reference: [Amazon S3 User Guide](https://docs.aws.amazon.com/AmazonS3/latest/userguide/Welcome.html).
