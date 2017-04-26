define: dating.def
node: IP-MAT|IP-MAT*-SPE|IP-MAT*-PRN|IP-MAT-#|IP-MAT*-SPE-#|IP-MAT*-PRN-#
add_to_ignore: \**|NEG|*CONJ|CP-ADV*
query:

 
// then - V - X - full subject
// ADVP or PP or NONFIN intervene

// one-word subject

    (MAIN_CLAUSE idoms SUBJECT)
AND (SUBJECT idomsonly !PRO*|MAN*)
AND (MAIN_CLAUSE idoms FINITE_VERB)
AND (MAIN_CLAUSE idomsfirst ADVP*)
AND (ADVP* idoms ADV*)
AND (ADV* idoms THEN)
AND (MAIN_CLAUSE idoms ADVP*|PP*|NONFINITE_VERB)  // ADVP can be there, which looks like an expletive

AND (ADVP* iprecedes FINITE_VERB)
AND (FINITE_VERB precedes ADVP*|PP*|NONFINITE_VERB)
AND (ADVP*|PP*|NONFINITE_VERB precedes SUBJECT)

// subject with more than one word

OR  (MAIN_CLAUSE idoms SUBJECT)
AND (SUBJECT domswords> 1)
AND (SUBJECT idoms !PRO*)   // to rule out "I myself" "they both" etc., which may be pronominal
AND (MAIN_CLAUSE idoms FINITE_VERB)
AND (MAIN_CLAUSE idomsfirst ADVP*)
AND (ADVP* idoms ADV*)
AND (ADV* idoms THEN)
AND (MAIN_CLAUSE idoms ADVP*|PP*|NONFINITE_VERB)  // ADVP can be there, which looks like an expletive

AND (ADVP* iprecedes FINITE_VERB)
AND (FINITE_VERB precedes ADVP*|PP*|NONFINITE_VERB)
AND (ADVP*|PP*|NONFINITE_VERB precedes SUBJECT)



// non-pronominal NP intervenes

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
AND (FINITE_VERB precedes NP*)
AND (NP* precedes SUBJECT)

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
AND (FINITE_VERB precedes NP*)
AND (NP* precedes SUBJECT)



