begin_remark: code clauses as v1 or vx1 (not v1). 21/07/15: clean up nom-args. 22/07/15: general clean-up. 27/07/15: cols 18 does not require adjacency; col 19 requires adjacency; col 20 requires adjacency but scrambled pronouns are permitted.
end_remark
define: beo.def
node: IP*
remove_nodes: t
nodes_only: t
print_complement: f
add_to_ignore: BREAK|HL|LL|NEG

define: susan.def

coding_query:

// adjacency not required
18: {
   18v1: (CODING col 1 m)
       AND (IP-MAT* idoms nom-arg-usable)
       AND (nom-arg-usable idomsonly PRO^N)
       AND (IP-MAT* idoms verb-f-all)
       AND (verb-f-all precedes nom-arg-usable)
   18vx1: (CODING col 1 m)
       AND (IP-MAT* idoms nom-arg-usable)
       AND (nom-arg-usable idomsonly PRO^N)
       AND (IP-MAT* idoms verb-f-all)
       AND (nom-arg-usable precedes verb-f-all)
   /: ELSE
}

// adjacency required
19: {
   19v1: (CODING col 1 m)
       AND (IP-MAT* idoms nom-arg-usable)
       AND (nom-arg-usable idomsonly PRO^N)
       AND (IP-MAT* idoms verb-f-all)
       AND (verb-f-all iprecedes nom-arg-usable)
   19vx1: (CODING col 1 m)
       AND (IP-MAT* idoms nom-arg-usable)
       AND (nom-arg-usable idomsonly PRO^N)
       AND (IP-MAT* idoms verb-f-all)
       AND (nom-arg-usable iprecedes verb-f-all)
   /: ELSE
}

// adjacency required but scrambled pronouns can intervene
20: {
   20v1: (CODING col 1 m)
       AND (IP-MAT* idoms nom-arg-usable)
       AND (nom-arg-usable idomsonly PRO^N)
       AND (IP-MAT* idoms verb-f-all)
       AND (verb-f-all iprecedes nom-arg-usable)
   20vx1a: (CODING col 1 m)
       AND (IP-MAT* idoms nom-arg-usable)
       AND (nom-arg-usable idomsonly PRO^N)
       AND (IP-MAT* idoms verb-f-all)
       AND (nom-arg-usable iprecedes verb-f-all)
   20vx1b: (CODING col 1 m)
       AND (IP-MAT* idoms nom-arg-usable)
       AND (nom-arg-usable idomsonly PRO^N)
       AND (IP-MAT* idoms verb-f-all)
       AND (IP* idoms obl-arg-usable)
       AND (obl-arg-usable idomsonly PRO|PRO^*)
       AND (nom-arg-usable iprecedes obl-arg-usable)
       AND (obl-arg-usable iprecedes verb-f-all)
   20vx1c: (CODING col 1 m)
       AND (IP-MAT* idoms nom-arg-usable)
       AND (nom-arg-usable idomsonly PRO^N)
       AND (IP-MAT* idoms verb-f-all)
       AND (IP* idoms [1]obl-arg-usable)
       AND ([1]obl-arg-usable idomsonly [2]PRO|PRO^*)
       AND (IP* idoms [3]obl-arg-usable)
       AND ([3]obl-arg-usable idomsonly [4]PRO|PRO^*)
       AND (nom-arg-usable iprecedes [1]obl-arg-usable)
       AND ([1]nom-arg-usable iprecedes [2]obl-arg-usable)
       AND ([2]obl-arg-usable iprecedes verb-f-all)
   /: ELSE
}
