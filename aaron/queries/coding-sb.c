begin_remark: coding RZ SB criteria
end_remark
node: IP*
remove_nodes: t
nodes_only: t
ignore_nodes: \**|CODE|ID|'|\"|,|/|\.|FRAG|X|COMMENT|LB|BREAK|HL|LL|*PRN*|NEG|VOC

define: susan.def

coding_query:

// SB1|2 - scrambling of pronominal objects
// 's' indicates scrambled, 'n' non-scrambled
8: {
// finite main verb, pronoun either before subject or immediately after subject and
// not adjacent to finite main verb
   8s1: (CODING col 2 vf)
      AND (IP* idoms nom-arg)
      AND (IP* idoms verb-f-all)
      AND (nom-arg precedes verb-f-all)
      AND (IP* idoms obl-arg)
      AND (obl-arg idomsonly PRO|PRO^*)
      AND (obl-arg precedes nom-arg)
   8s2: (CODING col 2 vf)
      AND (IP* idoms nom-arg)
      AND (IP* idoms verb-f-all)
      AND (nom-arg precedes verb-f-all)
      AND (IP* idoms obl-arg)
      AND (obl-arg idomsonly PRO|PRO^*)
      AND (nom-arg iprecedes obl-arg)
      AND (obl-arg precedes *)
      AND (* precedes verb-f-all)
// for cobeowulf 1385
   8s5: (CODING col 2 vf)
      AND (IP* idoms nom-arg)
      AND (IP* idoms verb-f-all)
      AND (nom-arg precedes verb-f-all)
      AND (IP* idoms obl-arg)
      AND (obl-arg idomsonly [1]PRO|PRO^*)
      AND (IP* idoms [3]*)
      AND ([3]* idomsonly [2]PRO|PRO^*)
      AND (nom-arg iprecedes [3]*)
      AND ([3]* iprecedes obl-arg)
      AND (obl-arg precedes [4]*)
      AND ([4]* precedes verb-f-all)
// non-finite main verb, pronoun either before subject or immediately after subject and
// not adjacent to finite main verb
   8s3: (CODING col 2 auxv|vaux)
      AND (IP* idoms nom-arg)
      AND (IP* idoms verb-f-all)
      AND (nom-arg precedes verb-f-all)
      AND (IP* idoms obl-arg)
      AND (obl-arg idomsonly PRO|PRO^*)
      AND (obl-arg precedes nom-arg)
   8s4: (CODING col 2 auxv|vaux)
      AND (IP* idoms nom-arg)
      AND (IP* idoms verb-f-all)
      AND (IP* idoms v-nf-all)
      AND (nom-arg precedes verb-f-all)
      AND (IP* idoms obl-arg)
      AND (obl-arg idomsonly PRO|PRO^*)
      AND (nom-arg iprecedes obl-arg)
      AND (obl-arg precedes *)
      AND (* precedes v-nf-all)
// pronoun separated from subject
   8n: (CODING col 2 vf|auxv|vaux)
      AND (IP* idoms nom-arg)
      AND (IP* idoms obl-arg)
      AND (obl-arg idomsonly PRO|PRO^*)
      AND (nom-arg precedes *)
      AND (* precedes obl-arg)
   /: ELSE
}

9: {
// clauses with finite main verb and one-word post-verbal constituent, pre-verbal (scrambled)
// or post-verbal (not scrambled) pronoun
   9s: (CODING col 2 vf)
      AND (IP* idoms nom-arg)
      AND (IP* idoms verb-f-all)
      AND (nom-arg precedes verb-f-all)
      AND (IP* idoms obl-arg)
      AND (obl-arg idomsonly PRO|PRO^*)
      AND (IP* idoms *)
      AND (* domswords 1)
      AND (* idoms !CP*|IP*)
      AND (verb-f-all precedes *)
      AND (obl-arg precedes verb-f-all)
   9n: (CODING col 2 vf)
      AND (IP* idoms nom-arg)
      AND (IP* idoms verb-f-all)
      AND (nom-arg precedes verb-f-all)
      AND (IP* idoms obl-arg)
      AND (obl-arg idomsonly PRO|PRO^*)
      AND (IP* idoms *)
      AND (* domswords 1)
      AND (* idoms !CP*|IP*)
      AND (verb-f-all precedes *)
      AND (verb-f-all precedes obl-arg)
   /: ELSE
    }
