# Task 1, part 1

## Specification of Operation

The operation `PassData[net0, net1]` constrains `net1` to be the network state after "passing" each node's data to its successor in `net0`. Formally, for each node `n` and its successor `n'`, the data associated with `n'` in `net1` should be the data associated with `n` in `net0`.

Suppose `net0` consists of a ring network arranged as follows:
```
nodes: ... -> n0 -> n1 -> n2 -> ...
              ↓     ↓     ↓
data:         d0    d1    d2
```

After running the operation `PassData[net0, net1]`, the network state `net1` should be arranged as follows:
```
nodes: ... -> n0 -> n1 -> n2 -> ...
              ↓     ↓     ↓
data:        ...    d0    d1
```

**Please let the researchers know once you are ready to proceed. Do not proceed unless instructed.**

## Visualizing Specification Operation

You will soon see two diagrams. **Depending on the instruction given by the researchers**, please open the two files in either the folder `viz1` or the folder `viz2`. Please **do not open any other files** in the process.

**Once the two diagrams are opened, let us know.**

Please proceed to `task-part2.md` when instructed.