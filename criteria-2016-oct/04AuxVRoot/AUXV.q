define: dating.def
node: IP-MAT|IP-MAT*-SPE|IP-MAT*-PRN|IP-MAT-#|IP-MAT*-SPE-#|IP-MAT*-PRN-#
add_to_ignore: \**|NEG
query:
  
// SUBJ - vfin ... vnonfin

	(MAIN_CLAUSE idoms SUBJECT)
AND (MAIN_CLAUSE idoms FINITE_VERB)
AND (MAIN_CLAUSE idoms NONFINITE_VERB|IP-INF*)

AND (SUBJECT iprecedes FINITE_VERB)
AND (FINITE_VERB precedes NONFINITE_VERB|IP-INF*)

// SUBJ - opro - vfin ... vnonfin

OR  (MAIN_CLAUSE idoms SUBJECT)
AND (MAIN_CLAUSE idoms OBJECT)
AND (OBJECT idomsonly PRO*)
AND (MAIN_CLAUSE idoms FINITE_VERB)
AND (MAIN_CLAUSE idoms NONFINITE_VERB|IP-INF*)

AND (SUBJECT iprecedes OBJECT)
AND (OBJECT iprecedes FINITE_VERB)
AND (FINITE_VERB precedes NONFINITE_VERB|IP-INF*)



    
