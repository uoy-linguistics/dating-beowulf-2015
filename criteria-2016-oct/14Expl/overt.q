define: dating.def
node: IP*
ignore_nodes:  null
nodes_only: t
query:

// overt expletives with lexical verbs

// pronoun expletive

    (IP* idoms NP-NOM-x)
AND (NP-NOM-x* doms !\*exp*)
AND (IP* idoms !NP|NP-ACC|NP-DAT|NP-GEN|NP*-RSP)
AND (IP* idoms CP-*-x)
AND (IP* idoms *VBP*|*VBD*)

OR (IP* idoms NP-NOM-x)
AND (NP-NOM-x* doms !\*exp*)
AND (IP* idoms !NP|NP-ACC|NP-DAT|NP-GEN|NP*-RSP)
AND (IP* idoms CP-*-x)
AND (IP* idoms *MD*)
AND (IP* idoms *VB*)

OR (IP* idoms NP-NOM-x)
AND (NP-NOM-x* doms !\*exp*)
AND (IP* idoms !NP|NP-ACC|NP-DAT|NP-GEN|NP*-RSP)
AND (IP* idoms CP-*-x)
AND (IP* idoms *BE*)
AND (IP* idoms *VAG*)

OR (IP* idoms NP-NOM-x)
AND (NP-NOM-x* doms !\*exp*)
AND (IP* idoms !NP|NP-ACC|NP-DAT|NP-GEN|NP*-RSP)
AND (IP* idoms CP-*-x)
AND (IP* idoms *HV*)
AND (IP* idoms *VBN*)

OR   (IP* idoms NP-NOM-x)
AND (NP-NOM-x* doms !\*exp*)
AND (IP* idoms !NP|NP-ACC|NP-DAT|NP-GEN|NP*-RSP)
AND (IP* idoms CP-*-x)
AND (IP* idoms *BE*)
AND (IP* idoms *VBN*)

// demonstrative expletive


OR  (IP* idoms NP-NOM)
AND (NP-NOM idoms D*)
AND (NP-NOM idoms [1]CP*-THT*|CP*-QUE*|CP*-PRN)
AND (D* iprecedes [1]CP*-THT*|CP*-QUE*|CP*-PRN)
AND ([1]CP*-THT*|CP*-QUE*|CP*-PRN idoms \*ICH*)
AND (IP* idoms !NP|NP-ACC|NP-DAT|NP-GEN|NP*-RSP)
AND (IP* idoms [2]CP*)
AND ([2]CP* sameindex \*ICH*)
AND (IP* idoms *VBP*|*VBD*)

OR (IP* idoms NP-NOM)
AND (NP-NOM idoms D*)
AND (NP-NOM idoms [1]CP*-THT*|CP*-QUE*|CP*-PRN)
AND (D* iprecedes [1]CP*-THT*|CP*-QUE*|CP*-PRN)
AND ([1]CP*-THT*|CP*-QUE*|CP*-PRN idoms \*ICH*)
AND (IP* idoms !NP|NP-ACC|NP-DAT|NP-GEN|NP*-RSP)
AND (IP* idoms [2]CP*)
AND ([2]CP* sameindex \*ICH*)
AND (IP* idoms *MD*)
AND (IP* idoms *VB*)

OR (IP* idoms NP-NOM)
AND (NP-NOM idoms D*)
AND (NP-NOM idoms [1]CP*-THT*|CP*-QUE*|CP*-PRN)
AND (D* iprecedes [1]CP*-THT*|CP*-QUE*|CP*-PRN)
AND ([1]CP*-THT*|CP*-QUE*|CP*-PRN idoms \*ICH*)
AND (IP* idoms !NP|NP-ACC|NP-DAT|NP-GEN|NP*-RSP)
AND (IP* idoms [2]CP*)
AND ([2]CP* sameindex \*ICH*)
AND (IP* idoms *BE*)
AND (IP* idoms *VAG*)

OR (IP* idoms NP-NOM)
AND (NP-NOM idoms D*)
AND (NP-NOM idoms [1]CP*-THT*|CP*-QUE*|CP*-PRN)
AND (D* iprecedes [1]CP*-THT*|CP*-QUE*|CP*-PRN)
AND ([1]CP*-THT*|CP*-QUE*|CP*-PRN idoms \*ICH*)
AND (IP* idoms !NP|NP-ACC|NP-DAT|NP-GEN|NP*-RSP)
AND (IP* idoms [2]CP*)
AND ([2]CP* sameindex \*ICH*)
AND (IP* idoms *HV*)
AND (IP* idoms *VBN*)

OR   (IP* idoms NP-NOM)
AND (NP-NOM idoms D*)
AND (NP-NOM idoms [1]CP*-THT*|CP*-QUE*|CP*-PRN)
AND (D* iprecedes [1]CP*-THT*|CP*-QUE*|CP*-PRN)
AND ([1]CP*-THT*|CP*-QUE*|CP*-PRN idoms \*ICH*)
AND (IP* idoms !NP|NP-ACC|NP-DAT|NP-GEN|NP*-RSP)
AND (IP* idoms [2]CP*)
AND ([2]CP* sameindex \*ICH*)
AND (IP* idoms *BE*)
AND (IP* idoms *VBN*)



