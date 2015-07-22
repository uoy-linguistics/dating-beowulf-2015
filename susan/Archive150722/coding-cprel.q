begin_remark: get all relative clauses
end_remark
node: CP-REL*
remove_nodes: t
nodes_only: t
print_complement: f
ignore_nodes: RMV:*|CODE|ID|'|\"|,|/|\.|FRAG|X|COMMENT|LB|BREAK|HL|LL|\**

query: (CP-REL* exists)
