# Phase 4 – Re-Run RTL-to-GDS Locally

## Objective

The objective of this phase was to execute the same Sky130HD GCD testcase locally using OpenROAD Flow Scripts (ORFS) and verify that the complete RTL-to-GDS flow could be completed successfully without relying on GitHub Codespaces. The execution results were then compared with the cloud execution performed in Phase 1.

---

# Testcase Used

- **Design:** GCD
- **Technology:** SKY130HD
- **Flow:** OpenROAD Flow Scripts (ORFS)

---

# Flow Execution

Navigate to the ORFS flow directory.

```bash
cd ~/Desktop/vsd-scl180-orfs/orfs/flow
```

Export the OSS CAD Suite binaries.

```bash
export PATH=/opt/oss-cad-suite/bin:$PATH
```

Execute the complete RTL-to-GDS flow.

```bash
make \
YOSYS_EXE=/opt/oss-cad-suite/bin/yosys \
OPENROAD_EXE=/usr/local/bin/openroad \
DESIGN_CONFIG=./designs/sky130hd/gcd/config.mk
```

The flow completed successfully after resolving all dependency and compatibility issues encountered during the local installation.

---

# RTL-to-GDS Flow Stages

## RTL Synthesis

The RTL design was synthesized into a gate-level netlist using Yosys.

**Evidence:** Refer to **`Phase-4/files/`** for synthesis reports, synthesis statistics, and synthesis logs.

---

## Floorplanning

The floorplanning stage generated the die area, core area, placement rows, and initial physical layout of the design.

**Evidence:** Refer to **`Phase-4/files/`** for the floorplan report and floorplan visualization.

---

## Placement

Standard cells were placed inside the core while optimizing placement density and estimated wirelength.

**Evidence:** Refer to **`Phase-4/files/`** for placement reports and placement visualization.

---

## Clock Tree Synthesis (CTS)

Clock buffers and clock routing were inserted to reduce clock skew and distribute the clock network efficiently.

**Evidence:** Refer to **`Phase-4/files/`** for CTS reports, clock tree visualizations, and CTS logs.

---

## Routing

Global routing and detailed routing completed successfully, producing a fully connected physical design.

**Evidence:** Refer to **`Phase-4/files/`** for routing reports, routing visualizations, congestion maps, IR drop analysis, and DRC reports.

---

## Final GDS Generation

The complete RTL-to-GDS flow successfully generated the final GDS layout.

**Generated Output**

```text
results/sky130hd/gcd/base/6_final.gds
```

The generated GDS was verified by opening it in **KLayout 0.30.9**.

**Evidence:** Refer to **`Phase-4/files/`** for the final GDS layout, finish report, and layout verification.

---

## Timing Analysis

Static Timing Analysis (STA) was completed after routing.

The generated reports include:

- Worst Negative Slack (WNS)
- Total Negative Slack (TNS)

**Evidence:** Refer to **`Phase-4/files/`** for the final timing reports and STA outputs.

---

# Local Flow Summary

| Parameter | Result |
|-----------|--------|
| Design | GCD |
| Technology | SKY130HD |
| RTL Synthesis | ✅ Completed |
| Floorplanning | ✅ Completed |
| Placement | ✅ Completed |
| Clock Tree Synthesis | ✅ Completed |
| Routing | ✅ Completed |
| Timing Analysis | ✅ Completed |
| Final GDS | ✅ Generated |
| GDS Verification | ✅ Opened Successfully in KLayout |
| Runtime | ~60 seconds |

---

# Cloud vs Local Comparison

| Metric | Cloud | Local |
|----------|--------|--------|
| Runtime | ________ | ~60 s |
| WNS | ________ | ________ |
| TNS | ________ | ________ |
| GDS Generated | Yes | Yes |

## Comparison

The local execution successfully reproduced the complete RTL-to-GDS flow previously executed in GitHub Codespaces. Both environments generated the final GDS successfully. Minor differences in runtime or timing values may occur due to differences in processor performance, available system resources, and execution environments.

---

# Errors Encountered During Phase 4

## Error 1 – `eqy` Not Found

**Issue**

```
eqy: no such file or directory
```

**Reason**

The OSS CAD Suite binaries were not included in the system PATH.

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

KLayout was not installed in the local Ubuntu environment.

**Solution**

```bash
sudo apt install klayout
```

---

## Error 3 – KLayout 0.26.2 Crash During GDS Merge

**Issue**

The Ubuntu repository version of KLayout (0.26.2) crashed during the GDS merge stage.

**Reason**

The older KLayout version was incompatible with the ORFS flow.

**Solution**

Installed KLayout 0.30.9, the same version used in the ORFS Dockerfile.

```bash
curl -L -o /tmp/klayout.deb \
https://www.klayout.org/downloads/Ubuntu-22/klayout_0.30.9-1_amd64.deb

sudo apt install /tmp/klayout.deb
```

---

# Outcome

The complete RTL-to-GDS flow was successfully executed on the local Ubuntu 22.04 environment. All implementation stages—including synthesis, floorplanning, placement, clock tree synthesis, routing, timing analysis, and GDS generation—completed successfully. The generated `6_final.gds` was verified in KLayout 0.30.9, demonstrating that the local ORFS environment successfully reproduced the cloud execution.
