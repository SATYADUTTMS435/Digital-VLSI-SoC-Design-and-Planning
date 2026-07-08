# Synthesis Reports

During synthesis, OpenLANE generates multiple report files to summarize different aspects of the synthesized design. Each report serves a specific purpose in validating, analyzing, and optimizing the design before proceeding to the physical implementation stages.

---

## 1. 1-synthesis.AREA_0.stat.rpt

### Purpose

This report provides the complete synthesis statistics of the design after logic synthesis.

### What does it contain?

- Total number of wires
- Number of wire bits
- Public wires
- Number of cells
- Standard cell distribution
- Gate statistics

### Why is it important?

This is one of the most important synthesis reports because it provides an overview of the synthesized netlist. Engineers use it to understand how the RTL has been mapped into standard cells and to estimate design complexity before floorplanning.

---

## 2. 1-synthesis.AREA_0.chk.rpt

### Purpose

This report performs structural design checks on the synthesized netlist.

### What does it contain?

- Design consistency checks
- Connection validation
- Structural warnings
- Potential synthesis issues

### Why is it important?

It helps identify problems that could prevent successful placement, routing, or timing analysis in later stages of the ASIC flow.

---

## 3. 1-synthesis_pre.stat

### Purpose

This report captures synthesis statistics before the optimization stage.

### What does it contain?

- Initial design statistics
- Logic summary
- Resource information before optimization

### Why is it important?

It provides a baseline for comparing how optimization affects the design in terms of area, gate count, and overall implementation quality.

---

## 4. 1-synthesis_dff.stat

### Purpose

This report summarizes all D Flip-Flops inferred during synthesis.

### What does it contain?

- Number of D Flip-Flops
- Sequential element statistics
- Register utilization

### Why is it important?

The number of flip-flops directly impacts chip area, power consumption, clock tree complexity, and timing performance. This report is also used for calculating the **Flip-Flop Ratio**, one of the required analyses in this workshop.

---

## 5. 1-synthesis_pre_synth.chk.rpt

### Purpose

This report performs design checks before the final synthesis process.

### What does it contain?

- RTL consistency checks
- Basic design verification
- Early structural validation

### Why is it important?

Detecting design issues before synthesis helps reduce debugging effort and ensures a smoother RTL-to-GDSII implementation flow.

---

## Summary

Each synthesis report focuses on a different aspect of the design. Together, they provide a comprehensive understanding of the synthesized netlist and help verify that the design is ready for the next stage of the ASIC implementation flow.
