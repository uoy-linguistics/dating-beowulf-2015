node: CP*

define: ../queries/defs.def

ignore_nodes: \**|RMV:*|*VOC*|*LFD*|INTJ*|CODE|ID|'|\"|,|/|\.|FRAG|X|COMMENT|LB|CODING*|BREAK

coding_query:

8: {
    conj: IP* idomsfirst CONJ
    conj-s: IP* idoms NP-NOM* AND NP-NOM* idoms \*con*
    _: ELSE
}

30: {
    _: ELSE
}
