begin_remark: get np tokens for RZ gen criterion. 22/07/15: Do not use NP-GENs within NP-GENs (because of measure and distance NPs) -- this is done by using nom, acc and dat NPs and defining NPs not marked for case.
end_remark
node: NP*
remove_nodes: f
nodes_only: t

define: susan.def

ignore_nodes: \**|INTJ*|CODE|ID|'|\"|,|/|\.|COMMENT|LB

query: (NP-NOM*|NP-ACC*|NP-DAT*|NP-nocase idoms N|N^*|NR|NR^*)
       AND (NP* idoms NP-GEN*)
