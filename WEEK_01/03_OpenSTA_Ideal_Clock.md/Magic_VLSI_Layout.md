# Magic VLSI Layout Editor

## Introduction

After completing the characterization of the CMOS inverter, the next step is to prepare the custom standard cell for integration into the OpenLane ASIC design flow. This requires editing the layout, defining ports, aligning the cell with routing tracks, generating a LEF file, and verifying the layout against the Sky130 design rules.

These tasks are performed using **Magic VLSI Layout Editor**, an open-source layout editor that supports custom IC design and physical verification.

---

# What is Magic VLSI?

**Magic VLSI** is an open-source layout editor developed for full-custom integrated circuit design. It is widely used in both academia and industry for creating, editing, and verifying integrated circuit layouts.

Unlike schematic editors that describe circuit connectivity, Magic represents the **physical geometry** of an integrated circuit using different fabrication layers such as diffusion, polysilicon, metal layers, contacts, and wells.

When used with the **Sky130 Process Design Kit (PDK)**, Magic understands the fabrication technology and automatically applies the corresponding manufacturing rules.

Magic supports several important physical design operations:

- Creating and editing transistor layouts
- Performing Design Rule Check (DRC)
- Extracting layouts into SPICE netlists
- Defining standard-cell ports
- Generating LEF files for automated Place and Route
- Viewing different fabrication layers
- Verifying manufacturability of layouts

Because of these capabilities, Magic plays an important role in transforming a custom transistor layout into a reusable standard cell compatible with modern ASIC design flows.



---

# Loading the Standard Cell Layout

The custom CMOS inverter layout is opened inside Magic using the Sky130 technology file.

```bash
magic -T sky130A.tech sky130_inv.mag &
```

The technology file provides Magic with:

- Layer definitions
- Connectivity information
- Extraction rules
- Display properties
- Design Rule Check (DRC) rules

After loading the layout, the standard cell becomes available for further editing and verification.



---

# Creating Standard Cell Ports

To make the inverter compatible with OpenLane, the external terminals must be defined as **ports**.

The required ports are:

- **A** – Input
- **Y** – Output
- **VPWR** – Power Supply
- **VGND** – Ground

Magic provides a **Text Helper** utility for creating labels. While creating each label, the **Port** option is enabled so that Magic recognizes the label as an external pin instead of ordinary text.

These ports later become the physical pins exported into the LEF file.



---

# Viewing and Configuring the Manufacturing Grid

To understand the available grid commands, Magic provides the following help command:

```tcl
help grid
```

The command displays the available grid options and the syntax required to configure grid spacing.

The manufacturing grid is then configured according to the routing pitch specified by the Sky130 standard-cell library.

Example:

```tcl
grid 0.46um 0.34um 0.23um 0.17um
```

The grid provides a visual reference that helps align pins, contacts, and routing geometries with the predefined routing tracks.

Proper alignment reduces routing conflicts and improves compatibility with automated place-and-route tools.



---

# Understanding Routing Tracks

The routing information used by OpenLane is stored in the **tracks.info** file.

This file specifies the routing pitch and offsets for different metal layers.

Typical entries include:

- Metal layer
- Preferred routing direction
- Track pitch
- Track offset

The routing grid defined in this file determines where automated routers are allowed to place interconnects.

All standard-cell pins should align with these routing tracks to ensure successful routing during physical implementation.



---

# Saving the Modified Layout

After completing the required modifications such as port creation and alignment, the updated layout is saved.

```tcl
save sky130_vsdinv.mag
```

The saved layout contains all newly created ports and is used for subsequent LEF generation and physical verification.



---

# Generating the LEF File

Once the layout satisfies the routing and port requirements, Magic generates the LEF file using:

```tcl
lef write
```

The generated LEF file contains an abstract description of the standard cell, including:

- Cell dimensions
- Pin locations
- Routing layers
- Placement information
- Routing blockages


# Design Rule Check (DRC) using Magic

## Introduction

Design Rule Check (DRC) is one of the most important verification stages in physical IC design. Every semiconductor foundry specifies a set of manufacturing rules that define the minimum allowable dimensions and spacing between different layout layers.

These rules ensure that the fabricated chip is manufacturable, reliable, and free from physical defects. Even if a circuit is logically correct, violating these rules can lead to fabrication failures or yield loss.

Magic VLSI Layout Editor performs DRC using the technology-specific rules defined in the **Sky130 Process Design Kit (PDK)**. As the layout is edited, Magic continuously checks the geometry and reports any rule violations.

---

# Downloading the DRC Test Suite

To understand different Sky130 design rules, the workshop provides a collection of predefined DRC test layouts.

The archive is downloaded using:

```bash
wget http://opencircuitdesign.com/open_pdks/archive/drc_tests.tgz
```

The downloaded archive is extracted using:

```bash
tar xfz drc_tests.tgz
```

The extracted directory is entered using:

```bash
cd drc_tests
```

Finally, all available Magic layout files are listed.

```bash
ls -al
```

These layouts intentionally contain both correct and incorrect geometries that demonstrate various DRC violations.



---

# Opening a Test Layout

Any test layout can be opened inside Magic for inspection.

For example:

```tcl
load poly
```

The layout is loaded using the Sky130 technology file so that Magic can evaluate it using the corresponding fabrication rules.

After loading the layout, different geometries are displayed, including examples that satisfy the design rules and others that intentionally violate them.



---

# Running Design Rule Check

Magic performs DRC using the following command:

```tcl
drc why
```

The command identifies the selected violation and displays the corresponding design rule in the Magic console.

If no violations are present, Magic reports that the selected geometry satisfies the manufacturing rules.

This allows designers to quickly identify the cause of each violation and modify the layout accordingly.



---

# Poly Width Rule Example

One of the demonstration layouts illustrates the minimum polysilicon width rule.

The layout contains multiple examples:

- Correct polysilicon geometry
- Incorrect polysilicon geometry

The incorrect example violates the minimum width requirement specified by the Sky130 design rules. Since the feature is narrower than the allowed value, Magic reports it as a DRC violation.

By comparing both layouts, it becomes clear how small geometric differences can determine whether a layout is manufacturable.



---

# Transistor Width Rule Example

Another demonstration shows the minimum transistor width requirement.

When the transistor diffusion width is smaller than the technology limit, Magic reports an error such as:

```
Transistor width < 0.42um
```

This violation indicates that the transistor channel does not satisfy the minimum manufacturable dimensions defined by the Sky130 PDK.

Maintaining the required transistor dimensions is essential for reliable fabrication and predictable electrical behavior.



---

# Understanding DRC Feedback

Magic provides immediate visual feedback whenever a rule is violated.

Typical DRC feedback includes:

- Highlighting the error region
- Displaying the violated rule
- Reporting the affected layers
- Showing the required minimum dimensions

This interactive verification enables designers to correct layout errors before fabrication, significantly reducing the likelihood of manufacturing failures.

---

# Learning Outcome

Through these DRC examples, the relationship between physical layout geometry and fabrication constraints becomes evident. Instead of simply memorizing design rules, the practical demonstrations show how each rule directly affects manufacturability.

Using Magic together with the Sky130 PDK allows designers to verify layouts, identify violations, understand the reason behind each error, and modify the layout until it fully complies with the foundry's manufacturing requirements.
Unlike the GDS layout, the LEF file does not contain transistor geometry. It is primarily used by automated place-and-route tools during the physical implementation stage.

> **Refer to Figure X** for successful LEF generation.

<img width="1696" height="907" alt="8" src="https://github.com/user-attachments/assets/3d88fc31-5a85-4b68-b8d3-48d850bf285e" />

<img width="1707" height="893" alt="10" src="https://github.com/user-attachments/assets/f9ef9fcf-5789-40bf-87d0-0ea350e1d3cf" />

<img width="1787" height="905" alt="11" src="https://github.com/user-attachments/assets/8205d3c2-1376-475f-8cc0-6ab5ca0f2aaa" />

<img width="1858" height="832" alt="12" src="https://github.com/user-attachments/assets/5237fb23-5eba-4f30-b800-46b2386d0795" />

<img width="1855" height="858" alt="13" src="https://github.com/user-attachments/assets/c27c3215-7e77-4869-a1e2-1887cb995d79" />

<img width="1681" height="903" alt="14" src="https://github.com/user-attachments/assets/62b2b769-077d-4f84-8caa-70e18deb63c5" />

<img width="1686" height="902" alt="15" src="https://github.com/user-attachments/assets/01967c63-8399-4a28-b9c8-fb478034c3a0" />

<img width="1872" height="902" alt="16" src="https://github.com/user-attachments/assets/1c75d373-1a64-4012-bae7-c1bb28b03a93" />

<img width="1687" height="902" alt="17" src="https://github.com/user-attachments/assets/0da69d05-760c-4894-a083-d1b6b8374eaa" />

<img width="1676" height="906" alt="18" src="https://github.com/user-attachments/assets/7d9c73a1-a2a7-4b2b-9996-c53cdd57dad2" />

<img width="1673" height="895" alt="19" src="https://github.com/user-attachments/assets/c1dff6a7-0992-4e3a-87d9-418bbc71b95b" />

<img width="1687" height="912" alt="20" src="https://github.com/user-attachments/assets/cc7cc7b0-bc25-4476-98d8-922f591ae081" />

<img width="1700" height="902" alt="21" src="https://github.com/user-attachments/assets/fd76c193-b165-4134-9ec7-983794bf015f" />

<img width="1665" height="900" alt="22" src="https://github.com/user-attachments/assets/7eb60b0d-d3f3-484c-81d2-df5cf66ca277" />

