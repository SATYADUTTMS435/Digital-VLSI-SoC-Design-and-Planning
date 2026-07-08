# Week 1 – Phase 1: Introduction to SoC Design and OpenLANE

> **Workshop Modules Covered**
>
> - SKY130_D1_SK1 – How to Talk to Computers
> - SKY130_D1_SK2 – SoC Design and OpenLANE
> - SKY130_D1_SK3 – Get Familiar with Open-Source EDA Tools

---

# Objective

The objective of this phase is to understand the fundamentals of Digital ASIC design, the complete RTL-to-GDSII implementation flow, and the open-source EDA ecosystem used throughout the workshop. This phase introduces the OpenLANE framework, the SKY130 Process Design Kit (PDK), GitHub Codespaces, and the synthesis of the PicoRV32 reference design using open-source tools. :contentReference[oaicite:0]{index=0}

---

# Introduction

Digital ASIC design involves converting a hardware description written in Verilog RTL into a manufacturable integrated circuit layout (GDSII). Traditionally, this process relied on expensive commercial EDA tools. The introduction of the Google–SkyWater SKY130 open-source PDK together with the OpenLANE automated RTL-to-GDSII flow has enabled students, researchers, and engineers to perform a complete ASIC implementation using freely available tools. :contentReference[oaicite:1]{index=1}

---

# Understanding System-on-Chip (SoC)

A **System-on-Chip (SoC)** integrates multiple hardware components—including processor cores, memories, GPIO peripherals, communication interfaces, analog IPs, and other reusable Intellectual Property (IP) blocks—onto a single silicon chip. This integration improves performance, reduces power consumption, minimizes board area, and lowers manufacturing cost.

**Figure 1:** System-on-Chip (SoC) Architecture.

---

# From Software to Hardware

Every application written in a high-level programming language is translated into machine instructions before it can execute on hardware. The compiler converts source code into assembly language, the assembler generates machine code, and the operating system manages hardware resources before the processor executes the instructions. Understanding this software-to-hardware relationship forms the foundation for learning digital hardware implementation.

**Figure 2:** Software-to-Hardware Execution Flow.

---

# RTL-to-GDSII ASIC Design Flow

The OpenLANE flow automates the complete RTL-to-GDSII implementation process. Starting from a Verilog RTL description, the design passes through logic synthesis, floorplanning, placement, clock tree synthesis (CTS), routing, timing analysis, physical verification, and finally GDSII generation. Throughout this workshop, each of these stages will be studied and implemented using open-source EDA tools. :contentReference[oaicite:2]{index=2}

**Figure 3:** RTL-to-GDSII ASIC Design Flow.

---

# Practical Implementation

## Step 1 – Accessing the Synthesis Reports

After successfully completing the synthesis stage, the generated report files were accessed from the OpenLANE run directory. These reports contain synthesis statistics, design checks, sequential element information, and other implementation summaries that are useful for analyzing the synthesized design.

**Figure 4:** Terminal showing the generated synthesis reports.

---

## Step 2 – Viewing the Synthesis Statistics Report

The synthesis statistics report was opened using the Visual Studio Code editor available inside GitHub Codespaces. This report provides detailed information such as total cell count, wire count, standard-cell distribution, and overall synthesis statistics, allowing the synthesized implementation to be analyzed before proceeding to physical design.

**Figure 5:** Opening the `1-synthesis.AREA_0.stat.rpt` report.

---

## Step 3 – Accessing the Generated Result Files

The synthesis stage also generated output files including the synthesized Verilog netlist (`picorv32a.v`) and the Standard Delay Format (`picorv32a.sdf`) file. These files serve as the primary inputs for the subsequent stages of floorplanning, placement, clock tree synthesis, routing, and timing analysis.

**Figure 6:** Terminal showing the generated synthesis result files.

---

## Step 4 – Viewing the Synthesized Netlist

The synthesized gate-level Verilog netlist was opened to observe the technology-mapped implementation produced by Yosys using the SKY130 standard-cell library. Unlike the original RTL, this file represents the actual hardware implementation that will be used during the remaining physical design stages.

**Figure 7:** Opening the synthesized gate-level Verilog netlist.

---

# Generated Reports and Result Files

The synthesis stage generated several report files and output files that summarize the synthesized implementation. To keep this documentation organized, a separate explanation has been provided for every generated file.

- **Synthesis Reports:** `Synthesis/Reports/info.md`
- **Synthesis Output Files:** `Synthesis/Results/info.md`

---

# Flip-Flop Ratio

As required by the workshop, the Flip-Flop Ratio was calculated using the generated synthesis reports. The calculation, observations, and interpretation will be documented in the following section after extracting the required statistics from the synthesis reports.

---

# Key Learnings

- Understood the fundamentals of Digital ASIC and SoC design.
- Learned the complete RTL-to-GDSII implementation flow.
- Explored the OpenLANE open-source ASIC implementation framework.
- Gained practical experience with GitHub Codespaces and Linux.
- Successfully generated synthesis reports and synthesized output files.
- Learned how synthesized gate-level netlists are produced from RTL designs.
- Established the foundation for the remaining stages of Digital Physical Design.

---

# References

- VLSI System Design – Digital VLSI SoC Design and Planning Workshop. :contentReference[oaicite:3]{index=3}
- OpenROAD Project and OpenLANE RTL-to-GDSII Flow. :contentReference[oaicite:4]{index=4}
- Advanced Physical Design using OpenLANE and SKY130. :contentReference[oaicite:5]{index=5}
