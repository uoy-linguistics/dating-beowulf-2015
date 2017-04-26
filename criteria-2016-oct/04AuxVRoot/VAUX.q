define: dating.def
node: IP-MAT|IP-MAT*-SPE|IP-MAT*-PRN|IP-MAT-#|IP-MAT*-SPE-#|IP-MAT*-PRN-#
add_to_ignore: \**|NEG
query:
  
// SUBJ ... vnonfin ... vfin

	(MAIN_CLAUSE idoms SUBJECT)
AND (MAIN_CLAUSE idoms FINITE_VERB)
AND (MAIN_CLAUSE idoms NONFINITE_VERB|IP-INF*)

AND (SUBJECT precedes NONFINITE_VERB|IP-INF*)
AND (NONFINITE_VERB|IP-INF* precedes FINITE_VERB)


    
