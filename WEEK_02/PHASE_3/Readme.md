# Phase 3 – Local Installation (Self-Owned Environment)

## Objective

The objective of this phase was to replicate the ORFS (OpenROAD Flow Scripts) environment locally on Ubuntu 22.04 Virtual Machine and configure all the required tools to execute the complete RTL-to-GDS flow without relying on GitHub Codespaces.

---

# Task 3.1 – Install ORFS Locally

## Step 1 – Clone ORFS Repository

```bash
git clone https://github.com/vsdip/vsd-scl180-orfs.git
cd vsd-scl180-orfs
```

**Screenshot:** Local repository cloned successfully.

---

## Step 2 – Install Git LFS

Since the repository stores large binaries using Git LFS, Git LFS was installed and initialized.

```bash
sudo apt install git-lfs
git lfs install
git lfs pull
```

This downloaded the actual OpenROAD binaries instead of Git LFS pointer files.

---

## Step 3 – Verify Toolchain

The local toolchain was verified.

```bash
openroad -version
yosys -V
make --version
which openroad
```

**Screenshot:** Version outputs.

---

## Step 4 – Validate Environment

Verified that

- OpenROAD
- Yosys
- GNU Make

were available before executing the flow.

---

# Task 3.2 – Install Official OpenROAD

The official installation script provided by the repository was used.

```bash
bash .devcontainer/install-openroad.sh
```

The installation completed successfully.

Verification:

```bash
openroad -version
```

Output confirmed successful installation of the official OpenROAD binary.

**Screenshot:** OpenROAD Version Output

---

# Local Toolchain

| Tool | Version / Source |
|-------|------------------|
| Ubuntu | 22.04 LTS |
| OpenROAD | Official OpenROAD |
| Yosys | OSS CAD Suite |
| KLayout | 0.30.9 |
| Git | Installed locally |
| Make | GNU Make |

---

# Phase 4 – RTL-to-GDS Execution (Local)

## Objective

The objective of this phase was to execute the same Sky130 GCD testcase locally using ORFS and compare the results with the GitHub Codespaces execution.

---

# Flow Execution

The RTL-to-GDS flow was executed using the Sky130HD GCD testcase.

```bash
cd orfs/flow

export PATH=/opt/oss-cad-suite/bin:$PATH

make \
YOSYS_EXE=/opt/oss-cad-suite/bin/yosys \
OPENROAD_EXE=/usr/local/bin/openroad \
DESIGN_CONFIG=./designs/sky130hd/gcd/config.mk
```

---

# Execution Stages

The following stages completed successfully.

- RTL Synthesis
- Floorplanning
- Placement
- Clock Tree Synthesis (CTS)
- Global Routing
- Detailed Routing
- GDS Merge
- Final GDS Generation
- Timing Report Generation

---

# Required Proof

## RTL Synthesis

**Screenshot:** Synthesis completion

---

## Placement

**Screenshot:** Placement completion

---

## CTS

**Screenshot:** CTS log snippet

---

## Routing

**Screenshot:** Routing completion

---

## Final GDS

Generated successfully.

Output file

```
results/sky130hd/gcd/base/6_final.gds
```

Opened successfully in KLayout 0.30.9.

**Screenshot:** Final GDS in KLayout

---

## Timing Report

**Screenshot:** WNS / TNS report

---

# Cloud vs Local Comparison

| Metric | Cloud | Local |
|----------|--------|--------|
| Runtime | ______ | ~60 s |
| WNS | ______ | ______ |
| TNS | ______ | ______ |
| GDS Generated | Yes | Yes |

Both executions generated the final GDS successfully. Any minor timing or runtime differences are due to differences in hardware configuration and execution environment.

---

# Errors Faced During Phase 3 & Phase 4

| Error | Reason | Solution | Command Used |
|--------|--------|----------|--------------|
| OpenROAD binary downloaded as Git LFS pointer | Git LFS objects were not pulled | Installed Git LFS and downloaded actual binaries | `git lfs install`<br>`git lfs pull` |
| `libtclreadline-2.3.8.so` missing | Required shared library absent | Installed Tcl Readline package | `sudo apt install tcl-tclreadline` |
| `libortools.so.9` missing | Repository binary incompatible | Installed official OpenROAD instead of using repository binary | `bash .devcontainer/install-openroad.sh` |
| `openroad: command not found` | PATH not configured | Installed official OpenROAD | `bash .devcontainer/install-openroad.sh` |
| `YOSYS_EXE not found` | ORFS expected repository Yosys | Temporarily pointed ORFS to system Yosys | `make YOSYS_EXE=/usr/bin/yosys ...` |
| `Unknown option read_liberty -setattr` | Ubuntu Yosys 0.9 incompatible | Installed OSS CAD Suite Yosys | Installed OSS CAD Suite and used `/opt/oss-cad-suite/bin/yosys` |
| `eqy: no such file or directory` | OSS CAD Suite binaries not in PATH | Exported OSS CAD Suite PATH | `export PATH=/opt/oss-cad-suite/bin:$PATH` |
| `KLayout not found in PATH` | KLayout not installed | Installed KLayout | `sudo apt install klayout` |
| Ubuntu KLayout 0.26.2 crashed during GDS merge | Version incompatible with ORFS | Installed Dockerfile version (0.30.9) | `curl -L -o /tmp/klayout.deb ...`<br>`sudo apt install /tmp/klayout.deb` |
| Final GDS not generated | KLayout crash | Replaced KLayout with v0.30.9 | Re-ran ORFS flow |
| Final GDS generated successfully | All tool versions matched devcontainer | Successfully completed RTL-to-GDS flow | `make ... DESIGN_CONFIG=./designs/sky130hd/gcd/config.mk` |

---

# Outcome

The ORFS environment was successfully configured on Ubuntu 22.04. After resolving all dependency, compatibility, and toolchain issues, the complete RTL-to-GDS flow executed successfully and generated the final **6_final.gds** locally. The generated GDS was verified by opening it in **KLayout 0.30.9**, confirming successful local implementation.
