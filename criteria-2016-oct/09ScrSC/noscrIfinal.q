define: dating.def
node: CP*
add_to_ignore: \**|NEG
query:


// I-final

// SUBJ ... X ... opro ... vfin

    (CP* idoms C)
AND (CP* idoms IP-SUB*)
AND (IP-SUB* idoms SUBJECT)
AND (IP-SUB* idoms FINITE_VERB)
AND (IP-SUB* idoms OBJECT)
AND (OBJECT idomsonly PRO*)
AND (IP-SUB* idoms INTERVENER|NON_FINITE_VERB)

AND (SUBJECT precedes INTERVENER|NON_FINITE_VERB)
AND (INTERVENER|NON_FINITE_VERB precedes OBJECT)
AND (OBJECT precedes FINITE_VERB)


// SUBJ ... X ... PP[pro] ... vfin

OR  (CP* idoms C)
AND (CP* idoms IP-SUB*)
AND (IP-SUB* idoms SUBJECT)
AND (IP-SUB* idoms FINITE_VERB)
AND (IP-SUB* idoms PP)
AND (PP idoms NP*)
AND (NP* idomsonly PRO*)
AND (IP-SUB* idoms INTERVENER|NON_FINITE_VERB)

AND (SUBJECT precedes INTERVENER|NON_FINITE_VERB)
AND (INTERVENER|NON_FINITE_VERB precedes PP)
AND (PP precedes FINITE_VERB)




