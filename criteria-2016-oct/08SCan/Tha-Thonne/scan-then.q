define: dating.def
node: IP-MAT|IP-MAT*-SPE|IP-MAT*-PRN|IP-MAT-#|IP-MAT*-SPE-#|IP-MAT*-PRN-#
add_to_ignore: \**|NEG|*CONJ|CP-ADV*
query:

 
// then - V - full subject ... X
// ADVP or PP or NONFIN follows

// one-word subject

    (MAIN_CLAUSE idoms SUBJECT)
AND (SUBJECT idomsonly !PRO*|MAN*)
AND (MAIN_CLAUSE idoms FINITE_VERB)
AND (MAIN_CLAUSE idomsfirst ADVP*)
AND (ADVP* idoms ADV*)
AND (ADV* idoms THEN)
AND (MAIN_CLAUSE idoms ADVP*|PP*|NONFINITE_VERB)

AND (ADVP* iprecedes FINITE_VERB)
AND (FINITE_VERB iprecedes SUBJECT)
AND (SUBJECT precedes ADVP*|PP*|NONFINITE_VERB)

// subject with more than one word

OR  (MAIN_CLAUSE idoms SUBJECT)
AND (SUBJECT domswords> 1)
AND (SUBJECT idoms !PRO*)   // to rule out "I myself" "they both" etc., which may be pronominal
AND (MAIN_CLAUSE idoms FINITE_VERB)
AND (MAIN_CLAUSE idomsfirst ADVP*)
AND (ADVP* idoms ADV*)
AND (ADV* idoms THEN)
AND (MAIN_CLAUSE idoms ADVP*|PP*|NONFINITE_VERB)

AND (ADVP* iprecedes FINITE_VERB)
AND (FINITE_VERB iprecedes SUBJECT)
AND (SUBJECT precedes ADVP*|PP*|NONFINITE_VERB)



// non-pronominal NP follows

// one-word subject

OR  (MAIN_CLAUSE idoms SUBJECT)
AND (SUBJECT idomsonly !PRO*|MAN*)
AND (MAIN_CLAUSE idoms FINITE_VERB)
AND (MAIN_CLAUSE idomsfirst ADVP*)
AND (ADVP* idoms ADV*)
AND (ADV* idoms THEN)
AND (MAIN_CLAUSE idoms NP*)
AND (NP* doms !PRO*)

AND (ADVP* iprecedes FINITE_VERB)
AND (FINITE_VERB iprecedes SUBJECT)
AND (SUBJECT precedes NP*)


// subject with more than one word

OR  (MAIN_CLAUSE idoms SUBJECT)
AND (SUBJECT domswords> 1)
AND (SUBJECT idoms !PRO*)   // to rule out "I myself" "they both" etc., which may be pronominal
AND (MAIN_CLAUSE idoms FINITE_VERB)
AND (MAIN_CLAUSE idomsfirst ADVP*)
AND (ADVP* idoms ADV*)
AND (ADV* idoms THEN)
AND (MAIN_CLAUSE idoms NP*)
AND (NP* doms !PRO*)

AND (ADVP* iprecedes FINITE_VERB)
AND (FINITE_VERB iprecedes SUBJECT)
AND (SUBJECT precedes NP*)



