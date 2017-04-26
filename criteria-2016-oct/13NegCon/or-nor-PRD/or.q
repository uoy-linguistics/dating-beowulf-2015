define: dating.def
node: IP*
ignore_nodes:   null
query:



// neg-vfin + or

    (IP* idoms NEG|FINITE_VERB_NEG)
AND (IP* idoms *-PRD)
AND (*-PRD idomsmod CONJP *CONJ)
AND (*CONJ idoms ORLEX)



OR  (IP* idoms NEG|FINITE_VERB_NEG)
AND (IP* idoms *-PRD)
AND (*-PRD idoms [1]CONJP*)
AND ([1]CONJP* idoms \*ICH*)
AND (IP* idoms [2]CONJP*)
AND ([2]CONJP* sameindex \*ICH*)
AND ([2]CONJP* idoms *CONJ)
AND (*CONJ idoms ORLEX)