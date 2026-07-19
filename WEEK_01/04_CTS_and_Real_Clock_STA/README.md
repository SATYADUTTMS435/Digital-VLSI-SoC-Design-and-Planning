# Day 4 – Pre-layout Timing Analysis and Importance of Good Clock Tree

## Overview

The objective of Day 4 is to understand how timing constraints influence synthesis and why Clock Tree Synthesis (CTS) is required in ASIC physical design. Before CTS, synthesis is performed using an ideal clock model. The custom Sky130 inverter designed on the previous day is integrated into the OpenLane flow and verified as part of the synthesized design. Finally, timing concepts such as setup time, hold time, clock skew, clock uncertainty, and Clock Tree Synthesis are studied before moving to placement and CTS.

---

# Objectives

- Understand pre-layout timing analysis.
- Learn setup and hold timing constraints.
- Study ideal and real clock behavior.
- Integrate a custom Sky130 inverter into OpenLane.
- Modify synthesis strategy.
- Verify custom cell usage after synthesis.
- Understand the purpose of Clock Tree Synthesis.

---

# Pre-layout Timing Analysis

Static Timing Analysis (STA) verifies whether every sequential path satisfies timing constraints without requiring simulation vectors. During synthesis, OpenLane assumes an **ideal clock**, meaning every flip-flop receives the clock simultaneously with zero routing delay. Although this simplifies timing analysis, it is only an approximation because practical ASICs experience clock latency, skew, and uncertainty after physical routing.

---

# Setup Time Analysis

Setup time is the minimum duration before the active clock edge during which the input data must remain stable. If the data reaches the capture flip-flop too late, the data may not be sampled correctly, leading to a setup violation.

For an ideal clock,

```text
Data Arrival Time < Clock Period − Setup Time
```

When practical clock effects are considered,

```text
Data Arrival Time < Data Required Time
```

where the required time includes clock latency and uncertainty.

---

# Hold Time Analysis

Hold time is the minimum duration after the active clock edge during which the input data must remain stable. If the data changes immediately after the clock edge, the capture flip-flop may latch incorrect information, resulting in a hold violation.

For proper operation,

```text
Data Arrival Time > Hold Requirement
```

During real clock analysis, hold timing also accounts for clock latency and uncertainty.

---

# Ideal Clock vs Real Clock

During synthesis, OpenLane initially assumes an **ideal clock**, where the clock reaches every flip-flop at exactly the same instant.

In a real chip, however, the clock network experiences:

- Clock latency
- Clock skew
- Routing delay
- Buffer delay
- Clock uncertainty

These effects become significant after placement and routing, making Clock Tree Synthesis essential.

---

# Clock Uncertainty

Clock uncertainty is a timing margin reserved to account for clock imperfections such as jitter, process variation, voltage variation, and temperature variation. During synthesis, uncertainty reduces the available timing budget to ensure reliable operation under worst-case conditions.

---

# Clock Jitter

Clock jitter refers to the temporary variation in the arrival time of clock edges compared to their ideal positions. Since clock edges cannot arrive at perfectly regular intervals, additional timing margin must be reserved during timing analysis.

---

# Importance of Clock Tree Synthesis (CTS)

Clock Tree Synthesis distributes the clock signal from the clock source to every sequential element while minimizing clock skew and insertion delay.

The primary objectives of CTS are:

- Minimize clock skew
- Balance clock arrival time
- Reduce insertion delay
- Improve setup timing
- Improve hold timing
- Reduce clock power consumption

Without CTS, different flip-flops receive the clock at different times, which may result in setup or hold violations.

---

# Power-aware Clock Tree Synthesis

Clock buffers are selected using delay lookup tables based on input slew and output load. Buffer insertion is performed so that each branch of the clock tree drives nearly equal capacitance, reducing skew and improving clock distribution.

The clock tree is therefore balanced by:

- Selecting appropriate clock buffers
- Equalizing branch loading
- Maintaining similar propagation delay across branches

---

# Integrating the Custom Standard Cell

The custom inverter created during Day 3 is integrated into the OpenLane flow using its generated LEF file. The LEF provides the physical abstraction of the standard cell so that OpenLane can use it during synthesis while preserving its layout characteristics.

The configuration is updated to include:

- Custom LEF
- Liberty timing files
- Technology information

---

# Running OpenLane in Interactive Mode

The design is first loaded into OpenLane interactive mode.

```tcl
./flow.tcl -interactive

prep -design picorv32a
```

This initializes the design environment, loads the PDK, standard-cell libraries, technology files, and timing libraries required for synthesis.

---

# Adding the Custom LEF

The generated LEF is merged with the existing standard-cell library.

```tcl
set lefs [glob $::env(DESIGN_DIR)/src/*.lef]

add_lefs -src $lefs
```

This allows the synthesis engine to recognize the custom inverter as a valid standard cell.

---

# Modifying the Synthesis Strategy

OpenLane supports different optimization strategies depending on whether area or timing is prioritized.

Examples include:

```tcl
set ::env(SYNTH_STRATEGY) "AREA 0"
```

or

```tcl
set ::env(SYNTH_STRATEGY) "DELAY 3"
```

Area optimization attempts to reduce silicon utilization, whereas delay optimization focuses on improving timing performance even if the final chip area increases.

---

# Running Synthesis

After configuring the synthesis strategy, synthesis is executed.

```tcl
run_synthesis
```

During synthesis, Yosys performs:

- RTL elaboration
- Logic optimization
- Technology mapping
- Standard-cell replacement
- Static Timing Analysis

---

# Synthesis Report

OpenLane generates synthesis reports containing useful implementation statistics such as:

- Total number of cells
- Standard-cell utilization
- Cell distribution
- Estimated chip area

These reports help evaluate the effect of different synthesis strategies on design performance and silicon utilization.

---

# Verifying the Custom Inverter in Magic

The synthesized DEF is opened in Magic to verify that the custom inverter has been successfully inserted into the design.

The desired cell can be selected using:

```text
select <cell>

what
```

The selected instance should correspond to the custom Sky130 inverter integrated during synthesis.

---

# Expanding the Cell

To inspect the complete physical layout of the inserted inverter, the selected cell is expanded.

```text
expand
```

This displays the internal PMOS, NMOS, contacts, routing layers, and power rails, confirming successful integration into the synthesized design.

---

# Clock Tree Synthesis

After synthesis is completed, the next stage in the physical design flow is Clock Tree Synthesis.

CTS inserts clock buffers throughout the design to ensure that every flip-flop receives the clock with nearly identical delay while minimizing clock skew and insertion delay.

The OpenLane command used for CTS is:

```tcl
run_cts
```

After CTS, OpenLane generates updated timing information, clock tree reports, clock latency values, and skew information, which are later verified using post-CTS Static Timing Analysis.

---

# Learning Outcomes

By completing Day 4, the following concepts were understood:

- Static Timing Analysis before layout
- Setup and Hold timing analysis
- Ideal and real clock models
- Clock uncertainty and jitter
- Clock Tree Synthesis fundamentals
- Integration of a custom Sky130 standard cell
- Synthesis optimization strategies
- Verification of synthesized cells using Magic
- Preparation for placement and post-CTS timing analysis

---

<img width="1388" height="837" alt="1" src="https://github.com/user-attachments/assets/395c0638-b845-43f6-82a7-4f352e1bd74b" />

<img width="1840" height="526" alt="2" src="https://github.com/user-attachments/assets/71c76770-5722-4f98-95b3-acb4cb2e7718" />

<img width="1917" height="1078" alt="3" src="https://github.com/user-attachments/assets/64ed54a1-06e7-4dc3-80f4-ab44131e540e" />

<img width="1867" height="507" alt="4" src="https://github.com/user-attachments/assets/c8f8ba93-bbfb-412a-83af-807c6b65f4f9" />

<img width="1013" height="942" alt="5" src="https://github.com/user-attachments/assets/6c09a8c9-a2c8-4017-9b17-93e9d3d44993" />

<img width="882" height="431" alt="6" src="https://github.com/user-attachments/assets/b35b8ef6-5d58-4675-ad39-8848db6f77da" />

<img width="1362" height="952" alt="8" src="https://github.com/user-attachments/assets/1679052d-a449-4e44-8d5c-9275ffeac220" />

<img width="1838" height="772" alt="9" src="https://github.com/user-attachments/assets/7a8f294a-b968-4282-8bc6-0507c7996317" />

<img width="1367" height="897" alt="10" src="https://github.com/user-attachments/assets/875e2c15-8e83-4ff8-b79c-6bec5fb4368c" />

<img width="1655" height="912" alt="11" src="https://github.com/user-attachments/assets/4a61dd6c-d6cf-4037-8392-3b41cfec6acf" />

<img width="1545" height="900" alt="12" src="https://github.com/user-attachments/assets/0154e662-d6a7-4431-a1bb-917b6e4a2965" />

<img width="1477" height="907" alt="13" src="https://github.com/user-attachments/assets/7b061b5e-4cec-4a32-a5af-06df27dbfd84" />

<img width="1498" height="912" alt="14" src="https://github.com/user-attachments/assets/05b88121-baf1-4eb0-bd06-aee52a44f23b" />

<img width="1660" height="907" alt="16" src="https://github.com/user-attachments/assets/468a892b-87fd-4e1e-ae41-80cf20b05507" />

<img width="1645" height="907" alt="17" src="https://github.com/user-attachments/assets/337eb048-fb51-4299-9154-6b06fae8d88b" />

<img width="1917" height="1078" alt="19" src="https://github.com/user-attachments/assets/a9a0af16-a7ba-42ff-a3b1-781985791963" />

<img width="1917" height="1078" alt="Screenshot 2026-07-18 135023" src="https://github.com/user-attachments/assets/9b285294-3cc0-4a74-a7bb-ac38bdea527e" />

<img width="1227" height="523" alt="21" src="https://github.com/user-attachments/assets/e4ef0e70-6ee5-4947-bd95-cccd92dec79e" />

<img width="1917" height="1078" alt="23" src="https://github.com/user-attachments/assets/d4732279-ba2f-414b-9295-32fac6545a2d" />

<img width="1917" height="1078" alt="24" src="https://github.com/user-attachments/assets/38b68d10-f689-4434-a4f7-d3ac125de3f4" />
