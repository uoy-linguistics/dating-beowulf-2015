begin_remark: code clauses as v1 or vx1 (not v1). 21/07/15: clean up nom-args. 22/07/15: general clean-up.
end_remark
node: IP*
remove_nodes: t
nodes_only: t
print_complement: f
add_to_ignore: BREAK|HL|LL|NEG

coding_query: 

18: {
   v1: (CODING col 1 m)
       AND (IP-MAT* idoms nom-arg-usable)
       AND (nom-arg-usable idomsonly PRO^N)
       AND (IP-MAT* idoms verb-f-all)
       AND (verb-f-all precedes nom-arg-usable)
   vx1: (CODING col 1 m)
       AND (IP-MAT* idoms nom-arg-usable)
       AND (nom-arg-usable idomsonly PRO^N)
       AND (IP-MAT* idoms verb-f-all)
       AND (nom-arg-usable precedes verb-f-all)
   /: ELSE
}
