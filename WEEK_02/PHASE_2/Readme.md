## Task 2.1 – Toolchain Mapping

| Tool | Installed From | Purpose in Flow | Stage Used |
|------|----------------|-----------------|------------|
| OpenROAD | Downloaded as a prebuilt binary from VSD DigitalOcean storage (`install-openroad.sh`) | Performs physical design tasks such as floorplanning, placement, CTS, routing, DRC, and GDS generation | Physical Design |
| Yosys | OSS CAD Suite (GitHub binary release) | Synthesizes RTL Verilog into a gate-level netlist | Synthesis |
| TritonCTS | Included within OpenROAD | Builds and optimizes the Clock Tree | Clock Tree Synthesis (CTS) |
| FastRoute | Included within OpenROAD | Performs global routing of signal nets | Routing |
| OpenSTA | Included within OpenROAD | Performs Static Timing Analysis (STA) | Timing Analysis |
| KLayout | Official Debian package (`klayout.deb`) | Opens and visualizes the final GDSII layout | Layout Verification |
| Python 3 | Ubuntu APT Package | Executes automation scripts, report generation, and helper utilities | Entire Flow |
| Make | Ubuntu APT Package | Executes ORFS Makefiles and automates the RTL-to-GDS flow | Entire Flow |
| Git | Ubuntu APT Package | Repository cloning and version control | Entire Project |
