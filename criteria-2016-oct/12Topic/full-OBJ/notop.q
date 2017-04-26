define: dating.def
node: IP-MAT|IP-MAT*-SPE|IP-MAT*-PRN|IP-MAT-#|IP-MAT*-SPE-#|IP-MAT*-PRN-#
add_to_ignore: \**|NEG|*CONJ|CP-ADV*
query:


// SUBJ ... V ... OBJECT

    (MAIN_CLAUSE idomsfirst SUBJECT)
AND (SUBJECT idomsonly !PRO*|MAN*)
AND (MAIN_CLAUSE idoms FINITE_VERB)
AND (MAIN_CLAUSE idoms OBJECT)
AND (OBJECT domswords< 5)
AND (OBJECT domswords> 1)

AND (SUBJECT precedes FINITE_VERB)
AND (FINITE_VERB precedes OBJECT)



OR  (MAIN_CLAUSE idomsfirst SUBJECT)
AND (SUBJECT domswords> 1)
AND (MAIN_CLAUSE idoms FINITE_VERB)
AND (MAIN_CLAUSE idoms OBJECT)
AND (OBJECT domswords< 5)
AND (OBJECT domswords> 1)

AND (SUBJECT precedes FINITE_VERB)
AND (FINITE_VERB precedes OBJECT)