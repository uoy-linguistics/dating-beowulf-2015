define: dating.def
node: IP*
add_to_ignore: \**
query:



// neg-vfin + ever

    (IP* idoms NEG|FINITE_VERB_NEG)
AND (IP* idoms ADVP*)
AND (ADVP* idoms ADV^T)
AND (ADV^T idoms EVER)