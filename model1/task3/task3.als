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
  all node : n.all_nodes | one node.(n.succ) and one (n.succ).node
  all node : n.all_nodes | node in node.^(n.succ)
  all node1, node2: n.all_nodes | node1 in node2.^(n.succ)
}

// =======================
// BUGGY OPERATION
// =======================
pred RemoveNode [net0, net1: Network, node: Node] {
  node in net0.all_nodes
  net1.all_nodes = net0.all_nodes - node
  let nodeBefore = (net0.succ).node, nodeAfter = node.(net0.succ) |
  net1.succ = net0.succ  + (nodeBefore -> nodeAfter) - (node -> univ) - (univ -> node)

  let associatedData = node.(net0.node_data) {
    net1.node_data = net0.node_data - (univ -> associatedData)
    net1.all_data = net0.all_data - associatedData
  }
}
