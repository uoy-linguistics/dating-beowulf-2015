define: dating.def
node: IP-SUB*
add_to_ignore: \**|NEG
query:
  
// SUBJ - vfin ... vnonfin

	(IP-SUB* idoms SUBJECT)
AND (IP-SUB* idoms FINITE_VERB)
AND (IP-SUB* idoms NONFINITE_VERB|IP-INF*)

AND (SUBJECT iprecedes FINITE_VERB)
AND (FINITE_VERB precedes NONFINITE_VERB|IP-INF*)

// SUBJ - opro - vfin ... vnonfin

OR  (IP-SUB* idoms SUBJECT)
AND (IP-SUB* idoms OBJECT)
AND (OBJECT idomsonly PRO*)
AND (IP-SUB* idoms FINITE_VERB)
AND (IP-SUB* idoms NONFINITE_VERB|IP-INF*)

AND (SUBJECT iprecedes OBJECT)
AND (OBJECT iprecedes FINITE_VERB)
AND (FINITE_VERB precedes NONFINITE_VERB|IP-INF*)



    
