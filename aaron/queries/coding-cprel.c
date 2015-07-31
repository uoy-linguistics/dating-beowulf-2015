begin_remark: code relative clauses according to the wh + comps. 22/07/15: clean up. 29/07/15: fixed non-counting of wadvp's and wpp's.
end_remark
node: $ROOT
remove_nodes: f
nodes_only: f
print_complement: f

ignore_nodes: RMV:*|CODE|ID|'|\"|,|/|\.|FRAG|X|COMMENT|LB|BREAK|HL|LL|NEG

coding_query:

1: {
   se: (CP-REL* idoms WNP*) AND (WNP* idoms D*)
       AND (CP-REL* idoms C) AND (C idoms 0)
   se-the: (CP-REL* idoms WNP*) AND (WNP* idoms D*)
       AND (CP-REL* idoms C) AND (C idoms !0)
   the: (CP-REL* idoms W*) AND (W* idoms [1]0)
       AND (CP-REL* idoms C) AND (C idoms ![2]0)
   zero: (CP-REL* idoms W*) AND (W* idoms [1]0)
       AND (CP-REL* idoms C) AND (C idoms [2]0)
   adv: (CP-REL* idoms WADV*|WPP*) AND (WADV*|WPP* idoms !0)
   1x: ELSE
}
