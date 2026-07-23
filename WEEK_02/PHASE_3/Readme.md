# Phase 3 – Local Installation (Self-Owned Environment)

## Objective

The objective of this phase was to replicate the ORFS (OpenROAD Flow Scripts) environment locally on an Ubuntu 22.04 Virtual Machine. Unlike GitHub Codespaces, the local environment required manual installation of all dependencies, OpenROAD, and supporting tools before executing the RTL-to-GDS flow.

---

# Task 3.1 – Install ORFS Locally

## Step 1 – Clone the ORFS Repository

The ORFS repository was cloned into the local Ubuntu environment.

```bash
git clone https://github.com/vsdip/vsd-scl180-orfs.git
cd vsd-scl180-orfs
```

<img width="1457" height="882" alt="Screenshot 2026-07-21 102147" src="https://github.com/user-attachments/assets/04e6bd3a-0389-4048-9745-f2e42728d87a" />


---

## Step 2 – Install Required Dependencies

Git LFS was installed because the repository stores large binaries using Git LFS.

```bash
sudo apt update
sudo apt install git git-lfs make
```

Initialize Git LFS.

```bash
git lfs install
git lfs pull
```

This downloaded the actual binaries instead of Git LFS pointer files.

<img width="945" height="642" alt="Screenshot 2026-07-21 103040" src="https://github.com/user-attachments/assets/a497bc5f-0119-4d36-bb4f-ac8182ae52b5" />


---

## Step 3 – Verify Toolchain

The following commands were executed to verify the installation.

```bash
openroad -version
```

```bash
yosys -V
```

```bash
make --version
```

<img width="1325" height="263" alt="Screenshot 2026-07-21 114203" src="https://github.com/user-attachments/assets/448f9f53-a45a-4510-bff0-645adbebb87a" />


<img width="956" height="846" alt="Screenshot 2026-07-22 123012" src="https://github.com/user-attachments/assets/506ce171-c321-426b-bc91-6ac19ffe5521" />



---

## Step 4 – Validate Environment Variables

The environment variables required by ORFS were verified before running the flow.

OpenROAD executable

```bash
which openroad
```

OSS CAD Suite

```bash
export PATH=/opt/oss-cad-suite/bin:$PATH
```

Environment validation ensured that OpenROAD, Yosys and supporting utilities were accessible during execution.

<img width="793" height="211" alt="Screenshot 2026-07-21 113742" src="https://github.com/user-attachments/assets/5743a3d7-a4d9-4282-a2b7-a748b05b162c" />



---

# Task 3.2 – Install Official OpenROAD

Instead of using the repository binary directly, the official installation script provided with the repository was used.

```bash
bash .devcontainer/install-openroad.sh
```

The installation completed successfully.

Verification

```bash
openroad -version
```

The version output confirmed successful installation.

<img width="1373" height="865" alt="Screenshot 2026-07-21 114015" src="https://github.com/user-attachments/assets/fece1cac-e66d-4284-8e60-13ae60e52e6e" />

---

# Local Environment Summary

| Component | Version |
|------------|----------|
| Ubuntu | 22.04 LTS |
| OpenROAD | Official OpenROAD |
| Yosys | OSS CAD Suite |
| GNU Make | Installed |
| Git | Installed |
| Git LFS | Installed |
| KLayout | 0.30.9 |

---

# Errors Encountered During Phase 3

## Error 1 – Git LFS Pointer Files

**Issue**

The repository downloaded Git LFS pointer files instead of the actual OpenROAD binaries.

**Reason**

Git LFS objects were not downloaded after cloning.

**Solution**

```bash
git lfs install
git lfs pull
```

---

## Error 2 – Missing Shared Library

**Issue**

```
libtclreadline-2.3.8.so: cannot open shared object file
```

**Reason**

Required Tcl shared library was missing.

**Solution**

```bash
sudo apt install tcl-tclreadline
```

---

## Error 3 – Missing libortools.so.9

**Issue**

```
libortools.so.9 not found
```

**Reason**

The repository OpenROAD binary expected older libraries unavailable on the local system.

**Solution**

Installed the official OpenROAD binary provided by the repository.

```bash
bash .devcontainer/install-openroad.sh
```

---

## Error 4 – OpenROAD Not Found

**Issue**

```
openroad: command not found
```

**Reason**

Official OpenROAD was not yet installed.

**Solution**

```bash
bash .devcontainer/install-openroad.sh
```

---

## Error 5 – ORFS Could Not Find Yosys

**Issue**

```
YOSYS_EXE is either not found or not executable
```

**Reason**

ORFS expected its own Yosys installation.

**Temporary Solution**

```bash
make YOSYS_EXE=/usr/bin/yosys ...
```

This allowed execution to continue for debugging.

---

## Error 6 – Ubuntu Yosys Incompatible

**Issue**

```
Unknown option:
read_liberty -setattr
```

**Reason**

Ubuntu provided Yosys 0.9, while the ORFS flow required the newer OSS CAD Suite version.

**Solution**

Installed the OSS CAD Suite used by the Dockerfile and executed ORFS using

```bash
/opt/oss-cad-suite/bin/yosys
```

---

## Error 7 – Missing eqy

**Issue**

```
eqy: no such file or directory
```

**Reason**

OSS CAD Suite binaries were not included in the PATH.

**Solution**

```bash
export PATH=/opt/oss-cad-suite/bin:$PATH
```

---

## Error 8 – KLayout Not Found

**Issue**

```
KLayout not found in PATH
```

**Reason**

KLayout was not installed in the local environment.

**Solution**

Installed KLayout.

```bash
sudo apt install klayout
```

---

## Error 9 – Ubuntu KLayout Crash

**Issue**

Ubuntu KLayout 0.26.2 crashed during GDS merge.

**Reason**

The ORFS flow required KLayout 0.30.9 used inside the Dockerfile.

**Solution**

Installed the same KLayout version as the devcontainer.

```bash
curl -L -o /tmp/klayout.deb \
https://www.klayout.org/downloads/Ubuntu-22/klayout_0.30.9-1_amd64.deb

sudo apt install /tmp/klayout.deb
```

---

## Error 10 – curl Not Installed

**Issue**

```
curl: command not found
```

**Reason**

The minimal Ubuntu installation did not include the `curl` utility.

**Solution**

```bash
sudo apt update
sudo apt install -y curl
```

This allowed downloading the official KLayout package.

---

## Error 11 – Incorrect Command Usage

**Issue**

```
dpkg: unknown option -1
```

**Reason**

The option `-l` (lowercase L) was mistakenly entered as `-1` (number one).

**Solution**

Used the correct command.

```bash
dpkg -l | grep -i klayout
```

---

## Error 12 – Incorrect Repository Path

**Issue**

```
.devcontainer/Dockerfile: No such file or directory
```

**Reason**

The command was executed from the `orfs/flow` directory instead of the repository root.

**Solution**

Returned to the repository root and executed the command again.

```bash
cd ~/Desktop/vsd-scl180-orfs
```

---

# Outcome

The complete ORFS toolchain was successfully configured on Ubuntu 22.04. After resolving all dependency, compatibility and installation issues, the local environment matched the GitHub Codespaces development environment and was ready for executing the RTL-to-GDS flow.
