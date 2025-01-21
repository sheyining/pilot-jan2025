# Task 6, part 1

## Specification of Operation

The operation `MergeWithSuccessor[net0, net1, n]` constrains `net1` to be the state after merging an existing node `n` with its successor in `net0`. It should:
* Remove the successor `n'` into `n`.
* Merge all the data associated with `n'` into `n`.

Suppose network state `net0` consits of a ring network arranged as follows:
```
nodes: ... -> n0 -> n1 -> n2 -> ...
              ↓     ↓     ↓
data:         d0    d1    d2
```

Then, running `MergeWithSuccessor[net0, net1, n0]` results in `net1` being arranged as follows:

```
nodes: ... -> n0 -> n2 -> ...
              ↓     ↓
data:         d0    d2
              d1
```

**Please let the researchers know once you are ready to proceed. Do not proceed unless instructed.**

## Visualizing Specification Operation

You will soon see two diagrams. **Depending on the instruction given by the researchers**, please open the two files in either the folder `viz1` or the folder `viz2`. Please **do not open any other files** in the process.

**Once the two diagrams are opened, let us know.**

Please proceed to `task-part2.md` when instructed.