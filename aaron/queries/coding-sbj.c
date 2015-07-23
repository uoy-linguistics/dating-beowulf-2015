begin_remark: coding RZ canonical subject criteria
end_remark
node: IP*
remove_nodes: t
nodes_only: t
ignore_nodes: \**|CODE|ID|'|\"|,|/|\.|FRAG|X|COMMENT|LB|BREAK|HL|LL|*PRN*|NEG|VOC

define: susan.def

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
