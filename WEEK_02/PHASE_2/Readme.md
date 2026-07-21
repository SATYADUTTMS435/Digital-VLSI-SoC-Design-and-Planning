## Understanding the Dockerfile and install-openroad.sh

Before executing the ORFS flow, it is important to understand how the development environment is prepared. The **Dockerfile** and **install-openroad.sh** together create a ready-to-use environment for RTL-to-GDS implementation.

The **Dockerfile** acts as the blueprint for the development container. It starts with an Ubuntu 22.04 operating system and installs all the required software packages such as Git, Make, Python, Magic, NGSpice, Verilator, Icarus Verilog, KLayout, and the OSS CAD Suite (which includes Yosys). It also configures the Codespaces user, environment variables, and the graphical desktop (noVNC), ensuring that all the necessary tools are available before running the design flow.

The **install-openroad.sh** script is responsible for installing **OpenROAD**. Instead of compiling it from source, the script downloads a prebuilt OpenROAD package from the VSD server, extracts it, installs the executable into the system, configures the required shared libraries, creates a symbolic link so that the `openroad` command can be used from anywhere, and finally verifies the installation by displaying the OpenROAD version.

Together, these two files automate the setup process and provide a complete environment for executing the RTL-to-GDSII flow using OpenROAD Flow Scripts (ORFS).

---


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
