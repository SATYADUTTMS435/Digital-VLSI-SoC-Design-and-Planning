# Phase 5 – Debugging and Unix Literacy

## Objective

The objective of this phase was to demonstrate familiarity with essential Linux commands, environment variables, and debugging techniques used while setting up and executing the OpenROAD Flow Scripts (ORFS) locally. During the installation and RTL-to-GDS execution, several Unix commands were used to inspect files, navigate directories, search logs, verify environment variables, and troubleshoot toolchain issues.

---

# Unix Commands Used

| Command | Purpose | Example Used |
|---------|---------|--------------|
| `pwd` | Display the current working directory | `pwd` |
| `ls` | List files and directories | `ls -la` |
| `cd` | Change directories | `cd orfs/flow` |
| `grep` | Search for specific text inside files | `grep -n "YOSYS_EXE" scripts/variables.mk` |
| `find` | Locate files and directories | `find . -name "install-openroad.sh"` |
| `cat` | Display file contents | `cat .devcontainer/install-openroad.sh` |
| `less` | View large files page by page | `less .devcontainer/Dockerfile` |
| `echo` | Display environment variable values | `echo $PATH` |
| `export` | Set environment variables | `export PATH=/opt/oss-cad-suite/bin:$PATH` |

---

# Debugging Activities

## Directory Navigation

Linux navigation commands were used extensively while switching between the repository root, ORFS flow directory, and tool installation locations.

**Evidence:** Refer to **`Phase-5/files/`** for terminal screenshots.

---

## Searching Files

The `find` command was used to locate installation scripts, binaries, and required files.

Example:

```bash
find . -name "install-openroad.sh"
```

**Evidence:** Refer to **`Phase-5/files/`**.

---

## Inspecting Makefiles

The `grep` command was used to inspect ORFS Makefiles and identify tool paths.

Example:

```bash
grep -n "YOSYS_EXE" scripts/variables.mk
```

This helped identify which Yosys executable was being used during synthesis.

**Evidence:** Refer to **`Phase-5/files/`**.

---

## Viewing Configuration Files

Configuration files and installation scripts were examined using `cat` and `less`.

Examples

```bash
cat .devcontainer/install-openroad.sh
```

```bash
less .devcontainer/Dockerfile
```

These files were used to understand the ORFS toolchain and identify the correct versions of OpenROAD, Yosys, and KLayout.

**Evidence:** Refer to **`Phase-5/files/`**.

---

## Environment Variables

The `export` command was used to configure the OSS CAD Suite binaries.

```bash
export PATH=/opt/oss-cad-suite/bin:$PATH
```

The PATH variable was verified using

```bash
echo $PATH
```

This ensured that the required executables were accessible during RTL-to-GDS execution.

**Evidence:** Refer to **`Phase-5/files/`**.

---

## Log Inspection

Execution logs were inspected to identify synthesis, placement, CTS, and routing errors during debugging.

Linux commands such as `grep`, `cat`, and `less` were used to efficiently search large log files.

**Evidence:** Refer to **`Phase-5/files/`**.

---

# Skills Demonstrated

- Linux terminal navigation
- File and directory management
- Searching configuration files
- Inspecting Makefiles
- Environment variable configuration
- Toolchain debugging
- Log file analysis
- ORFS troubleshooting

---

# Outcome

This phase strengthened practical Linux and debugging skills required for ASIC implementation workflows. By using Unix commands to inspect files, configure the environment, and resolve toolchain issues, the ORFS flow was successfully executed on the local Ubuntu environment.
