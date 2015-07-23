begin_remark: coding RZ canonical subject criteria. 16/07/15: add cols 12-13 for nominal subjects only. 
end_remark
node: IP*
remove_nodes: t
nodes_only: t
ignore_nodes: \**|CODE|ID|'|\"|,|/|\.|FRAG|X|COMMENT|LB|BREAK|HL|LL|*PRN*|NEG|VOC

coding_query: 

// SBJ - position of subject in subordinate clauses, canonical or otherwise
// CODING is the first node of the clause, so we're looking from the 2nd node on

// '10c' indicates canonical (immediately after the complementizer), '10n' non-canonical 
// position (anywhere else)
10: {
   10c: (CODING col 1 s)
      AND (CODING col 2 vf|auxv|vaux)
      AND (IP* idomsnumber 2 nom-arg)
   10n: (CODING col 1 s)
      AND (CODING col 2 vf|auxv|vaux)
      AND (IP* idoms nom-arg)
   /: ELSE
}

// '11c1' indicates canonical subject position; '11c2|3|4' indicates canonical except for 
// 1-3 scrambled pronouns, '11n' indicates non-canonical
11: {
   11c1: (CODING col 1 s)
      AND (CODING col 2 vf|auxv|vaux)
      AND (IP* idomsnumber 2 nom-arg)
   11c2: (CODING col 1 s)
      AND (CODING col 2 vf|auxv|vaux)
      AND (IP* idoms nom-arg)
      AND (IP* idomsnumber 2 *)
      AND (* idomsonly PRO|PRO^*)
      AND (* iprecedes nom-arg)
   11c3: (CODING col 1 s)
      AND (CODING col 2 vf|auxv|vaux)
      AND (IP* idoms nom-arg)
      AND (IP* idomsnumber 2 [1]*)
      AND ([1]* idomsonly [2]PRO|PRO^*)
      AND (IP* idomsnumber 3 [3]*)
      AND ([3]* idomsonly [4]PRO|PRO^*)
      AND ([3]* iprecedes nom-arg)
   11c4: (CODING col 1 s)
      AND (CODING col 2 vf|auxv|vaux)
      AND (IP* idoms nom-arg)
      AND (IP* idomsnumber 2 [1]*)
      AND ([1]* idomsonly [2]PRO|PRO^*)
      AND (IP* idomsnumber 3 [3]*)
      AND ([3]* idomsonly [4]PRO|PRO^*)
      AND (IP* idomsnumber 4 [5]*)
      AND ([5]* idomsonly [6]PRO|PRO^*)
      AND ([5]* iprecedes nom-arg)
   11n: (CODING col 1 s)
      AND (CODING col 2 vf|auxv|vaux)
      AND (IP* idoms nom-arg)
   /: ELSE
}

// 12-13: nominal subjects only
// '12c' indicates canonical (immediately after the complementizer), '12n' non-canonical 
// position (anywhere else)
12: {
   12c: (CODING col 1 s)
      AND (CODING col 2 vf|auxv|vaux)
      AND (IP* idomsnumber 2 nom-arg)
      AND (nom-arg idoms non-pronominal)
   12n: (CODING col 1 s)
      AND (CODING col 2 vf|auxv|vaux)
      AND (IP* idoms nom-arg)
      AND (nom-arg idoms non-pronominal)
   /: ELSE
}

// '13c1' indicates canonical subject position; '13c2|3|4' indicates canonical except for 
// 1-3 scrambled pronouns, '13n' indicates non-canonical
13: {
   13c1: (CODING col 1 s)
      AND (CODING col 2 vf|auxv|vaux)
      AND (IP* idomsnumber 2 nom-arg)
      AND (nom-arg idoms non-pronominal)
   13c2: (CODING col 1 s)
      AND (CODING col 2 vf|auxv|vaux)
      AND (IP* idoms nom-arg)
      AND (nom-arg idoms non-pronominal)
      AND (IP* idomsnumber 2 *)
      AND (* idomsonly PRO|PRO^*)
      AND (* iprecedes nom-arg)
   13c3: (CODING col 1 s)
      AND (CODING col 2 vf|auxv|vaux)
      AND (IP* idoms nom-arg)
      AND (nom-arg idoms non-pronominal)
      AND (IP* idomsnumber 2 [1]*)
      AND ([1]* idomsonly [2]PRO|PRO^*)
      AND (IP* idomsnumber 3 [3]*)
      AND ([3]* idomsonly [4]PRO|PRO^*)
      AND ([3]* iprecedes nom-arg)
   13c4: (CODING col 1 s)
      AND (CODING col 2 vf|auxv|vaux)
      AND (IP* idoms nom-arg)
      AND (nom-arg idoms non-pronominal)
      AND (IP* idomsnumber 2 [1]*)
      AND ([1]* idomsonly [2]PRO|PRO^*)
      AND (IP* idomsnumber 3 [3]*)
      AND ([3]* idomsonly [4]PRO|PRO^*)
      AND (IP* idomsnumber 4 [5]*)
      AND ([5]* idomsonly [6]PRO|PRO^*)
      AND ([5]* iprecedes nom-arg)
   13n: (CODING col 1 s)
      AND (CODING col 2 vf|auxv|vaux)
      AND (IP* idoms nom-arg)
      AND (nom-arg idoms non-pronominal)
   /: ELSE
}

// 14-15 Pronominal and nominal subjects, head-initial IPs only

// '14c' indicates canonical (immediately after the complementizer), '14n' non-canonical 
// position (anywhere else)
14: {
    f1: (CODING col 1 s)
      AND (CODING col 2 vf)
      AND (IP* idoms [1]argument-unmoved)
      AND ([1]argument-unmoved idoms [3]non-pronominal)
      AND (IP* idoms [2]argument-unmoved)
      AND ([2]argument-unmoved idoms [4]non-pronominal)
      AND (IP* idoms verb-f-all)
      AND ([1]argument-unmoved precedes verb-f-all)
      AND ([2]argument-unmoved precedes verb-f-all)
    f2: (CODING col 1 s) AND (CODING col 2 vaux)
    f3: (CODING col 1 s)
      AND (CODING col 2 vf)
      AND (IP* idoms argument-unmoved)
      AND (IP* idoms PP*)
      AND (IP* idoms non-arg-nodes)
      AND (IP* idoms verb-f-all)
      AND (argument-unmoved precedes verb-f-all)
      AND (PP* precedes verb-f-all)
      AND (non-arg-nodes precedes verb-f-all)
    f4: (CODING col 1 s)
      AND (CODING col 2 vf)
      AND (IP* idoms argument-unmoved)
      AND (IP* idoms ADJP*)
      AND (IP* idoms verb-f-all)
      AND (argument-unmoved precedes verb-f-all)
      AND (ADJP* precedes verb-f-all)
    f5: (CODING col 1 s)
      AND (CODING col 2 vf)
      AND (IP* idoms argument-unmoved)
      AND (IP* idoms RP)
      AND (IP* idoms verb-f-all)
      AND (argument-unmoved precedes verb-f-all)
      AND (RP precedes verb-f-all)
      AND (RP iprecedes !PP*)
    f6: (CODING col 1 s)
      AND (CODING col 2 vf)
      AND (IP* idoms argument-unmoved)
      AND (IP* idoms PP*)
      AND (PP* idomsonly P)
      AND (IP* idoms verb-f-all)
      AND (argument-unmoved precedes verb-f-all)
      AND (PP* precedes verb-f-all)
    f7: (CODING col 1 s)
      AND (CODING col 2 vf)
      AND (IP* idoms argument-unmoved)
      AND (IP* idoms verb-f-all)
      AND (IP* idoms [1]argument-unmoved|PP*|non-arg-nodes)
      AND ([1]argument-unmoved|PP*|non-arg-nodes idoms [4]non-pronominal)
      AND (IP* idoms [2]argument-unmoved|PP*|non-arg-nodes)
      AND ([2]argument-unmoved|PP*|non-arg-nodes idoms [5]non-pronominal)
      AND (IP* idoms [3]argument-unmoved|PP*|non-arg-nodes)
      AND ([3]argument-unmoved|PP*|non-arg-nodes idoms [6]non-pronominal)
      AND (argument-unmoved precedes verb-f-all)
      AND ([1]argument-unmoved|PP*|non-arg-nodes precedes verb-f-all)
      AND ([2]argument-unmoved|PP*|non-arg-nodes precedes verb-f-all)
      AND ([3]argument-unmoved|PP*|non-arg-nodes precedes verb-f-all)
   14c: (CODING col 1 s)
      AND (CODING col 2 vf|auxv|vaux)
      AND (IP* idomsnumber 2 nom-arg)
   14n: (CODING col 1 s)
      AND (CODING col 2 vf|auxv|vaux)
      AND (IP* idoms nom-arg)
   /: ELSE
}

// '15c1' indicates canonical subject position; '15c2|3|4' indicates canonical except for 
// 1-3 scrambled pronouns, '15n' indicates non-canonical
15: {
   15c1: (CODING col 1 s)
      AND (CODING col 2 vf|auxv|vaux)
      AND (IP* idomsnumber 2 nom-arg)
   15c2: (CODING col 1 s)
      AND (CODING col 2 vf|auxv|vaux)
      AND (IP* idoms nom-arg)
      AND (IP* idomsnumber 2 *)
      AND (* idomsonly PRO|PRO^*)
      AND (* iprecedes nom-arg)
   15c3: (CODING col 1 s)
      AND (CODING col 2 vf|auxv|vaux)
      AND (IP* idoms nom-arg)
      AND (IP* idomsnumber 2 [1]*)
      AND ([1]* idomsonly [2]PRO|PRO^*)
      AND (IP* idomsnumber 3 [3]*)
      AND ([3]* idomsonly [4]PRO|PRO^*)
      AND ([3]* iprecedes nom-arg)
   15c4: (CODING col 1 s)
      AND (CODING col 2 vf|auxv|vaux)
      AND (IP* idoms nom-arg)
      AND (IP* idomsnumber 2 [1]*)
      AND ([1]* idomsonly [2]PRO|PRO^*)
      AND (IP* idomsnumber 3 [3]*)
      AND ([3]* idomsonly [4]PRO|PRO^*)
      AND (IP* idomsnumber 4 [5]*)
      AND ([5]* idomsonly [6]PRO|PRO^*)
      AND ([5]* iprecedes nom-arg)
   15n: (CODING col 1 s)
      AND (CODING col 2 vf|auxv|vaux)
      AND (IP* idoms nom-arg)
   /: ELSE
}

