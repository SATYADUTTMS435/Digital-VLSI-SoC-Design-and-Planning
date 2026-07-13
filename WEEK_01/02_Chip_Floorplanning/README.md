# Theory

## Introduction to Floorplanning

The design of an Application Specific Integrated Circuit (ASIC) follows a sequence of stages known as the **ASIC Design Flow**. Initially, the designer writes the functionality of the circuit using a Hardware Description Language (HDL) such as Verilog or VHDL. This logical description is then converted into a gate-level netlist through the synthesis process.

Although synthesis successfully converts the RTL into interconnected logic gates, the generated design still has **no physical existence**. The gates exist only as logical connections and do not have actual locations on a silicon chip.

Before fabrication, these logic gates must be arranged physically on the silicon die. This transition from a logical design to a physical layout begins with the **Floorplanning** stage.

Floorplanning is the first step in the Physical Design flow. It determines the overall dimensions of the chip, allocates the region where logic cells will be placed, reserves space for macros and routing resources, and prepares the design for the Placement stage.

The quality of the floorplan has a direct impact on almost every stage that follows. A poor floorplan may increase routing congestion, create timing violations, increase power consumption, and even make the design impossible to manufacture. Therefore, Floorplanning is considered one of the most important stages in Physical Design.

---

## ASIC Physical Design Flow

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
Physical Verification
     │
     ▼
Tapeout
```

Floorplanning acts as the bridge between **logical design** and **physical implementation**.

---

# What is Floorplanning?

Floorplanning is the process of defining the physical structure of an integrated circuit before placing the standard cells.

In simple words, it answers the following questions:

- How large should the chip be?
- How much area should be allocated for logic?
- Where should memory blocks be placed?
- Where should the Input/Output pins be located?
- How much free space should be left for routing?
- What should be the shape of the chip?

The answers to these questions form the **floorplan** of the chip.

During this stage, the EDA tool determines:

- Die Area
- Core Area
- Aspect Ratio
- Utilization Factor
- Placement Rows
- Macro Locations
- IO Pin Locations
- Initial Power Planning

These decisions become the foundation for every subsequent Physical Design stage.

---

# Real World Analogy

A useful way to understand Floorplanning is by comparing it to constructing a new shopping mall.

Suppose an architect has been asked to design a shopping mall.

Before shops are assigned, the architect first decides:

- Total land area
- Parking area
- Elevator positions
- Escalators
- Food court
- Emergency exits
- Corridors

Only after this planning are the individual shops allocated.

Similarly, during ASIC design, we first decide:

- Total chip size
- Core dimensions
- Memory locations
- Standard cell region
- Routing resources
- Power distribution

Only after completing this planning do we begin placing millions of logic gates.

This planning process is exactly what Floorplanning performs.

---

# Why is Floorplanning Important?

The decisions made during Floorplanning directly influence the quality of the final chip.

An efficient floorplan provides several advantages.

## 1. Reduced Routing Congestion

If cells are placed too closely together, the routing tool may not find sufficient space to connect all the wires.

Proper Floorplanning leaves enough routing channels between different regions of the chip, making routing much easier.

---

## 2. Better Timing Performance

Long wires introduce larger propagation delays.

A good Floorplan places logically related blocks closer together, reducing wire length and improving timing.

Example:

Instead of

```
ALU ----------------------------- Register
```

we prefer

```
ALU ---- Register
```

The second arrangement produces much smaller delay.

---

## 3. Lower Power Consumption

Long interconnects possess higher parasitic capacitance.

Since dynamic power is proportional to capacitance

$$
P = \alpha C V^2 f
$$

reducing wire length also reduces power consumption.

---

## 4. Easier Placement

Placement algorithms perform much better when enough whitespace is available.

Without sufficient whitespace,

- cells overlap,
- congestion increases,
- optimization becomes difficult.

---

## 5. Improved Manufacturability

A well-planned floorplan produces

- fewer Design Rule Violations (DRCs),
- improved routing quality,
- better signal integrity,
- easier timing closure.

---

# Goals of Floorplanning

The primary objectives of Floorplanning are:

- Define the Die dimensions.
- Define the Core dimensions.
- Select the Utilization Factor.
- Select the Aspect Ratio.
- Allocate routing resources.
- Reserve space for power planning.
- Place macros.
- Generate placement rows.
- Prepare the design for Placement.

These goals ensure that the design can proceed efficiently through Placement, Clock Tree Synthesis, Routing, and Signoff.

---

# Major Parameters Determined During Floorplanning

The Floorplanning stage determines several important parameters that influence the quality of the entire chip.

These include:

- Die Area
- Core Area
- Utilization Factor
- Aspect Ratio
- Placement Rows
- Standard Cell Region
- Macro Locations
- IO Locations
- Whitespace
- Initial Power Planning

Each of these parameters will be discussed in detail in the following sections.

# Fundamental Concepts of Floorplanning

## 1. Die Area

The **Die** is the complete silicon chip obtained after the wafer fabrication process. It represents the total physical area available for implementing the integrated circuit.

The die consists of several regions, including:

- Core Area
- Input/Output (I/O) Pads
- Power Rings
- Corner Cells
- Seal Ring
- Routing Resources

Every physical component of the integrated circuit must fit within the die boundary.

### Real-World Analogy

Imagine purchasing a plot of land measuring **50 m × 40 m**.

The entire plot represents the **Die**.

Inside this plot, you construct:

- House
- Garden
- Parking Area
- Compound Wall

Similarly, in ASIC design:

- Plot = Die
- House = Core
- Parking Area = I/O Pads
- Compound Wall = Seal Ring

The die therefore represents the complete chip.

---

## 2. Core Area

The **Core Area** is the region inside the die where all synthesized standard cells are placed during the Placement stage.

Unlike the die, the core does **not** include:

- I/O Pads
- Corner Cells
- Seal Ring
- Chip Boundary

The size of the Core depends upon:

- Total Standard Cell Area
- Utilization Factor
- Aspect Ratio
- Routing Resources
- Timing Constraints

The Placement stage uses this Core Area to arrange all synthesized standard cells.

---

### Difference Between Die and Core

| Die Area | Core Area |
|-----------|-----------|
| Complete silicon chip | Region where logic cells are placed |
| Contains I/O Pads | Does not contain I/O Pads |
| Contains Seal Ring | Does not contain Seal Ring |
| Contains Core | Located inside the Die |
| Larger in size | Smaller in size |

---

## 3. Utilization Factor

The **Utilization Factor** specifies how much of the Core Area is occupied by Standard Cells.

It is one of the most important parameters during Floorplanning because it directly affects placement quality, routing congestion, timing closure, and chip area.

### Formula

```text
Utilization (%) = (Standard Cell Area / Core Area) × 100
```

### Example 1

Suppose,

```text
Standard Cell Area = 600 μm²
Core Area          = 1000 μm²
```

Calculation:

```text
Utilization = (600 / 1000) × 100
            = 0.6 × 100
            = 60%
```

This means:

- **60%** of the Core Area is occupied by Standard Cells.
- The remaining **40%** is left empty.

This unused region is called **Whitespace**, which is required for:

- Routing
- Clock Tree Synthesis (CTS)
- Buffer Insertion
- Engineering Change Orders (ECO)
- Future Design Optimizations

---

### Example 2

Suppose,

```text
Standard Cell Area = 850 μm²
Core Area          = 1000 μm²
```

Calculation:

```text
Utilization = (850 / 1000) × 100
            = 0.85 × 100
            = 85%
```

An **85% utilization** indicates that the design is densely packed.

Although this reduces the overall chip area, it also increases routing congestion and makes timing optimization more difficult.

---

### Low Utilization

Suppose,

```text
Utilization = 30%
```

**Advantages**

- More routing space
- Lower congestion
- Easier timing optimization
- Better placement flexibility

**Disadvantages**

- Larger chip area
- Higher fabrication cost
- Wasted silicon

---

### High Utilization

Suppose,

```text
Utilization = 95%
```

**Advantages**

- Smaller chip size
- Lower fabrication cost

**Disadvantages**

- High routing congestion
- Increased timing violations
- Difficult Clock Tree Synthesis
- Difficult ECO implementation
- Longer routing runtime

---

### Industry Practice

Commercial ASIC designs rarely use **100% utilization**.

Most modern digital designs use approximately:

```text
55% – 75%
```

This leaves sufficient whitespace for routing, CTS, buffering, and timing optimization.

---

## 4. Aspect Ratio

The **Aspect Ratio** defines the shape of the Core Area.

### Formula

```text
Aspect Ratio = Height / Width
```

---

### Example 1

```text
Height = 100 μm
Width  = 100 μm
```

Calculation:

```text
Aspect Ratio = 100 / 100
             = 1
```

The Core becomes a **Square**.

---

### Example 2

```text
Height = 200 μm
Width  = 100 μm
```

Calculation:

```text
Aspect Ratio = 200 / 100
             = 2
```

The Core becomes a **Tall Rectangle**.

---

### Example 3

```text
Height = 100 μm
Width  = 250 μm
```

Calculation:

```text
Aspect Ratio = 100 / 250
             = 0.4
```

The Core becomes a **Wide Rectangle**.

---

### Why is Aspect Ratio Important?

Changing the Aspect Ratio affects:

- Placement Quality
- Routing Congestion
- Wire Length
- Timing Performance
- Clock Tree Structure

A suitable Aspect Ratio helps reduce congestion and improves the overall quality of the physical design.

---

## 5. Standard Cells

Standard Cells are pre-designed digital logic blocks available in the Standard Cell Library.

Examples include:

- Inverter
- Buffer
- NAND Gate
- NOR Gate
- XOR Gate
- Multiplexer
- D Flip-Flop

These cells are fully characterized for:

- Timing
- Area
- Power
- Leakage

After synthesis, the RTL design is converted into a network of these Standard Cells, which are automatically placed inside the Core Area during Placement.

---

## 6. Pre-Placed Cells (Macros)

Macros are comparatively large pre-designed functional blocks whose layouts are already optimized.

Examples include:

- SRAM
- ROM
- PLL
- Analog IP
- Embedded Memory
- Processor Core

Unlike Standard Cells, Macros are:

- Larger in size
- Fixed during Floorplanning
- Not movable during Placement
- Pre-designed and pre-verified

The Placement tool arranges Standard Cells around these Macros while ensuring routing accessibility and timing closure.

### Real-World Analogy

Consider the construction of a university campus.

Large buildings such as:

- Library
- Auditorium
- Hostel

are constructed first.

Later, smaller objects like:

- Chairs
- Benches
- Tables

are arranged inside or around them.

Similarly,

- **Macros** behave like large buildings.
- **Standard Cells** behave like chairs and tables.

---

## 7. Whitespace

Whitespace is the unused portion of the Core Area.

Although it appears empty, it plays a very important role in Physical Design.

Whitespace provides space for:

- Signal Routing
- Clock Tree Buffers
- Timing Optimization
- ECO Modifications
- Future Design Changes

Without sufficient whitespace, routing becomes difficult, congestion increases, and the design may fail to meet timing requirements.

---

## Summary

During Floorplanning, the designer determines:

- Die Size
- Core Size
- Utilization Factor
- Aspect Ratio
- Placement Rows
- Macro Locations
- Routing Resources
- Available Whitespace

These decisions directly influence Placement, Clock Tree Synthesis (CTS), Routing, Timing Closure, and the overall quality of the final integrated circuit.





# Placement

## Introduction to Placement

After successfully generating the floorplan, the next stage in the ASIC Physical Design flow is **Placement**.

During Floorplanning, the EDA tool defines the physical boundaries of the chip, including the Die Area, Core Area, placement rows, utilization, and aspect ratio. However, at this stage, the synthesized standard cells have **not yet been assigned physical locations**.

The objective of the Placement stage is to assign an optimal position for every standard cell within the Core Area while satisfying various design constraints such as timing, congestion, wire length, and power consumption.

Unlike Floorplanning, which focuses on planning the chip layout, Placement focuses on arranging the logic cells inside the predefined floorplan.

---

## What is Placement?

Placement is the process of positioning all synthesized standard cells inside the Core Area generated during the Floorplanning stage.

The placement tool attempts to position cells such that:

- Total wire length is minimized.
- Routing congestion is reduced.
- Timing requirements are satisfied.
- Power consumption is minimized.
- Cells do not overlap.
- Design rules are maintained.

The output of Placement serves as the input for the Clock Tree Synthesis (CTS) stage.

---

## Why is Placement Important?

Placement is one of the most important stages in Physical Design because it directly influences the performance of the final integrated circuit.

A well-optimized placement offers several advantages:

- Reduced interconnect delay.
- Lower routing congestion.
- Improved setup and hold timing.
- Reduced power consumption.
- Better routing quality.
- Faster timing convergence.

On the other hand, poor placement may lead to:

- Long interconnects.
- Routing congestion.
- Increased timing violations.
- Larger power consumption.
- Difficult Clock Tree Synthesis.
- Increased routing complexity.

---

## Objectives of Placement

The Placement stage aims to:

- Place every synthesized standard cell inside the Core Area.
- Minimize total wire length.
- Reduce routing congestion.
- Improve timing performance.
- Prepare the design for Clock Tree Synthesis.
- Ensure legal placement without overlapping cells.

---

## Types of Placement

Placement is generally performed in three stages.

### 1. Global Placement

During Global Placement, the placement tool determines approximate locations for all standard cells.

At this stage:

- Cell overlap is allowed.
- The focus is on minimizing wire length and congestion.
- Timing optimization is considered.

Global Placement provides an initial estimate of where cells should be located.

---

### 2. Detailed Placement

During Detailed Placement, the approximate locations generated during Global Placement are refined.

The placement tool:

- Removes overlapping cells.
- Aligns cells with placement rows.
- Ensures legal placement.
- Maintains design rule constraints.

The output is a physically legal placement that is ready for Clock Tree Synthesis.

---

### 3. Placement Optimization

After Detailed Placement, optimization techniques are applied to improve the quality of the placement.

Typical optimizations include:

- Cell resizing.
- Buffer insertion.
- Cell movement.
- Congestion reduction.
- Timing optimization.

These optimizations improve setup timing, reduce wire length, and prepare the design for subsequent Physical Design stages.

---

## Placement in OpenLANE

The OpenLANE flow uses **OpenROAD** for Placement.

During this stage, OpenROAD reads:

- Synthesized Netlist
- Floorplan DEF
- Technology LEF
- Standard Cell LEF
- Timing Libraries

Based on these inputs, the placement engine computes suitable positions for all standard cells while optimizing timing, wire length, and congestion.

The generated placement database is then passed to the Clock Tree Synthesis (CTS) stage.

---

## Placement Output

After successful Placement, the design contains:

- Legally placed Standard Cells.
- Placement Rows.
- Fixed Macros.
- Optimized Cell Locations.
- Updated DEF File.

Although the cells have now been assigned physical locations, they are **not yet electrically connected**.

Routing is performed in a later stage to establish the required electrical connections between the placed cells.

---

## Difference Between Floorplanning and Placement

| Floorplanning | Placement |
|--------------|-----------|
| Defines the chip structure | Places standard cells inside the core |
| Determines Die and Core Area | Assigns physical locations to cells |
| Places macros and I/O pins | Places synthesized standard cells |
| Creates placement rows | Optimizes cell positions |
| Output is Floorplan | Output is Placed Design |

---

## Summary

Placement is the stage where the synthesized standard cells are physically arranged inside the Core Area generated during Floorplanning.

A good placement minimizes wire length, reduces routing congestion, improves timing performance, and prepares the design for Clock Tree Synthesis and Routing. Since Placement directly affects almost every subsequent stage of Physical Design, it plays a crucial role in determining the performance, power, and area of the final integrated circuit.



<img width="1918" height="882" alt="Screenshot 2026-07-13 233941" src="https://github.com/user-attachments/assets/e24c5f26-673c-4523-b4ea-1a70bce0ec62" />

<img width="1626" height="890" alt="Screenshot 2026-07-13 234114" src="https://github.com/user-attachments/assets/9f90cb6c-0e7f-4c06-8973-17d64605e6bd" />

<img width="1785" height="887" alt="Screenshot 2026-07-13 234212" src="https://github.com/user-attachments/assets/8d28c6ed-d67b-4cc3-a178-ff0b7735e9d7" />

<img width="1761" height="901" alt="Screenshot 2026-07-13 234304" src="https://github.com/user-attachments/assets/d625e9aa-78af-461a-b1ab-b6d19bc9f236" />

<img width="1632" height="893" alt="Screenshot 2026-07-13 234411" src="https://github.com/user-attachments/assets/130cd73c-5f88-4794-9810-0f1a707abf70" />

<img width="1636" height="901" alt="Screenshot 2026-07-13 234603" src="https://github.com/user-attachments/assets/b20e638a-57dd-44f2-9afe-670d0fac0ebf" />

<img width="1655" height="917" alt="Screenshot 2026-07-14 000723" src="https://github.com/user-attachments/assets/d8d4504d-5ae8-4041-85ec-64d4343c9bff" />

<img width="1708" height="898" alt="Screenshot 2026-07-14 000841" src="https://github.com/user-attachments/assets/9c7350be-b081-41e4-b3a1-0f2ba81942d7" />







