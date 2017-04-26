define: dating.def
node: IP*
add_to_ignore: \**
query:



// neg-vfin + never

    (IP* idoms NEG|FINITE_VERB_NEG)
AND (IP* idoms ADVP*)
AND (ADVP* idoms NEG+ADV^T)