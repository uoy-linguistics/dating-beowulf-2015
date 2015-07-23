define: susan.def

node: IP*
remove_nodes: t
nodes_only: t
print_complement: t
ignore_nodes: RMV:*|CODE|ID|'|\"|,|/|\.|FRAG|X|COMMENT|LB|BREAK|HL|LL

query: ((IP* idoms v-nf-all) AND (v-nf-all idoms \*))
OR
((IP* idoms [1]v-nf-all) AND (IP* idoms [2]v-nf-all))
