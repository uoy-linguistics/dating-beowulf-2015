begin_remark: coding RZ gen criterion
end_remark
node: $ROOT
remove_nodes: f
nodes_only: f
ignore_nodes: \**|INTJ*|CODE|ID|'|\"|,|/|\.|COMMENT|LB

coding_query: 

// GEN: position of genitive phrases with respect to the head noun

1: {
   1b: (NP* idoms N|N^*|NR|NR^*)
      AND (NP* idoms NP-GEN*)
      AND (NP-GEN* precedes N|N^*|NR|NR^*)
   1a: (NP* idoms N|N^*|NR|NR^*)
      AND (NP* idoms NP-GEN*)
      AND (N|N^*|NR|NR^* precedes NP-GEN*)
   1x: ELSE
}

