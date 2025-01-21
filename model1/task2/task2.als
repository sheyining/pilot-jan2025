// =======================
// STATIC STRUCTURE
// =======================

sig Network {
  all_nodes: set Node,
  all_data: set Data,
  succ: Node -> Node,
  node_data: Node -> Data
} {
  succ in all_nodes -> all_nodes
  node_data in all_nodes -> all_data
}

sig Node {}
sig Data {}

// =======================
// INVARIANTS
// =======================

pred Invariant [n: Network] {
  all d: n.all_data | some (n.node_data).d
  all node : n.all_nodes | one node.(n.succ) and one (n.succ).node
  all node : n.all_nodes | node in node.^(n.succ)
  all node1, node2: n.all_nodes | node1 in node2.^(n.succ)
}

// =======================
// BUGGY OPERATION
// =======================

pred RemoveNode [n0, n1: Network, node: Node] {
  node in n0.all_nodes
  n1.all_nodes = n0.all_nodes - node
  let nodeBefore = (n0.succ).node, nodeAfter = node.(n0.succ) |

  n1.succ = n0.succ + (nodeAfter -> nodeBefore) - (node -> univ) - (univ -> node)

  let associatedData = node.(n0.node_data) {
    n1.node_data = n0.node_data - (node -> associatedData)

    n1.all_data = { d: n0.all_data |
      d not in associatedData or (n1.node_data).d != none
    }
  }
}