# Chip Floorplanning

Floorplanning is the first stage of the ASIC Physical Design flow where the synthesized gate-level netlist begins transforming into a physical layout. During this stage, the overall dimensions of the chip are determined, the core area is defined, and space is allocated for standard cells, macros, routing resources, and power planning.

Unlike synthesis, which focuses on the logical implementation of the design, floorplanning focuses on its physical organization on the silicon die. A well-planned floorplan plays a crucial role in reducing routing congestion, improving timing performance, minimizing power consumption, and optimizing chip area.

In this module, we will explore the fundamental concepts of chip floorplanning, understand important design parameters such as utilization factor and aspect ratio, visualize the generated floorplan and placement using Magic Layout Editor, and inspect different standard cells present inside the design.

---

# Objectives

The objectives of this phase are:

- Understand the purpose of Floorplanning in the ASIC Physical Design flow.
- Learn the difference between Die Area and Core Area.
- Understand Utilization Factor and Aspect Ratio.
- Study the role of Standard Cells and Pre-Placed Cells (Macros).
- Generate the Floorplan using OpenLANE.
- Visualize the generated Floorplan using Magic.
- Perform Placement and observe the arrangement of standard cells.
- Inspect different standard cells using Magic Layout Editor.

---

# Theory

## Introduction to Floorplanning

After the synthesis stage, the RTL design is converted into a **gate-level netlist** consisting of interconnected standard cells. Although the logical functionality of the circuit has been established, the design still lacks a physical representation on silicon.

The next stage in the ASIC Physical Design flow is **Floorplanning**, which marks the beginning of the physical implementation process. During this stage, the overall dimensions of the chip are determined, the core region is defined, and sufficient space is allocated for standard cells, macros, power distribution, and routing resources.

Floorplanning plays a vital role in the overall quality of the design. A well-planned floorplan reduces routing congestion, minimizes interconnect delay, improves timing performance, lowers power consumption, and makes subsequent stages such as Placement, Clock Tree Synthesis (CTS), and Routing much more efficient.

---

## What is Floorplanning?

Floorplanning is the first physical design stage after synthesis in the ASIC design flow. It is the process of defining the physical structure of an integrated circuit by determining the dimensions of the chip and organizing the placement region before standard cells are placed.

During floorplanning, the EDA tool determines:

- Die Area
- Core Area
- Utilization Factor
- Aspect Ratio
- Placement Rows
- Macro Locations
- I/O Pin Locations
- Initial Power Distribution Planning

The generated floorplan serves as the foundation for all subsequent stages of Physical Design.

---

## Why is Floorplanning Important?

The quality of a floorplan directly affects the performance and manufacturability of the integrated circuit.

A properly designed floorplan helps to:

- Reduce routing congestion.
- Minimize wire length.
- Improve setup and hold timing.
- Lower power consumption.
- Reduce silicon area.
- Improve routing efficiency.
- Simplify Placement and Clock Tree Synthesis.

An inefficient floorplan may lead to excessive routing congestion, timing violations, poor power distribution, and increased chip area.

---

## Floorplanning in the ASIC Design Flow

```text
RTL Design
     │
     ▼
Logic Synthesis
     │
     ▼
Gate-Level Netlist
     │
     ▼
⭐ Floorplanning
     │
     ▼
Placement
     │
     ▼
Clock Tree Synthesis (CTS)
     │
     ▼
Routing
     │
     ▼
Signoff
```

Floorplanning represents the first stage where the logical circuit begins transforming into an actual silicon layout.

---

# Fundamental Concepts

## Die Area

The **Die** is the complete silicon chip fabricated from the semiconductor wafer. It represents the total physical area available for implementing the integrated circuit.

A die typically consists of:

- Core Area
- Input/Output (I/O) Pads
- Power Rings
- Corner Cells
- Routing Resources

The die dimensions are determined during floorplanning based on the overall design requirements.

> **Note:** The die represents the entire chip, whereas the core is only the region used for placing digital logic.

---

## Core Area

The **Core Area** is the region inside the die where all standard cells are placed during the placement stage.

Unlike the die, the core excludes the I/O pads and chip boundary structures.

The size of the core depends on:

- Total standard cell area
- Target utilization
- Aspect ratio
- Routing requirements
- Timing optimization

A properly selected core size provides sufficient routing space while minimizing unused silicon area.

---

## Utilization Factor

The **Utilization Factor** represents the percentage of the core area occupied by standard cells.

It is calculated as:

\[
\text{Utilization Factor}=
\frac{\text{Standard Cell Area}}
{\text{Core Area}}
\times100
\]

A lower utilization leaves more whitespace for routing and optimization but increases chip area.

A higher utilization reduces chip area but may increase routing congestion and timing violations.

Therefore, an optimum utilization factor is preferred in practical ASIC designs.

---

## Aspect Ratio

The **Aspect Ratio** defines the ratio between the height and width of the core.

\[
Aspect\ Ratio=\frac{Height}{Width}
\]

The aspect ratio influences:

- Placement quality
- Routing congestion
- Wire length
- Timing performance
- Overall chip dimensions

Choosing an appropriate aspect ratio helps achieve better routing efficiency and overall design quality.

---

## Standard Cells

Standard Cells are pre-designed logic building blocks available in the technology library.

Examples include:

- AND Gates
- OR Gates
- NAND Gates
- NOR Gates
- Inverters
- Buffers
- Multiplexers
- Flip-Flops

After synthesis, the RTL design is converted into an interconnected network of these standard cells, which are later placed inside the core during the placement stage.

---

## Pre-Placed Cells (Macros)

Macros are relatively large pre-designed functional blocks whose internal layout has already been completed.

Examples include:

- SRAM
- ROM
- PLL
- Analog IP
- Embedded Memory

Unlike standard cells, macros are generally fixed before placement because of their large size and predefined layout.

The placement tool arranges standard cells around these macros while maintaining routing accessibility and timing performance.

Since macros occupy a significant portion of the chip area, their placement has a major influence on routing congestion, wire length, and overall timing closure.

---

## Importance of Floorplanning

Floorplanning forms the foundation of the entire Physical Design flow.

A well-planned floorplan helps to:

- Reduce routing congestion.
- Minimize interconnect length.
- Improve timing performance.
- Lower power consumption.
- Reduce overall chip area.
- Simplify Placement, CTS, and Routing.

Since every subsequent stage depends on the floorplan, careful planning at this stage greatly improves the quality of the final integrated circuit.
