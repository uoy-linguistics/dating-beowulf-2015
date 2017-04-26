define: dating.def
node: IP-MAT|IP-MAT*-SPE|IP-MAT*-PRN|IP-MAT-#|IP-MAT*-SPE-#|IP-MAT*-PRN-#
add_to_ignore: \**|NEG|*CONJ|CP-ADV*
query:


// PP - spro ... V

    (MAIN_CLAUSE idoms SUBJECT)
AND (SUBJECT idomsonly PRO*|MAN*)
AND (MAIN_CLAUSE idoms FINITE_VERB)
AND (MAIN_CLAUSE idomsfirst PP)
AND (PP domswords< 6)
AND (PP domswords> 2)

AND (PP iprecedes SUBJECT)
AND (SUBJECT precedes FINITE_VERB)


