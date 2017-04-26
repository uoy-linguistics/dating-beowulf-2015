define: dating.def
node: IP*
ignore_nodes:   null
query:



// neg-vfin + nor


    (IP* idoms NEG|FINITE_VERB_NEG)
AND (IP* idoms ADVP*)
AND (ADVP* idomsmod CONJP *CONJ)
AND (*CONJ idoms NORLEX)

OR  (IP* idoms NEG|FINITE_VERB_NEG)
AND (IP* idoms ADVP*)
AND (ADVP* idoms [1]CONJP*)
AND ([1]CONJP* idoms \*ICH*)
AND (IP* idoms [2]CONJP*)
AND ([2]CONJP* sameindex \*ICH*)
AND ([2]CONJP* idoms *CONJ)
AND (*CONJ idoms NORLEX)


