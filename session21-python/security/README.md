# Security checks

I keep the security checks close to the pipeline instead of treating them as a final manual review. The workflow runs Bandit for Python SAST, `pip-audit` for dependency/SCA findings, Gitleaks for secrets, and Trivy for the built container images. The image push job only runs after those gates complete successfully.

For a local check I use:

```bash
cd backend
bandit -r app -ll
pip-audit -r requirements.txt
```
