define: dating.def
node: IP-MAT|IP-MAT*-SPE|IP-MAT*-PRN|IP-MAT-#|IP-MAT*-SPE-#|IP-MAT*-PRN-#
add_to_ignore: \**
query:


// particles

    (MAIN_CLAUSE idomsfirst *CONJ)
AND (MAIN_CLAUSE idoms SUBJECT)
AND (MAIN_CLAUSE idoms FINITE_VERB)
AND (MAIN_CLAUSE idoms PARTICLE)
AND (PARTICLE iprecedes !PP*)
AND (MAIN_CLAUSE idoms !NONFINITE_VERB)

AND (SUBJECT precedes PARTICLE)
AND (PARTICLE precedes FINITE_VERB)


// stranded prepositions

OR  (MAIN_CLAUSE idomsfirst *CONJ)
AND (MAIN_CLAUSE idoms SUBJECT)
AND (MAIN_CLAUSE idoms FINITE_VERB)
AND (MAIN_CLAUSE idoms PP*)
AND (PP* idomsonly P)
AND (MAIN_CLAUSE idoms !NONFINITE_VERB)

AND (SUBJECT precedes PP*)
AND (PP* precedes FINITE_VERB)


// negative objects

OR  (MAIN_CLAUSE idomsfirst *CONJ)
AND (MAIN_CLAUSE idoms SUBJECT)
AND (MAIN_CLAUSE idoms OBJECT)
AND (OBJECT idomsmod QP* NEG+Q*)
AND (MAIN_CLAUSE idoms FINITE_VERB)
AND (MAIN_CLAUSE idoms !NONFINITE_VERB)

AND (SUBJECT precedes OBJECT)
AND (OBJECT precedes FINITE_VERB)


// negative adverbs

OR  (MAIN_CLAUSE idomsfirst *CONJ)
AND (MAIN_CLAUSE idoms SUBJECT)
AND (MAIN_CLAUSE idoms ADVP*)
AND (ADVP* idoms NEG+ADV*)
AND (MAIN_CLAUSE idoms FINITE_VERB)
AND (MAIN_CLAUSE idoms !NONFINITE_VERB)

AND (SUBJECT precedes ADVP*)
AND (ADVP* precedes FINITE_VERB)


// pronouns

OR  (MAIN_CLAUSE idomsfirst *CONJ)
AND (MAIN_CLAUSE idoms SUBJECT)
AND (MAIN_CLAUSE idoms OBJECT) 
AND (OBJECT idomsonly PRO*)
AND (MAIN_CLAUSE idoms FINITE_VERB)
AND (MAIN_CLAUSE idoms !NONFINITE_VERB)

AND (SUBJECT precedes OBJECT)
AND (OBJECT precedes FINITE_VERB)


// self

OR  (MAIN_CLAUSE idomsfirst *CONJ)
AND (MAIN_CLAUSE idoms SUBJECT)
AND (MAIN_CLAUSE idomsmod OBJECT ADJP*) 
AND (ADJP* idomsonly ADJ*)
AND (ADJ* idoms s*lf*|s*lu*|$s*lf*|$s*lu*)
AND (ADJ* idoms !s*lf*r|s*lu*r|$s*lf*r|$s*lu*r)
AND (MAIN_CLAUSE idoms FINITE_VERB)
AND (MAIN_CLAUSE idoms !NONFINITE_VERB)

AND (SUBJECT precedes ADJP*)
AND (ADJP* precedes FINITE_VERB)