define: dating.def
node: IP*
add_to_ignore: \**
query:



// neg-vfin + aught

    (IP* idoms NEG|FINITE_VERB_NEG)
AND (IP* idoms OBJECT)
AND (OBJECT idomsfirst Q*)
AND (Q* idoms AUGHT)
