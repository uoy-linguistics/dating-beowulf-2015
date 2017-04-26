define: dating.def
node: IP*
add_to_ignore: \**
query:



// neg-vfin + one

    (IP* idoms NEG|FINITE_VERB_NEG)
AND (IP* idoms OBJECT)
AND (OBJECT idomsfirst NUM*)
AND (NUM* idoms ONE)