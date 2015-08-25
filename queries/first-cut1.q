define: susan.def

begin_remark: eliminate clauses with empty verbs or 2 non-finite verbs
end_remark
node: IP*
remove_nodes: t
nodes_only: t
print_complement: t
ignore_nodes: null

query: ((IP* idoms verb-nf-all) AND (verb-nf-all idoms \*))
OR
((IP* idoms [1]verb-nf-all) AND (IP* idoms [2]verb-nf-all))
