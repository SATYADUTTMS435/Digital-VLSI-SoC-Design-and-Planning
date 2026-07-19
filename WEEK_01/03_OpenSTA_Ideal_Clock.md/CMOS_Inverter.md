# CMOS Inverter Standard Cell Design and Characterization

---

# Block 1 – Introduction

## Introduction

A CMOS inverter is the fundamental building block of digital integrated circuits. Complex digital systems such as NAND gates, NOR gates, multiplexers, flip-flops, memories, and processors are constructed using CMOS logic. In this experiment, a custom CMOS inverter designed using the Sky130 Process Design Kit (PDK) is analyzed from its physical layout to electrical characterization and finally prepared as a reusable standard cell for the OpenLane ASIC design flow.

---

## Theory of CMOS Inverter

A CMOS inverter consists of one PMOS and one NMOS transistor connected in a complementary configuration. The gates of both transistors are connected together to form the input, while their drains are connected together to form the output.

### Operation

| Input | PMOS | NMOS | Output |
|-------|------|------|--------|
| 0 | ON | OFF | 1 |
| 1 | OFF | ON | 0 |

When the input is LOW, the PMOS provides a path to VDD, producing a HIGH output. When the input is HIGH, the NMOS provides a path to GND, producing a LOW output. Hence, the circuit performs logical inversion.

### Advantages

- Low static power consumption
- High noise immunity
- Rail-to-rail output
- High switching speed
- High integration density

---

## Why Standard Cells are Important

A standard cell is a pre-designed and pre-characterized logic block used repeatedly during ASIC implementation. Each standard cell contains:

- Physical layout
- Timing information
- Power information
- SPICE model
- LEF file
- Liberty (.lib) file

Using standard cells reduces design time, ensures uniformity, and enables automated placement and routing during the RTL-to-GDSII design flow.

---

## Sky130 Inverter Overview

The CMOS inverter used in this experiment is provided as **sky130_inv.mag**. The layout contains:

- PMOS transistor
- NMOS transistor
- VPWR and VGND rails
- Input and output pins
- Metal interconnections
- Contacts and vias

The objective is to verify the layout, extract the circuit, characterize its timing, and prepare it for OpenLane integration.

> **Refer to Figures 1–2** for the Sky130 CMOS inverter layout.

---

# Block 2 – CMOS Inverter Layout Analysis

## Opening the Layout

The inverter layout is opened in Magic using the Sky130 technology file.

```bash
magic -T sky130A.tech sky130_inv.mag &
```

The technology file contains the layer definitions, connectivity information, extraction rules, and Design Rule Check (DRC) rules required for layout analysis.

---

## Understanding the Layout

The layout consists of complementary PMOS and NMOS transistors connected to implement an inverter.

### PMOS

- Located inside the N-well
- Connected to VPWR
- Pull-up transistor
- Turns ON for LOW input

### NMOS

- Located in the P-substrate
- Connected to VGND
- Pull-down transistor
- Turns ON for HIGH input

---

## Power Rails

Two horizontal Metal1 rails are provided:

- **VPWR** – Supplies power to the PMOS transistor.
- **VGND** – Provides the ground connection for the NMOS transistor.

These rails allow neighbouring standard cells to share common power connections.

---

## Contacts and Routing

Electrical connections between different fabrication layers are made using:

- Poly contacts
- Diffusion contacts
- Metal1 routing
- Vias

These structures ensure proper connectivity while satisfying the Sky130 design rules.

---

## Layout Explanation

The gates of the PMOS and NMOS are connected together to form the input, while their drains form the output node.

- Input LOW → PMOS ON → Output connected to VDD.
- Input HIGH → NMOS ON → Output connected to GND.

This complementary switching produces the inverter functionality with minimal static power consumption.

> **Refer to Figures 3–5** for the PMOS region, NMOS region, power rails, contacts, and complete layout.

---

# Block 3 – Port Labelling and Verification

## Port Labelling

Ports define the external electrical connections of the standard cell. Proper port labels ensure that physical layout pins are correctly mapped during extraction and place-and-route.

The inverter contains the following ports:

- Input (A)
- Output (Y)
- VPWR
- VGND

---

## Grid Alignment

The layout is aligned to the manufacturing grid to satisfy fabrication constraints. Proper alignment ensures accurate mask generation, improves routing compatibility, and prevents geometry-related design rule violations.

---

## Port Verification

Magic is used to verify that all ports are correctly labelled and connected before extraction. Incorrect labels may result in missing pins or incorrect connectivity in the extracted netlist.

---

## Preparing for LEF Generation

Correct port definitions are essential because the LEF file uses these ports to describe the abstract physical interface of the standard cell for automated placement and routing.

> **Refer to Figures 6–7** for port labels and grid alignment.

---

# Block 4 – Layout Extraction

## Theory of Layout Extraction

Layout extraction converts the physical geometry into an electrical circuit by identifying transistor connections, node connectivity, and parasitic components. This process verifies that the implemented layout matches the intended schematic.

---

## Generating the Extraction File

```tcl
extract all
```

This command generates the `.ext` file containing connectivity and geometric information extracted from the layout.

---

## SPICE Netlist Generation

```tcl
ext2spice
```

The extracted layout is converted into a SPICE netlist containing:

- PMOS transistor
- NMOS transistor
- Node connections
- Device dimensions
- Parasitic capacitances

---

## Understanding Parasitic Extraction

During fabrication, unwanted parasitic resistance and capacitance are introduced due to metal routing, diffusion regions, and interconnects. These parasitics affect propagation delay, rise time, fall time, and overall circuit performance. Including them in the extracted SPICE netlist provides a more accurate simulation of the fabricated circuit.

> **Refer to Figures 8–10** for the extraction process and generated SPICE netlist.

---

# Block 5 – Circuit Simulation and Timing Characterization

## SPICE Netlist Explanation

The extracted SPICE netlist describes the electrical behaviour of the CMOS inverter, including transistor models, node connectivity, parasitic capacitances, and simulation commands required for transient analysis.

---

## NGSPICE Simulation

The extracted netlist is simulated using NGSPICE.

```bash
ngspice sky130_inv.spice
```

Transient analysis is performed to observe the switching behaviour of the inverter.

---

## Input Pulse

A PULSE voltage source is applied to the input to alternate between logic LOW and HIGH states. The transient response of the output is observed for each switching event.

---

## Transient Analysis

The transient waveform verifies that the output is the logical complement of the input. The charging of the output node occurs through the PMOS transistor, while discharging occurs through the NMOS transistor.

---
## Timing Analysis

Transient analysis was performed using **NGSPICE** to evaluate the dynamic switching performance of the extracted Sky130 CMOS inverter. The timing parameters were measured directly from the simulated waveforms using standard CMOS timing conventions.

For a supply voltage of:

```text
VDD = 3.3 V
```

the reference voltages used for measurement are:

| Threshold | Voltage |
|-----------|---------|
| 20% of VDD | 0.66 V |
| 50% of VDD | 1.65 V |
| 80% of VDD | 2.64 V |

The **20%–80%** thresholds are used to measure rise and fall times because they exclude the nonlinear regions near the beginning and end of the transition. The **50%** threshold is used for propagation delay since it represents the effective switching point of the inverter.

---

## High-to-Low Propagation Delay (tPHL)

The High-to-Low propagation delay represents the time taken by the **output** to switch from HIGH to LOW after the **input** crosses **50% of VDD**.

The delay is calculated as:

```text
tPHL = tOUTPUT(50%) − tINPUT(50%)
```

From the NGSPICE measurements:

| Parameter | Time |
|-----------|------|
| Input @ 50% | 2.14982 ns |
| Output @ 50% | 2.21070 ns |

Therefore,

```text
tPHL = 2.21070 − 2.14982
      = 0.06088 ns
      = 60.88 ps
```

The measured delay indicates the time required for the NMOS transistor to discharge the output node after the input changes from LOW to HIGH.

> **Refer to Figure X** for the NGSPICE cursor measurements used to determine the High-to-Low propagation delay.

---

## Low-to-High Propagation Delay (tPLH)

The Low-to-High propagation delay represents the time taken by the **output** to switch from LOW to HIGH after the **input** crosses **50% of VDD**.

The delay is calculated as:

```text
tPLH = tOUTPUT(50%) − tINPUT(50%)
```

From the simulation:

| Parameter | Time |
|-----------|------|
| Input @ 50% | 4.04980 ns |
| Output @ 50% | 4.07745 ns |

Therefore,

```text
tPLH = 4.07745 − 4.04980
      = 0.02765 ns
      = 27.65 ps
```

This delay corresponds to the charging of the output node through the PMOS transistor.

> **Refer to Figure X** for the NGSPICE measurements used to calculate the Low-to-High propagation delay.

---

## Rise Time

Rise time is defined as the time required for the **output voltage** to increase from **20% (0.66 V)** to **80% (2.64 V)** of the supply voltage.

The rise time is calculated as:

```text
Rise Time = t80% − t20%
```

From the NGSPICE measurements:

| Parameter | Time |
|-----------|------|
| 20% (0.66 V) | 2.18177 ns |
| 80% (2.64 V) | 2.24414 ns |

Therefore,

```text
Rise Time = 2.24414 − 2.18177
          = 0.06237 ns
          = 62.37 ps
```

The measured rise time represents the time required for the PMOS transistor to charge the output capacitance from 20% to 80% of VDD.

> **Refer to Figure X** for the rise-time measurement.

---

## Fall Time

Fall time is defined as the time required for the **output voltage** to decrease from **80% (2.64 V)** to **20% (0.66 V)** of the supply voltage.

The fall time is calculated as:

```text
Fall Time = t20% − t80%
```

From the NGSPICE measurements:

| Parameter | Time |
|-----------|------|
| 80% (2.64 V) | 4.05281 ns |
| 20% (0.66 V) | 4.09459 ns |

Therefore,

```text
Fall Time = 4.09459 − 4.05281
          = 0.04178 ns
          = 41.78 ps
```

This value represents the discharge time of the output capacitance through the NMOS transistor.

> **Refer to Figure X** for the fall-time measurement.

---

## Analysis

The extracted Sky130 CMOS inverter successfully performs the expected switching operation. The measured propagation delays and transition times are all within the picosecond range, indicating fast switching performance. The rise time (**62.37 ps**) is slightly larger than the fall time (**41.78 ps**), which is expected due to the lower carrier mobility of PMOS transistors compared to NMOS transistors. Similarly, the measured propagation delays confirm that the inverter responds quickly to input transitions while accurately driving the output between logic HIGH and logic LOW levels.


# Block 6 – LEF Generation and OpenLane Integration

## LEF Generation

The Library Exchange Format (LEF) provides an abstract physical representation of the standard cell. Unlike GDS, it contains only the information required for placement and routing, such as cell dimensions, pin locations, routing layers, and obstructions.

---

## Why LEF is Required

LEF enables physical design tools to recognize the custom inverter as a reusable standard cell. Without a LEF file, automated placement and routing cannot correctly position or connect the cell.

---

## OpenLane Integration

The generated LEF, together with the Liberty timing file and GDS layout, is added to the OpenLane design flow. This allows the custom CMOS inverter to be used alongside other standard cells during floorplanning, placement, clock tree synthesis, routing, and timing analysis.

---

# Summary

A custom Sky130 CMOS inverter was analyzed, extracted, simulated, and characterized. The transient response verified correct inverter operation, while timing parameters such as rise time, fall time, and propagation delay were measured. Finally, the cell was prepared for integration into the OpenLane ASIC design flow through LEF generation.

---

# Learning Outcomes

- Understood CMOS inverter operation.
- Analyzed the Sky130 layout.
- Learned layout extraction using Magic.
- Generated a SPICE netlist.
- Simulated the inverter using NGSPICE.
- Measured rise time, fall time, and propagation delay.
- Understood parasitic extraction.
- Learned the purpose of LEF files.
- Prepared a reusable standard cell for OpenLane.

---

# Conclusion

The Sky130 CMOS inverter was successfully characterized from physical layout to electrical simulation. This workflow demonstrates the complete process of custom standard-cell development, providing a foundation for integrating user-defined cells into an automated ASIC physical design flow.



<img width="1655" height="892" alt="Screenshot 2026-07-15 103031" src="https://github.com/user-attachments/assets/a9185fae-3e0c-41db-88cd-73d189d86607" />

<img width="1918" height="863" alt="1" src="https://github.com/user-attachments/assets/33eb58fb-110a-4e54-b3db-fc437576a0f7" />

<img width="1837" height="857" alt="2" src="https://github.com/user-attachments/assets/714f656d-7223-4e43-8674-45a58c8bb05c" />

<img width="1637" height="900" alt="3" src="https://github.com/user-attachments/assets/eb04696b-0842-47eb-99cd-2a6d4c539094" />

<img width="1491" height="380" alt="4" src="https://github.com/user-attachments/assets/40159bc0-23a1-4e73-ac72-ba46505c64ef" />

<img width="1527" height="370" alt="5" src="https://github.com/user-attachments/assets/6992c30b-a821-4f73-b4c2-662f4c167960" />

<img width="1552" height="372" alt="6" src="https://github.com/user-attachments/assets/69f3b092-3014-4075-afef-67d0f4bcb521" />

<img width="1583" height="378" alt="7" src="https://github.com/user-attachments/assets/43423b27-46a9-4320-9e23-3effafa8817b" />

<img width="1655" height="892" alt="Screenshot 2026-07-15 103031" src="https://github.com/user-attachments/assets/6c901903-3171-482e-9509-03cbe6110a98" />

<img width="1655" height="892" alt="Screenshot 2026-07-15 103031" src="https://github.com/user-attachments/assets/8a133524-ce2f-4a1d-b9fd-a96d1b402b0d" />








