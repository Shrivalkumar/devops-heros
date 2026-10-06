# 10 - Final CI/CD Pipeline

## 1. Architecture

```mermaid
flowchart TD
    A[Developer] -->|git push| B[GitHub Repository]
    B --> C[GitHub Actions]
    C --> D[TEST]
    C --> E[SECURITY]
    D --> F[BUILD + DOCKER]
    F --> G[BUILD ARTIFACT]
    E --> H[DELIVERY PACKAGE]
    G --> H
    H --> I[STAGING-READY ARTIFACT]
```

---

## 2. Jobs
The workflow contains four jobs:
1. `test`
2. `build` (builds the application and validates the Docker image)
3. `security-check`
4. `deliver` (creates a deployable package after build and security pass)

---

## 3. Test Job
The test job:
**Checkout** → **Setup Python** → **Install dependencies** → **Run pytest**

---

## 4. Build Job
The build job runs **only** after tests pass.
```yaml
needs: test
```

**Flow:**
Test → PASS → Build → Artifact

**If tests fail:**
Test → FAIL → Build does not run

---

## 5. Security Check
The security job checks for common sensitive files:
* `.env`
* `*.pem`
* `*.key`

*(This is only a basic classroom demonstration. It is not a complete security scanner.)*

---

## 6. Runner
All jobs use:
```yaml
runs-on: ubuntu-latest
```
GitHub provides the runner environment.

---

## 7. Artifact
The build generates:
```text
build/
├── calculator.py
└── build-info.txt
```
The workflow uploads it as:
`calculator-build`

The build artifact also contains Docker image metadata. The `deliver` job downloads it and uploads a second artifact, `calculator-delivery-package`, containing a Kubernetes deployment manifest, image metadata, and release information.

## 8. Dockerfile and CD delivery

The Dockerfile uses `python:3.12-slim`, copies the calculator source, and runs it as the unprivileged `appuser`.

```bash
docker build -t session16-calculator:local .
```

The delivery job is the CD stage: it packages the validated build for staging. It reads the optional repository secret `DEMO_DEPLOY_TOKEN` without printing it. When the secret is not configured, the package is still created successfully but no external deployment is attempted.

---

## 9. Run Locally

**Install dependencies:**
```bash
python3 -m pip install -r requirements.txt
```

**Run application:**
```bash
python3 app/calculator.py
```

**Run tests:**
```bash
pytest -v
```

**Build:**
```bash
chmod +x build.sh
./build.sh
```

---

## 10. Git Commands
```bash
git init
git add .
git commit -m "Add final CI/CD pipeline"
git branch -M main
git remote add origin https://github.com/YOUR_USERNAME/session16-cicd-github-actions.git
git push -u origin main
```

---

## 10. Expected Pipeline
GitHub Actions should show:

```text
Session 16 CI/CD Pipeline
│
├── ✓ Test Application
│
├── ✓ Security Check
│
├── ✓ Build and Package
      │
      └── ✓ Upload calculator-build artifact
│
└── ✓ Deliver Deployment Package
      │
      └── ✓ Upload calculator-delivery-package artifact
```

---

## Successful GitHub Actions execution

The workflow was pushed to the repository and completed successfully in **43 seconds**. All four jobs passed and GitHub published both the build and delivery artifacts.

![Successful Session 16 GitHub Actions workflow](screenshots/github-actions-success.png)

## 11. Failure Scenario
Break the application intentionally:
```python
def add(a, b):
    return a + b + 1
```

Run:
```bash
pytest
```
The test fails. Push the change.

**Expected:**
```text
✗ Test Application
```

Because `build` `needs: test`, the build does not proceed.

---

## 12. Fix
Restore:
```python
def add(a, b):
    return a + b
```

Commit:
```bash
git add .
git commit -m "Fix application"
git push
```

**Expected:**
```text
✓ Test Application
✓ Security Check
✓ Build and Package
✓ Deliver Deployment Package
```

---

## 13. Complete Concept Map

```text
CI/CD
│
├── CI
│   ├── Build
│   └── Test
│
├── CD
│   ├── Deliver deployment package
│   └── Deploy with protected credentials
│
└── GitHub Actions
    │
    ├── Workflow
    │
    ├── Jobs
    │   ├── Test
    │   ├── Security
    │   ├── Build
    │   └── Deliver
    │
    ├── Steps
    │
    ├── Runner
    │
    ├── Secrets
    │
    └── Artifacts
```

---

### 💡 Final Takeaway

> **git push** → **GitHub Actions** → **Test** → **Security Check** → **Build + Docker validation** → **Artifacts** → **Delivery package** → **Ready for protected deployment**

The next step after this session is to connect the pipeline to a deployment target such as Docker, Kubernetes, AWS, or Azure.
