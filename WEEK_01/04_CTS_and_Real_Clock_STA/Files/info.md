# info.md

## `picorv32a.sdc`

The **SDC (Synopsys Design Constraints)** file defines the timing constraints for the `picorv32a` design. It specifies essential design parameters such as the clock period, clock port, input/output delays, and timing exceptions that guide Static Timing Analysis (STA). During synthesis and implementation, OpenLane uses this file to optimize the design so that it satisfies the required timing constraints.

---

## `sta_pre_sta.conf.output`

This file contains the configuration and output generated during the **pre-Static Timing Analysis (Pre-STA)** stage. It records the timing environment, libraries, constraints, and analysis settings used before physical implementation. The report helps verify that the correct timing models and constraints are applied, providing an early indication of the design's timing performance before placement, routing, and Clock Tree Synthesis.
