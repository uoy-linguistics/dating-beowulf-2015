begin_remark: pull out all subordinate clauses with finite verb and subject
end_remark
node: IP-SUB*|IPX-SUB*
ignore_nodes: \**
remove_nodes: t
nodes_only: t
define: susan.def
query: (IP-SUB*|IPX-SUB* idoms verb-f-all) AND (IP-SUB*|IPX-SUB* idoms nom-arg-usable)
