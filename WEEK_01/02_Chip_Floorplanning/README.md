# Chip Floorplanning

## Introduction

After completing the synthesis stage, the RTL design is converted into a **gate-level netlist** consisting of interconnected standard cells. Although the logical functionality of the circuit has been established, the design still lacks a physical representation on silicon.

The next stage in the ASIC Physical Design flow is **Floorplanning**, which marks the beginning of the physical implementation process. During this stage, the overall dimensions of the chip are determined, the core region is defined, and sufficient space is allocated for standard cells, macros, power distribution, and routing resources.

Floorplanning plays a vital role in the overall quality of the design. A well-planned floorplan reduces routing congestion, minimizes interconnect delay, improves timing performance, lowers power consumption, and makes subsequent stages such as Placement, Clock Tree Synthesis (CTS), and Routing much more efficient.

This module explores the fundamental concepts of chip floorplanning using the OpenLANE flow, followed by visualization of the generated floorplan and placement results using Magic Layout.

---

# Theory

## What is Floorplanning?

Floorplanning is the first physical design stage after synthesis in the ASIC design flow. It is the process of defining the physical structure of the integrated circuit by determining the dimensions of the chip and organizing the placement region before standard cells are placed.

Unlike synthesis, which focuses on the logical implementation of the design, floorplanning focuses on the **physical organization** of all design components on the silicon die.

During floorplanning, the EDA tool determines:

- Die Area
- Core Area
- Utilization Factor
- Aspect Ratio
- Placement Rows
- Macro Locations
- I/O Pin Locations
- Initial Power Planning Region

The generated floorplan serves as the foundation for all remaining stages of Physical Design.

---

## Why is Floorplanning Important?

The quality of a floorplan directly affects the performance and manufacturability of the integrated circuit.

A properly designed floorplan helps to:

- Reduce routing congestion
- Minimize wire length
- Improve setup and hold timing
- Lower dynamic power consumption
- Reduce overall chip area
- Improve routing efficiency
- Simplify placement and Clock Tree Synthesis

An inefficient floorplan can result in excessive routing congestion, increased timing violations, poor power distribution, and a larger silicon area.

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

# Fundamental Concepts of Floorplanning

## Die Area

The **Die** is the complete silicon chip obtained after the fabrication process. It represents the total physical area available for implementing the design.

Apart from the digital logic, the die also accommodates:

- Core Area
- Input/Output (I/O) Pads
- Power Rings
- Corner Cells
- Seal Ring
- Routing Resources

The dimensions of the die are determined during the floorplanning stage based on the overall design requirements.

> **Note:** The die is the complete chip, whereas the core is only a portion of the die where standard cells are placed.

---

## Core Area

The **Core Area** is the region inside the die where all standard cells are placed during the placement stage.

Unlike the die, the core does not contain the I/O pads or chip boundary structures.

The size of the core depends on:

- Number of standard cells
- Utilization factor
- Aspect ratio
- Routing requirements
- Future optimization space

A properly sized core provides sufficient whitespace for routing and timing optimization while minimizing unused silicon area.

---

## Utilization Factor

The **Utilization Factor** defines the percentage of the core area occupied by standard cells.

It is one of the most important parameters during floorplanning because it directly influences routing congestion and placement quality.

### Formula

\[
\text{Utilization Factor} =
\frac{\text{Area occupied by Standard Cells}}
{\text{Core Area}}
\times 100
\]

### Example

Suppose the total standard cell area is **600 μm²** and the core area is **1000 μm²**.

Then,

```
Utilization = (600 / 1000) × 100 = 60%
```

This means **60% of the core area is occupied by standard cells**, while the remaining **40% is reserved for routing resources, buffers, optimization, and future design modifications.**

### Effects of Utilization

#### Low Utilization

Advantages

- More routing space
- Lower congestion
- Easier timing optimization
- Better routing flexibility

Disadvantages

- Larger chip area
- Increased manufacturing cost

---

#### High Utilization

Advantages

- Smaller chip area
- Reduced fabrication cost

Disadvantages

- Higher routing congestion
- Longer routing runtime
- Increased timing violations
- Difficult optimization

In practical ASIC designs, utilization is selected carefully to maintain a balance between routing efficiency and silicon area.

---

## Aspect Ratio

The **Aspect Ratio** represents the ratio between the height and width of the core area.

### Formula

\[
Aspect\ Ratio =
\frac{Height}{Width}
\]

Examples

| Height | Width | Aspect Ratio | Shape |
|---------|-------|--------------|-------|
| 100 | 100 | 1 | Square |
| 200 | 100 | 2 | Tall Rectangle |
| 100 | 200 | 0.5 | Wide Rectangle |

The aspect ratio influences:

- Placement quality
- Routing congestion
- Wire length
- Timing performance
- Overall chip dimensions

Choosing an appropriate aspect ratio ensures efficient utilization of the available silicon area.

---

## Standard Cells

Standard Cells are pre-designed logic building blocks provided by the technology library.

Examples include:

- AND Gates
- OR Gates
- NAND Gates
- NOR Gates
- Inverters
- Buffers
- Multiplexers
- Flip-Flops

After synthesis, the RTL design is converted into an interconnected network of these standard cells.

During the placement stage, OpenROAD automatically positions these cells inside the core area.

---

## Pre-Placed Cells (Macros)

Macros are relatively large pre-designed functional blocks that are placed before the placement of standard cells.

Examples include:

- SRAM
- ROM
- PLL
- Analog IP
- Memory Blocks
- Embedded Processors

Unlike standard cells, macros are generally fixed during floorplanning because of their large size and predefined layout.

The placement tool arranges standard cells around these macros while ensuring routing accessibility and timing closure.

Since macros occupy a significant portion of the chip area, their placement greatly affects routing congestion, wire length, and overall timing performance.
