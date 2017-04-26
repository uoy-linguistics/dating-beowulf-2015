define: dating.def
node: CP*
add_to_ignore: \**
query:



// particles

    (CP* idoms C)
AND (CP* idomsmod IP* IP-SUB*)
AND (IP-SUB* idoms SUBJECT)
AND (IP-SUB* idoms FINITE_VERB)
AND (IP-SUB* idoms PARTICLE)
AND (PARTICLE iprecedes !PP*)    
AND (IP-SUB* idoms !NONFINITE_VERB)

AND (SUBJECT precedes FINITE_VERB)
AND (FINITE_VERB precedes PARTICLE)


// stranded prepositions

OR  (CP* idoms C)
AND (CP* idomsmod IP* IP-SUB*)
AND (IP-SUB* idoms SUBJECT)
AND (IP-SUB* idoms FINITE_VERB)
AND (IP-SUB* idoms PP*)
AND (PP* idomsonly P)
AND (IP-SUB* idoms !NONFINITE_VERB)

AND (SUBJECT precedes FINITE_VERB)
AND (FINITE_VERB precedes PP*)


// negative objects

OR  (CP* idoms C)
AND (CP* idomsmod IP* IP-SUB*)
AND (IP-SUB* idoms SUBJECT)
AND (IP-SUB* idoms OBJECT)
AND (OBJECT idomsmod QP* NEG+Q*)
AND (IP-SUB* idoms FINITE_VERB)
AND (IP-SUB* idoms !NONFINITE_VERB)

AND (SUBJECT precedes FINITE_VERB)
AND (FINITE_VERB precedes OBJECT)


// negative adverbs 

OR  (CP* idoms C)
AND (CP* idomsmod IP* IP-SUB*)
AND (IP-SUB* idoms SUBJECT)
AND (IP-SUB* idoms ADVP*)
AND (ADVP* idoms NEG+ADV*)
AND (IP-SUB* idoms FINITE_VERB)
AND (IP-SUB* idoms !NONFINITE_VERB)

AND (SUBJECT precedes FINITE_VERB)
AND (FINITE_VERB precedes ADVP*)


// pronouns

OR  (CP* idoms C)
AND (CP* idomsmod IP* IP-SUB*)
AND (IP-SUB* idoms SUBJECT)
AND (IP-SUB* idoms OBJECT) 
AND (OBJECT idomsonly PRO*)
AND (IP-SUB* idoms FINITE_VERB)
AND (IP-SUB* idoms !NONFINITE_VERB)

AND (SUBJECT precedes FINITE_VERB)
AND (FINITE_VERB precedes OBJECT)


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

AND (SUBJECT precedes FINITE_VERB)
AND (FINITE_VERB precedes ADJP*)
