# Reports Directory

This directory contains the report files generated during the Floorplanning stage of the OpenLANE flow.

These reports provide numerical information about the generated floorplan, including the die dimensions and core dimensions. They are useful for verifying whether the floorplan has been created according to the specified configuration parameters.

## Files

### `initial_fp_die_area.rpt`

Contains the coordinates of the generated **Die Area**.

The report specifies the lower-left and upper-right coordinates of the die, which define the total physical dimensions of the fabricated chip.

Example:

```
0.0 0.0 1279.175 1289.895
```

This represents:

- Lower Left Corner : (0.0, 0.0)
- Upper Right Corner : (1279.175, 1289.895)

These coordinates determine the overall chip size generated during floorplanning.

---

### `initial_fp_core_area.rpt`

Contains the coordinates of the **Core Area**.

The core represents the region where standard cells will be placed during the placement stage.

Example:

```
5.52 10.88 1273.28 1278.40
```

This represents:

- Lower Left Corner : (5.52, 10.88)
- Upper Right Corner : (1273.28, 1278.40)

Since the core is smaller than the die, the remaining area is reserved for I/O cells, power structures, and chip boundary resources.

---

These reports help designers verify that the floorplan dimensions have been generated correctly before moving to Placement.
