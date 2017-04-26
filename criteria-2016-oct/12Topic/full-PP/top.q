define: dating.def
node: IP-MAT|IP-MAT*-SPE|IP-MAT*-PRN|IP-MAT-#|IP-MAT*-SPE-#|IP-MAT*-PRN-#
add_to_ignore: \**|NEG|*CONJ|CP-ADV*
query:


// PP - SUBJ ... V

    (MAIN_CLAUSE idoms SUBJECT)
AND (SUBJECT idomsonly !PRO*|MAN*)
AND (MAIN_CLAUSE idoms FINITE_VERB)
AND (MAIN_CLAUSE idomsfirst PP)
AND (PP domswords< 6)
AND (PP domswords> 2)

AND (PP iprecedes SUBJECT)
AND (SUBJECT precedes FINITE_VERB)


OR     (MAIN_CLAUSE idoms SUBJECT)
AND (SUBJECT domswords> 1)
AND (MAIN_CLAUSE idoms FINITE_VERB)
AND (MAIN_CLAUSE idomsfirst PP)
AND (PP domswords< 6)
AND (PP domswords> 2)

AND (PP iprecedes SUBJECT)
AND (SUBJECT precedes FINITE_VERB)


// PP - V ... SUBJ

OR  (MAIN_CLAUSE idoms SUBJECT)
AND (SUBJECT idomsonly !PRO*|MAN*)
AND (MAIN_CLAUSE idoms FINITE_VERB)
AND (MAIN_CLAUSE idomsfirst PP)
AND (PP domswords< 6)
AND (PP domswords> 2)

AND (PP iprecedes FINITE_VERB)
AND (FINITE_VERB precedes SUBJECT)


OR     (MAIN_CLAUSE idoms SUBJECT)
AND (SUBJECT domswords> 1)
AND (MAIN_CLAUSE idoms FINITE_VERB)
AND (MAIN_CLAUSE idomsfirst PP)
AND (PP domswords< 6)
AND (PP domswords> 2)

AND (PP iprecedes FINITE_VERB)
AND (FINITE_VERB precedes SUBJECT)