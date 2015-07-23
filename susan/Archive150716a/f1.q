begin_remark: coding RZ canonical subject criteria. 16/07/15: add cols 12-13 for nominal subjects only. 
end_remark
node: IP*
remove_nodes: t
nodes_only: t
ignore_nodes: \**|CODE|ID|'|\"|,|/|\.|FRAG|X|COMMENT|LB|BREAK|HL|LL|*PRN*|NEG|VOC

query: (CODING col 1 s)
      AND (CODING col 2 vf)
      AND (IP* idoms [1]argument)
      AND ([1]argument idoms [3]non-pronominal)
      AND (IP* idoms [2]argument)
      AND ([2]argument idoms [4]non-pronominal)
      AND (IP* idoms verb-f-all)
//      AND ([1]argument precedes verb-f-all)
//      AND ([2]argument precedes verb-f-all)
