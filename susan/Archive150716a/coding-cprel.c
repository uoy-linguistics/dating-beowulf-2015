begin_remark: code relative clauses according to the wh + comps
end_remark
node: CP-REL*
remove_nodes: f
nodes_only: f
print_complement: f
ignore_nodes: RMV:*|CODE|ID|'|\"|,|/|\.|FRAG|X|COMMENT|LB|BREAK|HL|LL|NEG

coding_query: 

1: {
   se: (CP-REL* idoms W*) AND (W* idoms ![1]0)
       AND (CP-REL* idoms C) AND (C idoms [2]0)
   se-the: (CP-REL* idoms W*) AND (W* idoms ![1]0)
       AND (CP-REL* idoms C) AND (C idoms ![2]0)
   the: (CP-REL* idoms W*) AND (W* idoms [1]0)
       AND (CP-REL* idoms C) AND (C idoms ![2]0)
   zero: (CP-REL* idoms W*) AND (W* idoms [1]0)
       AND (CP-REL* idoms C) AND (C idoms [2]0)
   1x: ELSE
}
