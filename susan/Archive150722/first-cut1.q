begin_remark: eliminate clauses with empty verbs or 2 non-finite verbsx
end_remark
node: IP*
remove_nodes: t
nodes_only: t
print_complement: t
ignore_nodes: RMV:*|CODE|ID|'|\"|,|/|\.|FRAG|X|COMMENT|LB|BREAK|HL|LL

query: ((IP* idoms verb-nf-all) AND (verb-nf-all idoms \*))
OR
((IP* idoms [1]verb-nf-all) AND (IP* idoms [2]verb-nf-all))
