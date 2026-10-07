# IAM — Governance and access control

IAM (Identity and Access Management) controls who can access an AWS account and what they are allowed to do. It is a global service: IAM users, roles, groups, and policies are not limited to one AWS region.

## Core pieces

- **Users** represent people or long-lived application identities. They can sign in to the console or use access keys, although AWS recommends temporary credentials where possible.
- **Groups** collect users with similar job responsibilities. A policy attached to a group applies to its members.
- **Roles** are assumed temporarily by a user, AWS service, or trusted external identity. EC2 instance roles and GitHub Actions OIDC roles are common examples.
- **Policies** are JSON documents that state which actions are allowed or denied on which resources, optionally under conditions.
- **Permissions** are the combined result of identity policies, resource policies, permission boundaries, service control policies, and explicit denies. An explicit deny always wins.

## Least privilege and good habits

Grant only the actions, resources, and conditions needed for the current task. Start narrow, review access with IAM Access Analyzer, and use roles with temporary credentials instead of sharing access keys. Enable MFA for people, protect the root user, rotate or remove unused access keys, and keep daily work out of the root account.

## Common uses

- Giving a developer read-only access to one S3 bucket.
- Letting an EC2 instance read a secret without storing credentials in code.
- Letting a CI pipeline deploy after it assumes a controlled IAM role.

Reference: [AWS IAM documentation](https://docs.aws.amazon.com/IAM/latest/UserGuide/introduction.html).
