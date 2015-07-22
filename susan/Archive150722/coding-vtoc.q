begin_remark: get all main clauses with pronominal subjects and finite verbs
end_remark
node: IP*
remove_nodes: t
nodes_only: t
print_complement: f
ignore_nodes: RMV:*|CODE|ID|'|\"|,|/|\.|FRAG|X|COMMENT|LB|BREAK|HL|LL

query: (IP-MAT* idomsfirst !*CONJ)
AND (IP-MAT* idoms nom-arg) 
AND (nom-arg idomsonly PRO^N)
AND (IP-MAT* idoms verb-f-all)
