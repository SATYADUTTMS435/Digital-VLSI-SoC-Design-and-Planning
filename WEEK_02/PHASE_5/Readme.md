# Phase 5 – Debugging and Unix Literacy

## Objective

The objective of this phase was to demonstrate proficiency with essential Unix/Linux commands and debugging techniques used while installing and executing the OpenROAD Flow Scripts (ORFS). These commands were used extensively throughout the local setup and RTL-to-GDS execution to inspect files, configure the environment, and troubleshoot toolchain issues.

---

# Unix Commands Used

| Command | Purpose | Evidence |
|---------|---------|----------|
| `pwd` | Display the current working directory | `files/pwd_ls_cd.png` |
| `ls` | List files and directories | `files/pwd_ls_cd.png` |
| `cd` | Navigate between directories | `files/pwd_ls_cd.png` |
| `find` | Locate files and directories | `files/find_files.png` |
| `grep` | Search text inside files and logs | `files/grep_makefile.png`, `files/log_search.png` |
| `cat` | Display file contents | `files/cat_install_openroad.png` |
| `less` | Inspect large configuration files | `files/less_dockerfile.png` |
| `echo` | Display environment variables | `files/environment_variables.png` |
| `export` | Configure environment variables | `files/environment_variables.png` |
| `which` | Locate installed executables | `files/tool_locations.png` |

---

# Debugging Activities

## 1. Directory Navigation

Commands such as `pwd`, `ls`, and `cd` were used to navigate between the repository root, ORFS flow directory, and output folders while executing and debugging the flow.

**Evidence:** `files/pwd_ls_cd.png`

---

## 2. Searching Repository Files

The `find` command was used to locate important scripts and configuration files, including the OpenROAD installation script, Dockerfile, and Makefile variables.

**Evidence:** `files/find_files.png`

---

## 3. Inspecting Makefiles

The `grep` command was used to inspect `variables.mk` and identify the paths configured for OpenROAD and Yosys executables.

**Evidence:** `files/grep_makefile.png`

---

## 4. Viewing Configuration Files

The OpenROAD installation script and Dockerfile were inspected using `cat` and `less` to understand the toolchain setup and installed software versions.

**Evidence:**

- `files/cat_install_openroad.png`
- `files/less_dockerfile.png`

---

## 5. Environment Variables

The `export` command was used to add the OSS CAD Suite binaries to the system `PATH`, while `echo` verified the updated environment variables.

**Evidence:** `files/environment_variables.png`

---

## 6. Log Inspection

Execution logs were searched using `grep` to inspect Clock Tree Synthesis (CTS) information and verify successful execution of different stages of the RTL-to-GDS flow.

**Evidence:** `files/log_search.png`

---

## 7. Tool Verification

The `which` command was used to verify the locations of the installed OpenROAD and Yosys executables.

**Evidence:** `files/tool_locations.png`

---

# Skills Demonstrated

- Linux terminal navigation
- File and directory management
- Searching files using `find`
- Inspecting Makefiles using `grep`
- Reading configuration files using `cat` and `less`
- Environment variable configuration
- Toolchain verification
- Log file analysis
- ORFS debugging and troubleshooting

---

# Outcome

This phase improved practical Unix/Linux proficiency and debugging skills required for ASIC implementation workflows. Using standard Linux utilities, the ORFS environment was successfully configured, verified, and debugged, enabling successful execution of the complete RTL-to-GDS flow on a local Ubuntu environment.
