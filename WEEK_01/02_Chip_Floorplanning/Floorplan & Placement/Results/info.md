# Results Directory

This directory contains the primary output files generated after the Floorplanning stage.

These files are used as inputs for the next stages of the Physical Design flow, such as Placement, Clock Tree Synthesis (CTS), and Routing.

## Files

### `picorv32a.def`

The DEF (Design Exchange Format) file stores the physical layout information generated during floorplanning.

It contains details such as:

- Die dimensions
- Core dimensions
- Placement rows
- Track information
- Pin locations
- Block boundaries

This file can be opened using Magic Layout Editor to visualize the generated floorplan.

---

### `picorv32a.pnl.v.txt`

This file contains the **Power Netlist** generated during the floorplanning stage.

It represents the design after power connections have been inserted and is used internally during later stages of the OpenLANE flow.

---

### `picorv32a.nl.v.txt`

This file contains the **Gate-Level Netlist** generated for the design.

It represents the synthesized digital circuit using standard cells from the SKY130 standard cell library and serves as one of the primary inputs for the physical design stages.

---

These files act as intermediate design artifacts that allow the OpenLANE flow to transition from logical synthesis to physical implementation.
