define: dating.def
node: IP*
add_to_ignore: \**
query:



// neg-vfin + naught

    (IP* idoms NEG|FINITE_VERB_NEG)
AND (IP* idoms OBJECT)
AND (OBJECT idomsfirst NEG+Q*)
AND (NEG+Q* idoms NAUGHT)
