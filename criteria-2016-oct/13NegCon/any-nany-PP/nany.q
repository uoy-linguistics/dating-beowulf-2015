define: dating.def
node: IP*
add_to_ignore: \**
query:



// neg-vfin + nany

    (IP* idoms NEG|FINITE_VERB_NEG)
AND (IP* idomsmod [1]PP* [2]PP*)
AND ([2]PP* idoms NP*)
AND (NP* idomsfirst *Q*)
AND (*Q* idoms NANY)