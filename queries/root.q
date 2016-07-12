begin_remark: get all root clauses, including IPX-MATs, with subjects and finite verbs
end_remark
node: IP-MAT*|IPX-MAT*
remove_nodes: t
nodes_only: t
ignore_nodes: \**
define: susan.def
query: (IP-MAT*|IPX-MAT* idoms verb-f-all) AND (IP-MAT*|IPX-MAT* idoms nom-arg-usable)
