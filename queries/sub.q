begin_remark: get all subordinate clauses, including IPX-SUBs, with subjects and finite verbs
end_remark
ignore_nodes: \**
node: CP*
remove_nodes: t
nodes_only: t
define: susan.def
query: (CP*|IP-SUB*|IPX-SUB*|CONJP idoms IP-SUB*|IPX-SUB*) AND (IP-SUB*|IPX-SUB* idoms verb-f-all)
  AND (IP-SUB*|IPX-SUB* idoms nom-arg-usable)
