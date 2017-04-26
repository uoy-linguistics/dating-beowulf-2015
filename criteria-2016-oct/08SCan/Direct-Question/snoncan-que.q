define: dating.def
node: CP-QUE*
add_to_ignore: \**|NEG|*CONJ|CP-ADV*
query:

 
// Q - V ... X ... full subject
// ADVP or PP or NONFIN intervene

// one-word subject

    (CP-QUE* idoms !C)
AND (CP-QUE* idoms IP-SUB*)
AND (IP-SUB* idoms SUBJECT)
AND (SUBJECT idomsonly !PRO*|MAN*)
AND (IP-SUB* idomsfirst FINITE_VERB)
AND (IP-SUB* idoms ADVP*|PP*|NONFINITE_VERB)  // ADVP can be there, which looks like an expletive

AND (FINITE_VERB precedes ADVP*|PP*|NONFINITE_VERB)
AND (ADVP*|PP*|NONFINITE_VERB precedes SUBJECT)

// subject with more than one word

OR  (CP-QUE* idoms !C)
AND (CP-QUE* idoms IP-SUB*)
AND (IP-SUB* idoms SUBJECT)
AND (SUBJECT domswords> 1)
AND (SUBJECT idoms !PRO*)   // to rule out "I myself" "they both" etc., which may be pronominal
AND (IP-SUB* idomsfirst FINITE_VERB)
AND (IP-SUB* idoms ADVP*|PP*|NONFINITE_VERB)  // ADVP can be there, which looks like an expletive

AND (FINITE_VERB precedes ADVP*|PP*|NONFINITE_VERB)
AND (ADVP*|PP*|NONFINITE_VERB precedes SUBJECT)



// non-pronominal NP intervenes

// one-word subject

OR  (CP-QUE* idoms !C)
AND (CP-QUE* idoms IP-SUB*)
AND (IP-SUB* idoms SUBJECT)
AND (SUBJECT idomsonly !PRO*|MAN*)
AND (IP-SUB* idomsfirst FINITE_VERB)
AND (IP-SUB* idoms NP*)
AND (NP* doms !PRO*)

AND (FINITE_VERB precedes NP*)
AND (NP* precedes SUBJECT)

// subject with more than one word

OR  (CP-QUE* idoms !C)
AND (CP-QUE* idoms IP-SUB*)
AND (IP-SUB* idoms SUBJECT)
AND (SUBJECT domswords> 1)
AND (SUBJECT idoms !PRO*)   // to rule out "I myself" "they both" etc., which may be pronominal
AND (IP-SUB* idomsfirst FINITE_VERB)
AND (IP-SUB* idoms NP*)
AND (NP* doms !PRO*)

AND (FINITE_VERB precedes NP*)
AND (NP* precedes SUBJECT)



