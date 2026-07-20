# Phase 1: RTL-to-GDSII Flow using Sky130HD

## Objective

The objective of this phase was to execute the complete RTL-to-GDSII physical design flow using **OpenROAD Flow Scripts (ORFS)** with the **Sky130HD** technology platform and visualize the generated layout using **KLayout**.

---

## Platform

- Environment: GitHub Codespaces
- Flow: OpenROAD Flow Scripts (ORFS)
- Technology: Sky130HD
- Design: `gcd`

---

## Commands Executed

Navigate to the ORFS flow directory:

```bash
cd orfs/flow
```

Run the complete RTL-to-GDS flow:

```bash
make PLATFORM=sky130hd DESIGN=gcd
```

Open the generated GDS layout in KLayout:

```bash
make klayout_6_final.gds PLATFORM=sky130hd DESIGN=gcd
```

---

## Flow Stages Completed

The following stages were executed successfully:

- RTL Synthesis
- Floorplanning
- Power Distribution Network (PDN)
- Placement
- Clock Tree Synthesis (CTS)
- Global Routing
- Detailed Routing
- Fill Cell Insertion
- GDS Generation
- Final Reports

---

## Output Generated

Final GDS file:

```text
results/sky130hd/gcd/base/6_final.gds
```

---

## Result

The complete RTL-to-GDSII implementation was successfully completed using the **Sky130HD** platform. The generated **6_final.gds** file was opened in **KLayout**, confirming successful layout generation and visualization.

---

## Screenshots

### Environment Setup

<img width="1917" height="912" alt="tool_version" src="https://github.com/user-attachments/assets/c738eeee-a035-47e2-b210-d9f92ac90f84" />

### Successful RTL-to-GDS Flow

<img width="1917" height="871" alt="Screenshot 2026-07-20 132310" src="https://github.com/user-attachments/assets/9b1afa90-aca5-46ac-b12b-8c8e359e7851" />

### Final Layout in KLayout

<img width="1662" height="907" alt="Screenshot 2026-07-20 132731" src="https://github.com/user-attachments/assets/2a37d57e-e4b9-460b-8bc4-b0cfb45f533d" />

