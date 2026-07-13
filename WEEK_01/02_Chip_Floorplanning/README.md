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
