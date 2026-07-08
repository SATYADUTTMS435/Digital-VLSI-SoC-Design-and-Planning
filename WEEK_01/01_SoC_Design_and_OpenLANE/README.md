# Week 1 – Phase 1: Introduction to SoC Design and OpenLANE

> **Workshop Modules Covered**
>
> - SKY130_D1_SK1 – How to Talk to Computers
> - SKY130_D1_SK2 – SoC Design and OpenLANE
> - SKY130_D1_SK3 – Get Familiar with Open-Source EDA Tools

---

# Objective

The objective of this phase is to understand the fundamentals of Digital ASIC Design, the complete RTL-to-GDSII implementation flow, and the open-source EDA ecosystem used throughout the workshop. This phase also introduces the GitHub Codespaces environment and demonstrates the synthesis of the reference **picorv32a** design using the **OpenLANE** flow and the **SKY130 Process Design Kit (PDK)**. :contentReference[oaicite:0]{index=0}

---

# Introduction

Modern semiconductor chips integrate millions of transistors into a single integrated circuit known as a **System-on-Chip (SoC)**. Designing these chips requires a sequence of design, verification, synthesis, and physical implementation stages before fabrication.

The **Digital VLSI SoC Design and Planning** workshop introduces this complete ASIC implementation flow using the open-source **OpenLANE** framework, enabling designers to transform a Verilog RTL design into a manufacturable GDSII layout using the **SKY130 PDK** and industry-standard open-source EDA tools. :contentReference[oaicite:1]{index=1}

---

# Understanding System-on-Chip (SoC)

A **System-on-Chip (SoC)** integrates several functional blocks such as processor cores, SRAM, GPIO peripherals, communication interfaces, analog IPs, clock generators, and other reusable Intellectual Property (IP) blocks onto a single silicon chip.

This high level of integration offers:

- Reduced power consumption
- Higher performance
- Smaller chip area
- Lower manufacturing cost
- Improved system reliability

<p align="center">
<img src="images/soc_architecture.png" width="850">
</p>

<p align="center">
<b>Figure 1:</b> Example of a System-on-Chip (SoC) architecture showing processor, memories, peripherals, and foundry IPs.
</p>

---

# From Software to Hardware

Before implementing digital hardware, it is important to understand how software eventually executes on silicon.

A program written in a high-level language is first compiled into assembly instructions. The assembler converts these instructions into machine code, while the operating system manages memory and hardware resources. Finally, the processor executes the generated binary instructions.

Understanding this software-to-hardware relationship provides the foundation for studying digital hardware implementation and ASIC design.

<p align="center">
<img src="images/software_to_hardware.png" width="900">
</p>

<p align="center">
<b>Figure 2:</b> Software execution flow from application programs to hardware implementation.
</p>

---

# RTL-to-GDSII ASIC Design Flow

The OpenLANE framework automates the complete RTL-to-GDSII implementation flow. Starting from a Verilog RTL description, the design undergoes:

1. RTL Design
2. Logic Synthesis
3. Floorplanning
4. Placement
5. Clock Tree Synthesis (CTS)
6. Routing
7. Static Timing Analysis (STA)
8. Physical Verification
9. GDSII Generation

Each stage contributes towards transforming the logical design into a manufacturable integrated circuit layout. This workshop explores every stage using completely open-source tools. :contentReference[oaicite:2]{index=2}

<p align="center">
<img src="images/asic_flow.png" width="900">
</p>

<p align="center">
<b>Figure 3:</b> RTL-to-GDSII Digital ASIC Design Flow.
</p>

---

# Practical Implementation

## Step 1 – Accessing the Synthesis Reports

After successfully completing logic synthesis, the generated reports were accessed from the OpenLANE run directory.

The following Linux commands were used:

```bash
cd reports
cd synthesis
ls
```

The synthesis stage generated several report files containing design statistics, structural checks, sequential element information, and synthesis summaries.

<p align="center">
<img src="images/reports_terminal.png" width="1000">
</p>

<p align="center">
<b>Figure 4:</b> Navigating to the synthesis reports directory and listing the generated report files.
</p>

A detailed explanation of every generated report is available in:

- `Synthesis/Reports/info.md`

---

## Step 2 – Viewing the Synthesis Statistics Report

The synthesis statistics report was opened using:

```bash
code 1-synthesis.AREA_0.stat.rpt
```

This report provides an overview of the synthesized implementation, including:

- Number of cells
- Wire count
- Standard cell utilization
- Gate distribution

These statistics are useful for understanding the complexity and resource utilization of the synthesized design.

<p align="center">
<img src="images/report_open.png" width="1000">
</p>

<p align="center">
<b>Figure 5:</b> Opening the synthesis statistics report in the editor.
</p>

---

## Step 3 – Accessing the Generated Result Files

The generated synthesis output files were accessed using:

```bash
cd ../../results
cd synthesis
ls
```

The synthesis process produced:

- `picorv32a.v`
- `picorv32a.sdf`

These files represent the primary outputs of the synthesis stage and are required for the subsequent physical design stages.

<p align="center">
<img src="images/results_terminal.png" width="1000">
</p>

<p align="center">
<b>Figure 6:</b> Listing the synthesized output files.
</p>

A detailed explanation of these files is available in:

- `Synthesis/Results/info.md`

---

## Step 4 – Viewing the Synthesized Gate-Level Netlist

The synthesized Verilog netlist was opened using:

```bash
code picorv32a.v
```

Unlike the original RTL source code, this file contains the technology-mapped implementation generated by **Yosys** using the SKY130 standard cell library. It serves as the primary input for floorplanning, placement, clock tree synthesis, routing, and timing analysis.

<p align="center">
<img src="images/netlist_open.png" width="1000">
</p>

<p align="center">
<b>Figure 7:</b> Opening the synthesized gate-level Verilog netlist.
</p>

---

# Flip-Flop Ratio

As required in the workshop, the Flip-Flop Ratio was calculated using the generated synthesis reports.

The calculation, observations, and interpretation are documented in the following section.

> *(To be added.)*

---

# Key Learnings

- Understood the fundamentals of Digital ASIC and SoC design.
- Learned the complete RTL-to-GDSII implementation flow.
- Explored the OpenLANE open-source ASIC design framework.
- Successfully executed logic synthesis using the OpenLANE flow.
- Generated synthesis reports and technology-mapped output files.
- Learned how synthesized netlists are produced from RTL designs.
- Established the foundation for the remaining physical design stages.

---

# References

- VLSI System Design – Digital VLSI SoC Design and Planning Workshop. :contentReference[oaicite:3]{index=3}
- OpenROAD Project Documentation. :contentReference[oaicite:4]{index=4}
