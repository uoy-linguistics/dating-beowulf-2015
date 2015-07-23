begin_remark: coding RZ canonical subject criteria. 16/07/15: add cols 12-13 for nominal subjects only. 
end_remark
node: IP*
remove_nodes: t
nodes_only: t
ignore_nodes: \**|CODE|ID|'|\"|,|/|\.|FRAG|X|COMMENT|LB|BREAK|HL|LL|*PRN*|NEG|VOC

query: 
(CODING col 1 s)
      AND (CODING col 2 vf)
      AND (IP* idoms argument)
      AND (IP* idoms PP*)
      AND (IP* idoms *)
      AND (IP* idoms verb-f-all)
      AND (argument precedes verb-f-all)
      AND (PP* precedes verb-f-all)
      AND (* precedes verb-f-all)
