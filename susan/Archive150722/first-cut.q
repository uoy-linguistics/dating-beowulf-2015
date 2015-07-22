begin_remark: get all clauses with overt subjects (20/07/15 moved or not) and finite verb. 21/07/15: clean up nom-args.
end_remark
node: IP*
remove_nodes: t
nodes_only: t
ignore_nodes: \**|RMV:*|CODE|ID|'|\"|,|/|\.|FRAG|X|COMMENT|LB|BREAK|HL|LL

query: (IP* idoms verb-f-all) 
  AND (IP* idoms nom-arg-usable)
