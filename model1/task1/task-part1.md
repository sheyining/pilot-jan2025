# Task 1, part 1

## Specification of Operation

The operation `AddNodeAfter[net0, net1, n0, n1]` constrains `net1` to be the state after adding node `n0` as the successor to node `n1` in `net0`.

For example, suppose `net0` consists of a ring network which has node `n1` and its successor `n1'`, arranged as follows:
```
... -> n1 -> n1' -> ...
```

If `AddNodeAfter[net0, net1, n0, n1]` holds, then in `net1`, `n0` should appear as the successor to `n1` and as the predecessor to `n1'`. State `net1` should be arranged as follows:
```
... -> n1 -> n0 -> n1' -> ...
```

**Please let the researchers know once you are ready to proceed. Do not proceed unless instructed.**

## Visualizing Specification Operation

You will soon see two diagrams. **Depending on the instruction given by the researchers**, please open the two files in either the folder `viz1` or the folder `viz2`. Please **do not open any other files** in the process.

**Once the two diagrams are opened, let us know.**

Please proceed to `task-part2.md` when instructed.