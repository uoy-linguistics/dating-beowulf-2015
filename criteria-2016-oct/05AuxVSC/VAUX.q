define: dating.def
node: IP-SUB*
add_to_ignore: \**|NEG
query:
  
// SUBJ ... vnonfin ... vfin

	(IP-SUB* idoms SUBJECT)
AND (IP-SUB* idoms FINITE_VERB)
AND (IP-SUB* idoms NONFINITE_VERB|IP-INF*)

AND (SUBJECT precedes NONFINITE_VERB|IP-INF*)
AND (NONFINITE_VERB|IP-INF* precedes FINITE_VERB)


    
