define: dating.def
node: CP*
add_to_ignore: \**|NEG
query:


// particles

    (CP* idoms C)
AND (CP* idomsmod IP* IP-SUB*)
AND (IP-SUB* idoms SUBJECT)
AND (IP-SUB* idoms FINITE_VERB)
AND (IP-SUB* idoms PARTICLE)
AND (PARTICLE iprecedes !PP*)
AND (IP-SUB* idoms !NONFINITE_VERB)

AND (SUBJECT precedes PARTICLE)
AND (PARTICLE precedes FINITE_VERB)


// stranded prepositions

OR  (CP* idoms C)
AND (CP* idomsmod IP* IP-SUB*)
AND (IP-SUB* idoms SUBJECT)
AND (IP-SUB* idoms FINITE_VERB)
AND (IP-SUB* idoms PP*)
AND (PP* idomsonly P)
AND (IP-SUB* idoms !NONFINITE_VERB)

AND (SUBJECT precedes PP*)
AND (PP* precedes FINITE_VERB)


// negative objects

OR  (CP* idoms C)
AND (CP* idomsmod IP* IP-SUB*)
AND (IP-SUB* idoms SUBJECT)
AND (IP-SUB* idoms OBJECT)
AND (OBJECT idomsmod QP* NEG+Q*)
AND (IP-SUB* idoms FINITE_VERB)
AND (IP-SUB* idoms !NONFINITE_VERB)

AND (SUBJECT precedes OBJECT)
AND (OBJECT precedes FINITE_VERB)


// negative adverbs

OR  (CP* idoms C)
AND (CP* idomsmod IP* IP-SUB*)
AND (IP-SUB* idoms SUBJECT)
AND (IP-SUB* idoms ADVP*)
AND (ADVP* idoms NEG+ADV*)
AND (IP-SUB* idoms FINITE_VERB)
AND (IP-SUB* idoms !NONFINITE_VERB)

AND (SUBJECT precedes ADVP*)
AND (ADVP* precedes FINITE_VERB)


// pronouns

OR  (CP* idoms C)
AND (CP* idomsmod IP* IP-SUB*)
AND (IP-SUB* idoms SUBJECT)
AND (IP-SUB* idoms OBJECT) 
AND (OBJECT idomsonly PRO*)
AND (IP-SUB* idoms FINITE_VERB)
AND (IP-SUB* idoms !NONFINITE_VERB)

AND (SUBJECT precedes OBJECT)
AND (OBJECT precedes FINITE_VERB)


// self

OR  (CP* idoms C)
AND (CP* idomsmod IP* IP-SUB*)
AND (IP-SUB* idoms SUBJECT)
AND (IP-SUB* idomsmod OBJECT ADJP*) 
AND (ADJP* idomsonly ADJ*)
AND (ADJ* idoms s*lf*|s*lu*|$s*lf*|$s*lu*)
AND (ADJ* idoms !s*lf*r|s*lu*r|$s*lf*r|$s*lu*r)
AND (IP-SUB* idoms FINITE_VERB)
AND (IP-SUB* idoms !NONFINITE_VERB)

AND (SUBJECT precedes ADJP*)
AND (ADJP* precedes FINITE_VERB)