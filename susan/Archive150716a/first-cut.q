begin_remark: get all clauses with overt subjects and finite verb
end_remark
node: IP*
remove_nodes: t
nodes_only: t
ignore_nodes: \**|RMV:*|CODE|ID|'|\"|,|/|\.|FRAG|X|COMMENT|LB|BREAK|HL|LL

query: (IP* idoms verb-f-all) 
  AND (IP* idoms nom-arg)
