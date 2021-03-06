define: dating.def
node: IP-MAT|IP-MAT*-SPE|IP-MAT*-PRN|IP-MAT-#|IP-MAT*-SPE-#|IP-MAT*-PRN-#
add_to_ignore: \**|*CONJ|CP-ADV*
query:

 
// negation - V - full subject ... X
// ADVP or PP or NONFIN follows

// negatively contracted finite verb

// one-word subject

    (MAIN_CLAUSE idoms SUBJECT)
AND (SUBJECT idomsonly !PRO*|MAN*)
AND (MAIN_CLAUSE idomsfirst FINITE_VERB_NEG)
AND (MAIN_CLAUSE idoms ADVP*|PP*|NONFINITE_VERB)

AND (FINITE_VERB_NEG iprecedes SUBJECT)
AND (SUBJECT precedes ADVP*|PP*|NONFINITE_VERB)

// subject with more than one word

OR  (MAIN_CLAUSE idoms SUBJECT)
AND (SUBJECT domswords> 1)
AND (SUBJECT idoms !PRO*)   // to rule out "I myself" "they both" etc., which may be pronominal
AND (MAIN_CLAUSE idomsfirst FINITE_VERB_NEG)
AND (MAIN_CLAUSE idoms ADVP*|PP*|NONFINITE_VERB)

AND (FINITE_VERB_NEG iprecedes SUBJECT)
AND (SUBJECT precedes ADVP*|PP*|NONFINITE_VERB)



// non-pronominal NP follows

// one-word subject

OR  (MAIN_CLAUSE idoms SUBJECT)
AND (SUBJECT idomsonly !PRO*|MAN*)
AND (MAIN_CLAUSE idomsfirst FINITE_VERB_NEG)
AND (MAIN_CLAUSE idoms NP*)
AND (NP* doms !PRO*)

AND (FINITE_VERB_NEG iprecedes SUBJECT)
AND (SUBJECT precedes NP*)


// subject with more than one word

OR  (MAIN_CLAUSE idoms SUBJECT)
AND (SUBJECT domswords> 1)
AND (SUBJECT idoms !PRO*)   // to rule out "I myself" "they both" etc., which may be pronominal
AND (MAIN_CLAUSE idomsfirst FINITE_VERB_NEG)
AND (MAIN_CLAUSE idoms NP*)
AND (NP* doms !PRO*)

AND (FINITE_VERB_NEG iprecedes SUBJECT)
AND (SUBJECT precedes NP*)



// independent negation

// one-word subject

OR  (MAIN_CLAUSE idoms SUBJECT)
AND (SUBJECT idomsonly !PRO*|MAN*)
AND (MAIN_CLAUSE idomsfirst NEG)
AND (MAIN_CLAUSE idoms FINITE_VERB)
AND (MAIN_CLAUSE idoms ADVP*|PP*|NONFINITE_VERB)

AND (NEG iprecedes FINITE_VERB)
AND (FINITE_VERB iprecedes SUBJECT)
AND (SUBJECT precedes ADVP*|PP*|NONFINITE_VERB)

// subject with more than one word

OR  (MAIN_CLAUSE idoms SUBJECT)
AND (SUBJECT domswords> 1)
AND (SUBJECT idoms !PRO*)   // to rule out "I myself" "they both" etc., which may be pronominal
AND (MAIN_CLAUSE idomsfirst NEG)
AND (MAIN_CLAUSE idoms FINITE_VERB)
AND (MAIN_CLAUSE idoms ADVP*|PP*|NONFINITE_VERB)

AND (NEG iprecedes FINITE_VERB)
AND (FINITE_VERB iprecedes SUBJECT)
AND (SUBJECT precedes ADVP*|PP*|NONFINITE_VERB)



// non-pronominal NP follows

// one-word subject

OR  (MAIN_CLAUSE idoms SUBJECT)
AND (SUBJECT idomsonly !PRO*|MAN*)
AND (MAIN_CLAUSE idomsfirst NEG)
AND (MAIN_CLAUSE idoms FINITE_VERB)
AND (MAIN_CLAUSE idoms NP*)
AND (NP* doms !PRO*)

AND (NEG iprecedes FINITE_VERB)
AND (FINITE_VERB iprecedes SUBJECT)
AND (SUBJECT precedes NP*)


// subject with more than one word

OR  (MAIN_CLAUSE idoms SUBJECT)
AND (SUBJECT domswords> 1)
AND (SUBJECT idoms !PRO*)   // to rule out "I myself" "they both" etc., which may be pronominal
AND (MAIN_CLAUSE idomsfirst NEG)
AND (MAIN_CLAUSE idoms FINITE_VERB)
AND (MAIN_CLAUSE idoms NP*)
AND (NP* doms !PRO*)

AND (NEG iprecedes FINITE_VERB)
AND (FINITE_VERB iprecedes SUBJECT)
AND (SUBJECT precedes NP*)