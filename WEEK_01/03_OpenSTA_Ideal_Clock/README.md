# Day 3: Standard Cell Design using Magic Layout and Sky130 Technology

## Objective

The objective of this experiment is to understand the physical implementation of a CMOS standard cell using the **Sky130 Process Design Kit (PDK)** and the **Magic VLSI Layout Editor**. This includes learning the Sky130 design rules, performing Design Rule Check (DRC), understanding the CMOS inverter layout, extracting the circuit netlist, and finally generating a LEF file that can later be integrated into the OpenLane ASIC design flow.

---

# 1. Understanding Sky130 DRC Test Structures

## Theory

Before designing any integrated circuit, it is important to understand the **design rules** specified by the semiconductor foundry.

Design Rules are a set of geometric constraints that ensure the fabricated layout is reliable and manufacturable. These rules specify the minimum:

- Width of each layer
- Spacing between adjacent layers
- Enclosure of contacts and vias
- Extension of wells and diffusion regions
- Metal routing requirements

During fabrication, violating these rules may lead to short circuits, open circuits, poor yield, or complete chip failure. Therefore, every layout must successfully pass the **Design Rule Check (DRC)** before fabrication.

The Sky130 PDK provides several predefined DRC example layouts that intentionally contain both valid and invalid geometries. These examples help designers understand how Magic identifies rule violations.

---

## Downloading the DRC Test Files

The Sky130 DRC example layouts were downloaded from the OpenCircuitDesign repository. The compressed archive was extracted, and the directory contents were verified.

```bash
wget http://opencircuitdesign.com/open_pdks/archive/drc_tests.tgz

tar xfz drc_tests.tgz

cd drc_tests

ls -al
```

The extracted directory contains multiple `.mag` layout files representing different fabrication layers such as polysilicon, diffusion, contacts, wells, and metals, along with the `sky130A.tech` technology file used by Magic.

> **Refer to Figures 1 and 2** for the download process, extraction, and the list of extracted DRC test files.

---

## Loading the Sky130 Technology

The extracted technology file was loaded into Magic to initialize the Sky130 fabrication environment.

### Theory

A **Technology File (`.tech`)** acts as the bridge between the layout editor and the semiconductor fabrication process.

It contains:

- Layer definitions
- Display colors
- Layer priorities
- Electrical connectivity information
- Design Rule Check (DRC) rules
- Extraction rules
- Parasitic extraction parameters

Without the technology file, Magic cannot correctly interpret the layout geometry or perform DRC verification.

Once the technology file was loaded, the predefined Sky130 example layouts became available for inspection.

> **Refer to Figure 3** for the Magic layout window after loading the Sky130 technology file.

---

# 2. Performing Design Rule Check (DRC)

## Theory

Design Rule Check (DRC) is the first verification step performed after creating a layout.

Its objective is to verify that every polygon drawn in the layout satisfies the manufacturing constraints specified by the foundry.

Magic continuously checks for violations while editing the layout. The command:

```text
drc why
```

displays the reason for any violation present inside the selected region.

Initially, an incorrect command format was entered using the colon (`:`) prefix, which resulted in an error. After correcting the syntax, Magic successfully reported the DRC information.

Individual DRC example cells were loaded for detailed inspection.

```text
load poly
```

# 3. Understanding Poly Design Rules using Magic

## Theory

The **Polysilicon (Poly)** layer is one of the most important layers in CMOS fabrication. It forms the **gate terminal** of both NMOS and PMOS transistors. Whenever the polysilicon layer crosses the active diffusion region, a MOS transistor is formed.

Since the gate length directly affects the electrical characteristics of the transistor, the dimensions of the polysilicon layer must strictly satisfy the design rules defined by the foundry.

Typical polysilicon design rules include:

- Minimum width
- Minimum spacing
- Minimum overlap
- Enclosure requirements
- End-of-line spacing

Violating these rules can result in gate deformation, lithography failures, or unreliable transistor operation after fabrication.

To help designers understand these constraints, the Sky130 DRC test suite provides several example layouts illustrating both valid and invalid polysilicon geometries.

---

## Loading the Poly Example Layout

The predefined **poly** layout was opened inside Magic for DRC analysis.

```text
load poly
```

Magic loads the selected layout along with all associated design rule information from the Sky130 technology file.

> **Refer to Figure 5** for the loaded polysilicon layout in the Magic editor.

---

## Verifying Design Rule Violations

The Design Rule Check engine was executed using:

```text
drc why
```

Magic highlights any violating geometry and displays the corresponding design rule in the console window.

The highlighted regions indicate polygons that violate the minimum spacing or width constraints defined by the Sky130 Process Design Kit.

By selecting different regions of the layout, each violation can be individually inspected to understand why the geometry fails the fabrication rules.

> **Refer to Figures 6 and 7** for the highlighted DRC violations and the corresponding Magic console output.

---

# 4. Comparing Valid and Invalid Poly Structures

## Theory

The DRC example layouts contain both **legal** and **illegal** implementations of polysilicon structures.

Although two layouts may appear visually similar, even a very small dimensional difference can determine whether a layout satisfies the fabrication rules.

Magic evaluates each polygon using the geometric rules stored in the Sky130 technology file and immediately reports any violations.

This helps designers identify layout errors before fabrication, thereby improving manufacturing yield and reducing costly silicon re-spins.

---

## Poly Rule Verification

Different polysilicon test cells were examined individually to understand how Magic distinguishes between valid and invalid geometries.

The examples demonstrate that:

- Correct spacing satisfies all DRC constraints.
- Insufficient spacing produces immediate DRC violations.
- Small geometric modifications can completely change the DRC status of a layout.

These predefined examples provide an excellent understanding of how the fabrication rules are enforced during physical design.

> **Refer to Figures 8–10** for the comparison between valid and invalid polysilicon layouts and the corresponding DRC results.

---

## Key Observations

- Magic performs real-time Design Rule Checking.
- The Sky130 technology file contains all manufacturing constraints required for verification.
- Even minor violations in width or spacing are immediately detected.
- Predefined DRC examples simplify understanding of individual fabrication rules before designing custom layouts.

Loading a single example allows designers to understand one specific design rule without the complexity of the entire chip layout.

> **Refer to Figure 4** for the Magic console output showing the DRC command execution and loading of the `poly` layout.
