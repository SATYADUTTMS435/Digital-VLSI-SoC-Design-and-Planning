# Phase 4 – Re-Run RTL-to-GDS Locally

## Objective

The objective of this phase was to execute the same Sky130HD GCD testcase locally using ORFS and verify that the complete RTL-to-GDS flow could be completed successfully without relying on GitHub Codespaces. This phase also compares the local execution results with the cloud execution performed in Phase 1.

---

# Testcase Used

**Design:** GCD

**Technology:** SKY130HD

**Flow:** OpenROAD Flow Scripts (ORFS)

---

# Flow Execution

Navigate to the flow directory.

```bash
cd ~/Desktop/vsd-scl180-orfs/orfs/flow
```

Export the OSS CAD Suite binaries.

```bash
export PATH=/opt/oss-cad-suite/bin:$PATH
```

Execute the RTL-to-GDS flow.

```bash
make \
YOSYS_EXE=/opt/oss-cad-suite/bin/yosys \
OPENROAD_EXE=/usr/local/bin/openroad \
DESIGN_CONFIG=./designs/sky130hd/gcd/config.mk
```

The complete RTL-to-GDS flow executed successfully after resolving all dependency and toolchain issues.

---

# Flow Stages

## RTL Synthesis

RTL was synthesized into a gate-level netlist using Yosys.

📸 **Screenshot:** Synthesis completion

---

## Floorplanning

Core dimensions, die area and initial placement regions were generated.

📸 **Screenshot:** Floorplan log snippet

---

## Placement

Standard cells were placed inside the core while minimizing congestion and wirelength.

📸 **Screenshot:** Placement completion

---

## Clock Tree Synthesis (CTS)

Clock buffers and clock routing were generated to minimize clock skew.

📸 **Screenshot:** CTS log snippet

---

## Routing

Global and detailed routing completed successfully.

📸 **Screenshot:** Routing completion

---

## Final GDS Generation

The final GDS layout was generated successfully.

Output file

```text
results/sky130hd/gcd/base/6_final.gds
```

The generated GDS was verified by opening it using **KLayout 0.30.9**.

📸 **Screenshot:** Final GDS opened in KLayout

---

## Timing Report

Timing analysis completed successfully.

Include screenshots showing:

- WNS
- TNS

📸 **Screenshot:** Final timing report

---

# Local Flow Summary

| Parameter | Result |
|------------|---------|
| Design | GCD |
| Technology | SKY130HD |
| RTL Synthesis | ✅ Completed |
| Floorplanning | ✅ Completed |
| Placement | ✅ Completed |
| CTS | ✅ Completed |
| Routing | ✅ Completed |
| Final GDS | ✅ Generated |
| GDS Verified | ✅ Opened in KLayout |
| Runtime | ~60 seconds |

---

# Cloud vs Local Comparison

| Metric | Cloud | Local |
|----------|--------|--------|
| Runtime | __________ | ~60 s |
| WNS | __________ | __________ |
| TNS | __________ | __________ |
| GDS Generated | Yes | Yes |

### Comparison

The local execution successfully reproduced the same RTL-to-GDS flow executed in GitHub Codespaces. Both environments generated the final GDS successfully. Minor differences in runtime and timing values may occur because of differences in CPU performance, memory allocation, and execution environment between the cloud container and the local virtual machine.

---

# Errors Encountered During Phase 4

## Error 1 – `eqy` Not Found

**Issue**

```
eqy: no such file or directory
```

**Reason**

The OSS CAD Suite binaries were not added to the system PATH.

**Solution**

```bash
export PATH=/opt/oss-cad-suite/bin:$PATH
```

---

## Error 2 – KLayout Not Found

**Issue**

```
KLayout not found in PATH
```

**Reason**

KLayout was not installed in the local environment.

**Solution**

```bash
sudo apt install klayout
```

---

## Error 3 – Ubuntu KLayout Crash

**Issue**

KLayout version 0.26.2 crashed during the GDS merge stage.

**Reason**

The Ubuntu repository version was incompatible with the ORFS flow.

**Solution**

Installed the same KLayout version (0.30.9) used by the ORFS Dockerfile.

```bash
curl -L -o /tmp/klayout.deb \
https://www.klayout.org/downloads/Ubuntu-22/klayout_0.30.9-1_amd64.deb

sudo apt install /tmp/klayout.deb
```

---

# Outcome

The complete RTL-to-GDS flow was successfully executed on the local Ubuntu 22.04 environment. All major implementation stages, including synthesis, floorplanning, placement, CTS, routing, timing analysis, and GDS generation, completed successfully. The generated **6_final.gds** was verified by opening it in **KLayout 0.30.9**, confirming that the local ORFS environment matched the GitHub Codespaces execution.
