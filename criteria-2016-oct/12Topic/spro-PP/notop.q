define: dating.def
node: IP-MAT|IP-MAT*-SPE|IP-MAT*-PRN|IP-MAT-#|IP-MAT*-SPE-#|IP-MAT*-PRN-#
add_to_ignore: \**|NEG|*CONJ|CP-ADV*
query:


// spro ... V ... PP

    (MAIN_CLAUSE idomsfirst SUBJECT)
AND (SUBJECT idomsonly PRO*|MAN*)
AND (MAIN_CLAUSE idoms FINITE_VERB)
AND (MAIN_CLAUSE idoms PP)
AND (PP domswords< 6)
AND (PP domswords> 2)

AND (SUBJECT precedes FINITE_VERB)
AND (FINITE_VERB precedes PP)

