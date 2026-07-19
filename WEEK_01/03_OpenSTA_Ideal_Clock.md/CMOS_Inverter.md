# CMOS Inverter Standard Cell Design and Characterization

## 1. Introduction

The CMOS inverter is the most fundamental building block in digital integrated circuits. Every complex digital system, including NAND gates, NOR gates, multiplexers, flip-flops, memories, and microprocessors, is ultimately constructed using CMOS transistors. Due to its simple structure, low static power consumption, and excellent noise immunity, the CMOS inverter serves as the foundation for understanding digital VLSI design.

In this experiment, a custom CMOS inverter implemented using the **Sky130 Process Design Kit (PDK)** is analyzed using the **Magic VLSI Layout Editor**. The physical layout is examined, extracted into a SPICE netlist, simulated using NGSPICE, characterized through transient analysis, and finally prepared as a reusable standard cell for integration into the OpenLane RTL-to-GDSII ASIC design flow.

---

# Theory of CMOS Inverter

A CMOS (Complementary Metal-Oxide-Semiconductor) inverter consists of two complementary MOS transistors:

- A **PMOS transistor** connected between the output and the positive supply voltage (VDD).
- An **NMOS transistor** connected between the output and ground (GND).

The gates of both transistors are connected together to form the input, while their drains are connected together to form the output.

The operation of the inverter depends on the input voltage:

### Input = LOW (Logic 0)

- PMOS turns ON.
- NMOS turns OFF.
- Output is connected to VDD.
- Output becomes HIGH (Logic 1).

### Input = HIGH (Logic 1)

- PMOS turns OFF.
- NMOS turns ON.
- Output is connected to GND.
- Output becomes LOW (Logic 0).

Thus, the output always represents the logical complement of the input, giving the circuit its name **"Inverter."**

### Advantages of CMOS Inverter

- Very low static power consumption
- High switching speed
- Excellent noise immunity
- Rail-to-rail output voltage
- High integration density
- Suitable for modern VLSI systems

---

# Importance of Standard Cells

A **standard cell** is a pre-designed and pre-characterized logic block that serves as a reusable building block in ASIC design. Instead of manually designing every logic gate within a chip, designers develop optimized standard cells once and reuse them throughout the entire integrated circuit.

A typical standard-cell library contains commonly used logic gates such as:

- Inverters
- Buffers
- NAND gates
- NOR gates
- XOR gates
- Flip-flops
- Latches

Each standard cell is characterized for:

- Physical layout
- Electrical behavior
- Timing performance
- Power consumption
- Area
- Routing information

The use of standard cells significantly reduces design complexity, improves design consistency, and enables fully automated placement and routing using physical design tools such as OpenLane.

---

# Sky130 CMOS Inverter Overview

The inverter analyzed in this experiment is provided as the **`sky130_inv.mag`** layout file within the Sky130 Process Design Kit.

The layout follows the Sky130 design rules and contains:

- One PMOS transistor
- One NMOS transistor
- VPWR power rail
- VGND ground rail
- Input and output ports
- Metal interconnections
- Contacts and vias

This inverter acts as a complete standard-cell example that can be extracted, simulated, characterized, and later integrated into an ASIC design flow.

The primary objective of this experiment is to understand how a physical layout is transformed into an electrical circuit, verify its switching characteristics through SPICE simulation, and prepare the cell for use in automated physical design.

---

# 2. CMOS Inverter Layout Analysis

## Opening the Layout

The inverter layout is opened in Magic using the Sky130 technology file.

```bash
magic -T sky130A.tech sky130_inv.mag &
```

The technology file provides Magic with all the fabrication information required to correctly interpret the layout, including layer definitions, colors, connectivity information, and design rules.

Once loaded, the inverter layout can be inspected layer by layer to understand its physical implementation.

> **Refer to Figure X** for the opened CMOS inverter layout in Magic.

---

## Understanding the Layout

The CMOS inverter layout consists of complementary PMOS and NMOS transistors connected together to implement the inverter function.

### PMOS Region

The PMOS transistor is placed inside an N-well and forms the pull-up network of the inverter. Its source is connected to the VPWR rail, while its drain is connected to the output node. When the input is LOW, the PMOS turns ON and charges the output to VDD.

### NMOS Region

The NMOS transistor is fabricated in the P-type substrate and forms the pull-down network. Its source is connected to the VGND rail, while its drain shares the common output node with the PMOS transistor. When the input is HIGH, the NMOS turns ON and discharges the output to ground.

---

## Power Rails

The layout contains two horizontal power rails:

- **VPWR** – Supplies the operating voltage to the PMOS transistor.
- **VGND** – Provides the ground reference for the NMOS transistor.

Using dedicated horizontal rails simplifies routing and allows neighbouring standard cells to share common power connections during placement.

---

## Contacts and Metal Routing

Different fabrication layers are electrically connected using contacts and vias.

The layout contains:

- Poly contacts
- Diffusion contacts
- Metal1 routing
- Metal interconnections

These structures ensure reliable electrical connectivity between the transistor terminals and the external pins while satisfying the Sky130 fabrication rules.

---

## Overall Layout Operation

The gates of both transistors are connected together to form the input signal. Their drains are connected together to create the output node.

During operation:

- When the input is LOW, the PMOS provides a conductive path from VDD to the output while the NMOS remains OFF.
- When the input is HIGH, the NMOS connects the output to ground while the PMOS remains OFF.

This complementary switching action allows the circuit to produce the logical inversion of the input with very low static power consumption.

> **Refer to Figure X** for the complete CMOS inverter layout showing the PMOS region, NMOS region, power rails, contacts, and routing.
