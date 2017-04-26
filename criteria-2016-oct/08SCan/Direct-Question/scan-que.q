define: dating.def
node: CP-QUE*
add_to_ignore: \**|NEG|*CONJ|CP-ADV*
query:

 
// Q - V - full subject ... X
// ADVP or PP or NONFIN follows

// one-word subject

    (CP-QUE* idoms !C)
AND (CP-QUE* idoms IP-SUB*)
AND (IP-SUB* idoms SUBJECT)
AND (SUBJECT idomsonly !PRO*|MAN*)
AND (IP-SUB* idomsfirst FINITE_VERB)
AND (IP-SUB* idoms ADVP*|PP*|NONFINITE_VERB)

AND (FINITE_VERB iprecedes SUBJECT)
AND (SUBJECT precedes ADVP*|PP*|NONFINITE_VERB)

// subject with more than one word

OR  (CP-QUE* idoms !C)
AND (CP-QUE* idoms IP-SUB*)
AND (IP-SUB* idoms SUBJECT)
AND (SUBJECT domswords> 1)
AND (SUBJECT idoms !PRO*)   // to rule out "I myself" "they both" etc., which may be pronominal
AND (IP-SUB* idomsfirst FINITE_VERB)
AND (IP-SUB* idoms ADVP*|PP*|NONFINITE_VERB)

AND (FINITE_VERB iprecedes SUBJECT)
AND (SUBJECT precedes ADVP*|PP*|NONFINITE_VERB)



// non-pronominal NP follows

// one-word subject

OR  (CP-QUE* idoms !C)
AND (CP-QUE* idoms IP-SUB*)
AND (IP-SUB* idoms SUBJECT)
AND (SUBJECT idomsonly !PRO*|MAN*)
AND (IP-SUB* idomsfirst FINITE_VERB)
AND (IP-SUB* idoms NP*)
AND (NP* doms !PRO*)

AND (FINITE_VERB iprecedes SUBJECT)
AND (SUBJECT precedes NP*)


// subject with more than one word

OR  (CP-QUE* idoms !C)
AND (CP-QUE* idoms IP-SUB*)
AND (IP-SUB* idoms SUBJECT)
AND (SUBJECT domswords> 1)
AND (SUBJECT idoms !PRO*)   // to rule out "I myself" "they both" etc., which may be pronominal
AND (IP-SUB* idomsfirst FINITE_VERB)
AND (IP-SUB* idoms NP*)
AND (NP* doms !PRO*)

AND (FINITE_VERB iprecedes SUBJECT)
AND (SUBJECT precedes NP*)



