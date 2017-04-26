define: dating.def
node: IP*
ignore_nodes:  null
nodes_only: t
query:

// null expletives with lexical verbs

    (IP* idoms NP-NOM-x)
AND (NP-NOM-x* doms *exp*)
AND (IP* idoms !NP|NP-ACC|NP-DAT|NP-GEN|NP*-RSP)
AND (IP* idoms CP-*-x)
AND (IP* idoms *VBP*|*VBD*)

OR (IP* idoms NP-NOM-x)
AND (NP-NOM-x* doms *exp*)
AND (IP* idoms !NP|NP-ACC|NP-DAT|NP-GEN|NP*-RSP)
AND (IP* idoms CP-*-x)
AND (IP* idoms *MD*)
AND (IP* idoms *VB*)

OR (IP* idoms NP-NOM-x)
AND (NP-NOM-x* doms *exp*)
AND (IP* idoms !NP|NP-ACC|NP-DAT|NP-GEN|NP*-RSP)
AND (IP* idoms CP-*-x)
AND (IP* idoms *BE*)
AND (IP* idoms *VAG*)

OR (IP* idoms NP-NOM-x)
AND (NP-NOM-x* doms *exp*)
AND (IP* idoms !NP|NP-ACC|NP-DAT|NP-GEN|NP*-RSP)
AND (IP* idoms CP-*-x)
AND (IP* idoms *HV*)
AND (IP* idoms *VBN*)

OR (IP* idoms NP-NOM-x)
AND (NP-NOM-x* doms *exp*)
AND (IP* idoms !NP|NP-ACC|NP-DAT|NP-GEN|NP*-RSP)
AND (IP* idoms CP-*-x)
AND (IP* idoms *BE*)
AND (IP* idoms *VBN*)




