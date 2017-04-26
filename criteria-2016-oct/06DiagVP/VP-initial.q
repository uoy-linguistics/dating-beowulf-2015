define: dating.def
node: IP*
add_to_ignore: \**
query:



// particles

	(IP* idoms SUBJECT)
AND (IP* idoms FINITE_VERB)
AND (IP* idoms PARTICLE)   
AND (IP* idoms NONFINITE_VERB)

AND (FINITE_VERB precedes NONFINITE_VERB)
AND (NONFINITE_VERB precedes PARTICLE)


// stranded prepositions

OR  (IP* idoms SUBJECT)
AND (IP* idoms FINITE_VERB)
AND (IP* idoms PP*)
AND (PP* idomsonly P)
AND (IP* idoms NONFINITE_VERB)

AND (FINITE_VERB precedes NONFINITE_VERB)
AND (NONFINITE_VERB precedes PP*)


// negative objects

OR  (IP* idoms SUBJECT)
AND (IP* idoms OBJECT)
AND (OBJECT idomsmod QP* NEG+Q*)
AND (IP* idoms FINITE_VERB)
AND (IP* idoms NONFINITE_VERB)

AND (FINITE_VERB precedes NONFINITE_VERB)
AND (NONFINITE_VERB precedes OBJECT)


// negative adverbs 

OR  (IP* idoms SUBJECT)
AND (IP* idoms ADVP*)
AND (ADVP* idoms NEG+ADV*)
AND (IP* idoms FINITE_VERB)
AND (IP* idoms NONFINITE_VERB)

AND (FINITE_VERB precedes NONFINITE_VERB)
AND (NONFINITE_VERB precedes ADVP*)


// pronouns

OR  (IP* idoms SUBJECT)
AND (IP* idoms OBJECT) 
AND (OBJECT idomsonly PRO*)
AND (IP* idoms FINITE_VERB)
AND (IP* idoms NONFINITE_VERB)

AND (FINITE_VERB precedes NONFINITE_VERB)
AND (NONFINITE_VERB precedes OBJECT)


// self

OR  (IP* idoms SUBJECT)
AND (IP* idomsmod OBJECT ADJP*) 
AND (ADJP* idomsonly ADJ*)
AND (ADJ* idoms s*lf*|s*lu*|$s*lf*|$s*lu*)
AND (ADJ* idoms !s*lf*r|s*lu*r|$s*lf*r|$s*lu*r)
AND (IP* idoms FINITE_VERB)
AND (IP* idoms NONFINITE_VERB)

AND (FINITE_VERB precedes NONFINITE_VERB)
AND (NONFINITE_VERB precedes ADJP*)
