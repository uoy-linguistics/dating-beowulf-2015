begin_remark: code clauses as V1 or vo (not v1)
end_remark
node: IP*
remove_nodes: t
nodes_only: t
print_complement: t
ignore_nodes: RMV:*|CODE|ID|'|\"|,|/|\.|FRAG|X|COMMENT|LB|BREAK|HL|LL|NEG

coding_query: 

1: {
   vo: (IP-MAT* idoms nom-arg)
       AND (nom-arg idomsonly PRO^N)
       AND (nom-arg precedes verb-f-all)
   v1: (IP-MAT* idoms verb-f-all)
       AND (verb-f-all iprecedes nom-arg)
       AND (nom-arg idomsonly PRO^N)
   1x: ELSE
}
