# Task 3, part 1

## Specification of Operation

The operation `RemoveNode[net0, net1, n0]` constrains `net1` to be the result of removing node `n0` from `net0`. It should delete every data `d` associated with `n0` from the network, unless `d` is also associated with a different node in `net0`.

For example, suppose `net0` looks like this:
```
nodes: ... -> n0 -> n1 -> n2 -> ...
              ↓     ↓     ↓
data:         d0    d1    d2
```

The operation `RemoveNode[net0, net1, n1]` removes node `n1` from the network. Then, `net1` should look like:

```
nodes: ... -> n0 -> n2 -> ...
              ↓     ↓
data:         d0    d2
```

**Please let the researchers know once you are ready to proceed. Do not proceed unless instructed.**

## Visualizing Specification Operation

You will soon see two diagrams. **Depending on the instruction given by the researchers**, please open the two files in either the folder `viz1` or the folder `viz2`. Please **do not open any other files** in the process.

**Once the two diagrams are opened, let us know.**

Please proceed to `task-part2.md` when instructed.