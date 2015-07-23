begin_remark: get np tokens for RZ gen criterion
end_remark
node: NP*
remove_nodes: f
nodes_only: t
ignore_nodes: \**|CODE|ID|'|\"|,|/|\.|FRAG|X|COMMENT|LB|BREAK|HL|LL|*PRN*|NEG|VOC

query: (NP* idoms N|N^*|NR|NR^*)
       AND (NP* idoms NP-GEN*)

