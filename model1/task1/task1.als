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
  all data : n.all_data | some (n.node_data).data

  all node : n.all_nodes | one node.(n.succ) and one (n.succ).node
  all node : n.all_nodes | node in node.^(n.succ)
  all node1, node2: n.all_nodes | node1 in node2.^(n.succ)
}

// =======================
// BUGGY OPERATION
// =======================
pred AddNodeAfter [n0, n1: Network, node0: Node, node1: Node] {
  node0 not in n0.all_nodes
  node1 in n0.all_nodes

  n1.all_nodes = n0.all_nodes + node0
  n1.all_data = n0.all_data

  n1.succ = n0.succ - (node1 -> Node) + (node0 -> node1) + (node0 -> node1.(n0.succ))
  n1.node_data = n0.node_data
}
