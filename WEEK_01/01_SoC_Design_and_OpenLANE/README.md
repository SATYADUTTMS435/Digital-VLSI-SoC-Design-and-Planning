# Week 1 – Phase 1: Introduction to SoC Design and OpenLANE

> **Workshop Modules Covered**
>
> - SKY130_D1_SK1 – How to Talk to Computers
> - SKY130_D1_SK2 – SoC Design and OpenLANE
> - SKY130_D1_SK3 – Get Familiar with Open-Source EDA Tools

---

# Objective

The objective of this phase is to understand the fundamentals of Digital ASIC Design, the concept of a System-on-Chip (SoC), the open-source ASIC ecosystem, and the complete RTL-to-GDSII implementation flow. This phase also introduces the OpenLANE framework, the SKY130 Process Design Kit (PDK), and the synthesis of the PicoRV32 reference design using open-source tools. 

---

# Introduction

Digital ASIC design transforms a hardware description written in Verilog RTL into a manufacturable integrated circuit layout (GDSII). This workshop uses the open-source OpenLANE flow together with the SKY130 Process Design Kit (PDK) to demonstrate a complete RTL-to-GDSII implementation using industry-relevant tools such as OpenROAD, Yosys, OpenSTA, Magic, and Netgen.

---

# Understanding a System-on-Chip (SoC)

A System-on-Chip (SoC) integrates processor cores, memories, communication interfaces, GPIO peripherals, analog IPs, and reusable macros onto a single silicon die. By integrating these components into one chip, an SoC provides improved performance, reduced power consumption, lower manufacturing cost, and compact system design.

> **Figure 1:** SoC architecture showing processor core, memories, macros, GPIOs, and foundry IPs.

<img width="1270" height="641" alt="Image" src="https://github.com/user-attachments/assets/2cc75b89-12b1-457c-816d-88e587de4199" />

---

# From Software to Hardware

Every application begins as a high-level software program. The compiler converts the source code into assembly language, the assembler generates machine code, and the operating system manages hardware resources before the processor executes the binary instructions. Understanding this software-to-hardware relationship forms the foundation for digital hardware implementation and ASIC design.

> **Figure 2:** Software-to-Hardware execution flow.

<img width="1213" height="748" alt="Image" src="https://github.com/user-attachments/assets/43d931da-97fa-4c22-a1c5-a95d31e91b71" />

---

# RTL-to-GDSII ASIC Design Flow

The OpenLANE framework automates the complete RTL-to-GDSII implementation flow. Starting from an RTL description, the design passes through Logic Synthesis, Floorplanning, Placement, Clock Tree Synthesis (CTS), Routing, Static Timing Analysis (STA), Physical Verification, and finally GDSII generation. This workflow forms the backbone of modern Digital Physical Design and will be explored in detail throughout this workshop. :contentReference[oaicite:2]{index=2}

> **Figure 3:** RTL-to-GDSII ASIC Design Flow.


<img width="783" height="493" alt="Image" src="https://github.com/user-attachments/assets/fc5450c8-7778-4af4-a261-17d6014303d1" />

---

# Practical Implementation

## Generated Synthesis Reports

After successfully completing logic synthesis, OpenLANE generated several report files that summarize the synthesized design. These reports contain synthesis statistics, structural checks, sequential element information, and optimization summaries that are useful for analyzing the implementation before proceeding to the physical design stages.

> **Figure 4:** Terminal showing the generated synthesis report files.

<img width="1836" height="857" alt="Image" src="https://github.com/user-attachments/assets/602ff7de-6a4b-4911-92e5-302ce9ca184b" />

The generated reports are available in:

```text
Synthesis/
└── Reports/
```

A brief explanation of every report file is provided in:

**`Synthesis/Reports/info.md`**

---

## Generated Synthesis Results

In addition to the reports, OpenLANE generated the synthesized implementation files required for the next stages of the design flow. These include the synthesized gate-level Verilog netlist and the Standard Delay Format (SDF) file, which are used during floorplanning, placement, routing, and timing analysis.

> **Figure 5:** Terminal showing the generated synthesis result files.


<img width="1853" height="876" alt="Image" src="https://github.com/user-attachments/assets/65e4370c-48a5-4917-a100-e01d72d7291d" />

The generated result files are available in:

```text
Synthesis/
└── Results/
```

A brief explanation of every generated output file is provided in:

**`Synthesis/Results/info.md`**

---

# Flip-Flop Ratio

As required in this workshop, the Flip-Flop Ratio was calculated using the generated synthesis statistics. The calculation and observations are presented in the following section.

*(Calculation to be added.)*

---

# Key Learnings

- Understood the concept of System-on-Chip (SoC) architecture.
- Learned how software is translated into hardware execution.
- Explored the complete RTL-to-GDSII ASIC implementation flow.
- Became familiar with the OpenLANE open-source ASIC design framework.
- Successfully generated synthesis reports and implementation output files.
- Organized generated reports and results for future analysis and documentation.
- Established the foundation for the remaining stages of Digital Physical Design.

---

# References

- Digital VLSI SoC Design and Planning – VLSI System Design (VSD). :contentReference[oaicite:3]{index=3}
- Example VSD workshop repository structure. :contentReference[oaicite:4]{index=4}
