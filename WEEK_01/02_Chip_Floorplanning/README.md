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

The **Die** is the complete piece of silicon obtained after the wafer fabrication process. It represents the total physical chip that will eventually be packaged and used in electronic systems.

The die consists of several regions, including:

- Core Area
- Input/Output (I/O) Pads
- Power Rings
- Corner Cells
- Seal Ring
- Routing Resources

Every physical component of the integrated circuit must fit within the die boundary.

In simple terms, the **Die** can be thought of as the **entire plot of land** on which a house is built.

### Real-World Analogy

Imagine purchasing a plot measuring **50 m × 40 m**.

This entire plot represents the **Die**.

Inside the plot, you construct:

- House
- Garden
- Parking Area
- Compound Wall

Similarly, in ASIC design,

- Plot = Die
- House = Core
- Parking = I/O Pads
- Boundary Wall = Seal Ring

The die therefore represents the complete chip.

---

## 2. Core Area

The **Core Area** is the region inside the die where all the digital logic is implemented.

Only the synthesized standard cells are placed inside the core.

The Core does **not** include:

- I/O Pads
- Corner Cells
- Seal Ring
- Chip Boundary

The size of the Core depends upon

- Number of Standard Cells
- Utilization Factor
- Aspect Ratio
- Routing Resources
- Timing Constraints

The Placement stage uses this Core Area to arrange all synthesized standard cells.

---

### Difference between Die and Core

| Die Area | Core Area |
|-----------|-----------|
| Entire silicon chip | Region where logic is placed |
| Contains IO Pads | Does not contain IO Pads |
| Contains Seal Ring | Does not contain Seal Ring |
| Contains Core | Located inside Die |
| Larger | Smaller |

---

## 3. Utilization Factor

One of the most important parameters during Floorplanning is the **Utilization Factor**.

It specifies how much of the Core Area is occupied by Standard Cells.

Mathematically,

$$
\text{Utilization}=
\frac{\text{Standard Cell Area}}
{\text{Core Area}}
\times100
$$

---

### Example 1

Suppose

Standard Cell Area

```
600 μm²
```

Core Area

```
1000 μm²
```

Then,

$$
\text{Utilization}
=
\frac{600}{1000}
\times100
=
60\%
$$

This means

- 60% of the Core contains Standard Cells.
- 40% is left empty.

The remaining empty space is called **Whitespace**.

Whitespace is extremely important because it provides room for

- Routing
- Buffers
- ECO
- CTS Buffers
- Optimization

---

### Example 2

Suppose

```
Standard Cell Area = 850 μm²

Core Area = 1000 μm²
```

Then,

$$
\frac{850}{1000}
\times100
=
85\%
$$

An 85% utilization indicates that the core is densely packed.

Although the chip area becomes smaller, routing becomes much more difficult.

---

### What happens if Utilization is too Low?

Suppose

```
Utilization = 30%
```

Advantages

- Very easy routing
- Low congestion
- Easy timing optimization

Disadvantages

- Large chip area
- Higher fabrication cost
- Wasted silicon

---

### What happens if Utilization is too High?

Suppose

```
Utilization = 95%
```

Advantages

- Smaller chip
- Lower silicon cost

Disadvantages

- Routing congestion
- Timing violations
- Difficult CTS
- Difficult ECO
- Larger routing runtime

---

### Industry Practice

Most commercial ASICs do **not** use 100% utilization.

Depending on the complexity of the design,

Typical utilization ranges between

```
55% – 75%
```

This provides sufficient whitespace for routing and timing optimization.

---

## 4. Aspect Ratio

Aspect Ratio defines the shape of the Core.

It is given by

$$
Aspect\ Ratio
=
\frac{Height}
{Width}
$$

---

### Example 1

Height

```
100 μm
```

Width

```
100 μm
```

$$
Aspect\ Ratio
=
\frac{100}{100}
=
1
$$

The Core becomes a **Square**.

---

### Example 2

Height

```
200 μm
```

Width

```
100 μm
```

$$
Aspect\ Ratio
=
2
$$

The Core becomes a **Tall Rectangle**.

---

### Example 3

Height

```
100 μm
```

Width

```
250 μm
```

$$
Aspect\ Ratio
=
0.4
$$

The Core becomes a **Wide Rectangle**.

---

### Why is Aspect Ratio Important?

Changing the Aspect Ratio changes

- Placement Quality
- Routing Congestion
- Wire Length
- Timing
- Clock Tree Shape

Choosing an appropriate Aspect Ratio improves the overall Physical Design quality.

---

## 5. Standard Cells

Standard Cells are pre-designed digital logic blocks available in the Standard Cell Library.

Examples include

- Inverter
- Buffer
- NAND Gate
- NOR Gate
- XOR Gate
- Multiplexer
- D Flip-Flop

These cells are characterized for

- Timing
- Area
- Power
- Leakage

During Placement, millions of Standard Cells are automatically arranged inside the Core.

---

## 6. Pre-Placed Cells (Macros)

Macros are comparatively large pre-designed functional blocks.

Examples include

- SRAM
- ROM
- PLL
- Analog Blocks
- Embedded Memory
- Processor Core

Unlike Standard Cells,

Macros are

- Larger
- Fixed
- Already designed
- Not movable during Placement

The Placement tool arranges Standard Cells around these Macros.

---

### Real-Life Analogy

Imagine constructing a university campus.

Large buildings such as

- Library
- Auditorium
- Hostel

are constructed first.

Small objects such as

- Benches
- Chairs
- Tables

are arranged later.

Similarly,

Macros behave like large buildings,

while Standard Cells behave like chairs.

---

## 7. Whitespace

Whitespace is the unused portion of the Core Area.

Although it appears empty, it is extremely important.

Whitespace provides space for

- Routing
- CTS Buffers
- Timing Optimization
- ECO
- Future Design Changes

Without sufficient whitespace,

the routing tool may fail to complete the design successfully.

---

## Summary

During Floorplanning, the designer determines

- Die Size
- Core Size
- Utilization
- Aspect Ratio
- Placement Rows
- Macro Locations
- Routing Resources

These decisions directly influence Placement, Clock Tree Synthesis, Routing, Timing, and the overall quality of the final integrated circuit.
