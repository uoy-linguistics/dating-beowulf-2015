begin_remark: coding basics before RZ criteria
end_remark
node: IP*
remove_nodes: t
nodes_only: t
ignore_nodes: RMV:*|CODE|ID|'|\"|,|/|\.|FRAG|X|COMMENT|LB

coding_query: 

1: {
   c: (IP-MAT*|IPX-MAT* iDomsFirst *CONJ)
   c: (IP-MAT*|IPX-MAT* iDomsFirst BREAK) AND (IP-MAT*|IPX-MAT* iDomsNumber 2 *CONJ)
   m: (IP-MAT*|IPX-MAT* exists)
   s: (IP-SUB*|IPX-SUB* exists)
   1x: ELSE
}

2:  {
   aux2v: (IP* idoms verb-f-all) AND (IP* idoms [1]verb-nf-all) AND (IP* idoms [2]verb-nf-all)
   aux: (IP* idoms verb-f-all) AND (IP* idoms verb-nf-all) AND (verb-nf-all idoms \*)
   auxv: (IP* idoms verb-f-all) AND (IP* idoms verb-nf-all) AND (verb-f-all precedes verb-nf-all)
   vaux: (IP* idoms verb-f-all) AND (IP* idoms verb-nf-all) AND (verb-nf-all precedes verb-f-all)
   vf: (IP* idoms verb-f-all) AND (IP* idoms !verb-nf-all)
   2x: ELSE
}

