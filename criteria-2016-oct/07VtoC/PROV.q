define: dating.def
node: IP-MAT|IP-MAT*-SPE|IP-MAT*-PRN|IP-MAT-#|IP-MAT*-SPE-#|IP-MAT*-PRN-#
add_to_ignore: \**|NEG
query:



 (MAIN_CLAUSE idomsfirst !*CONJ)
AND (MAIN_CLAUSE idoms SUBJECT)
AND (SUBJECT idomsonly PRO*)
AND (MAIN_CLAUSE idoms FINITE_VERB)

AND (SUBJECT precedes FINITE_VERB) 



