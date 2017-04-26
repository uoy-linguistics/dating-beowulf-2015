define: dating.def
node: CP*
add_to_ignore: \**|NEG
query:


// I-final

// SUBJ - opro ... X ... vfin

    (CP* idoms C)
AND (CP* idoms IP-SUB*)
AND (IP-SUB* idoms SUBJECT)
AND (IP-SUB* idoms FINITE_VERB)
AND (IP-SUB* idoms OBJECT)
AND (OBJECT idomsonly PRO*)
AND (IP-SUB* idoms INTERVENER|NON_FINITE_VERB)

AND (SUBJECT iprecedes OBJECT)
AND (OBJECT precedes INTERVENER|NON_FINITE_VERB)
AND (INTERVENER|NON_FINITE_VERB precedes FINITE_VERB)


// opro - SUBJ ... X ... vfin

OR  (CP* idoms C)
AND (CP* idoms IP-SUB*)
AND (IP-SUB* idoms SUBJECT)
AND (IP-SUB* idoms FINITE_VERB)
AND (IP-SUB* idoms OBJECT)
AND (OBJECT idomsonly PRO*)
AND (IP-SUB* idoms INTERVENER|NON_FINITE_VERB)

AND (OBJECT iprecedes SUBJECT) 
AND (SUBJECT precedes INTERVENER|NON_FINITE_VERB)
AND (INTERVENER|NON_FINITE_VERB precedes FINITE_VERB)

