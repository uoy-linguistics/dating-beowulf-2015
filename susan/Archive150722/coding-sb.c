begin_remark: coding RZ SB criteria. Changes: used new definitions of nominative and oblique arguments.
end_remark
node: IP*
remove_nodes: t
nodes_only: t
ignore_nodes: \**|CODE|ID|'|\"|,|/|\.|FRAG|X|COMMENT|LB|BREAK|HL|LL|*PRN*|NEG|VOC

coding_query: 

// SB1|2 - scrambling of pronominal objects
// 's' indicates scrambled, 'n' non-scrambled
8: {
// finite main verb, pronoun either before subject or immediately after subject and
// not adjacent to finite main verb
   8s1: (CODING col 2 vf)
      AND (IP* idoms nom-arg|nom-arg-moved)
      AND (IP* idoms verb-f-all)
      AND (nom-arg|nom-arg-moved precedes verb-f-all)
      AND (IP* idoms obl-arg-usable)
      AND (obl-arg-usable idomsonly PRO|PRO^*)
      AND (obl-arg-usable precedes nom-arg|nom-arg-moved)
   8s2: (CODING col 2 vf)
      AND (IP* idoms nom-arg|nom-arg-moved)
      AND (IP* idoms verb-f-all)
      AND (nom-arg|nom-arg-moved precedes verb-f-all)
      AND (IP* idoms obl-arg-usable)
      AND (obl-arg-usable idomsonly PRO|PRO^*)
      AND (nom-arg|nom-arg-moved iprecedes obl-arg-usable)
      AND (obl-arg-usable precedes *)
      AND (* precedes verb-f-all)
// for cobeowulf 1385
   8s5: (CODING col 2 vf)
      AND (IP* idoms nom-arg|nom-arg-moved)
      AND (IP* idoms verb-f-all)
      AND (nom-arg|nom-arg-moved precedes verb-f-all)
      AND (IP* idoms obl-arg-usable)
      AND (obl-arg-usable idomsonly [1]PRO|PRO^*)
      AND (IP* idoms [3]*)
      AND ([3]* idomsonly [2]PRO|PRO^*)
      AND (nom-arg|nom-arg-moved iprecedes [3]*)
      AND ([3]* iprecedes obl-arg-usable)
      AND (obl-arg-usable precedes [4]*)
      AND ([4]* precedes verb-f-all)
// non-finite main verb, pronoun either before subject or immediately after subject and
// not adjacent to finite main verb
   8s3: (CODING col 2 auxv|vaux)
      AND (IP* idoms nom-arg|nom-arg-moved)
      AND (IP* idoms verb-f-all)
      AND (nom-arg|nom-arg-moved precedes verb-f-all)
      AND (IP* idoms obl-arg-usable)
      AND (obl-arg-usable idomsonly PRO|PRO^*)
      AND (obl-arg-usable precedes nom-arg|nom-arg-moved)
   8s4: (CODING col 2 auxv|vaux)
      AND (IP* idoms nom-arg|nom-arg-moved)
      AND (IP* idoms verb-f-all)
      AND (IP* idoms v-nf-all)
      AND (nom-arg|nom-arg-moved precedes verb-f-all)
      AND (IP* idoms obl-arg-usable)
      AND (obl-arg-usable idomsonly PRO|PRO^*)
      AND (nom-arg|nom-arg-moved iprecedes obl-arg-usable)
      AND (obl-arg-usable precedes *)
      AND (* precedes v-nf-all)
// pronoun separated from subject
   8n: (CODING col 2 vf|auxv|vaux)
      AND (IP* idoms nom-arg|nom-arg-moved)
      AND (IP* idoms obl-arg-usable)
      AND (obl-arg-usable idomsonly PRO|PRO^*)
      AND (nom-arg|nom-arg-moved precedes *)
      AND (* precedes obl-arg-usable)
   /: ELSE
}

9: {
// clauses with finite main verb and one-word post-verbal constituent, pre-verbal (scrambled)
// or post-verbal (not scrambled) pronoun
   9s: (CODING col 2 vf)
      AND (IP* idoms nom-arg|nom-arg-moved)
      AND (IP* idoms verb-f-all)
      AND (nom-arg|nom-arg-moved precedes verb-f-all)
      AND (IP* idoms obl-arg-usable)
      AND (obl-arg-usable idomsonly PRO|PRO^*)
      AND (IP* idoms *)
      AND (* domswords 1)
      AND (* idoms !CP*|IP*)
      AND (verb-f-all precedes *)
      AND (obl-arg-usable precedes verb-f-all)
   9n: (CODING col 2 vf)
      AND (IP* idoms nom-arg|nom-arg-moved)
      AND (IP* idoms verb-f-all)
      AND (nom-arg|nom-arg-moved precedes verb-f-all)
      AND (IP* idoms obl-arg-usable)
      AND (obl-arg-usable idomsonly PRO|PRO^*)
      AND (IP* idoms *)
      AND (* domswords 1)
      AND (* idoms !CP*|IP*)
      AND (verb-f-all precedes *)
      AND (verb-f-all precedes obl-arg-usable)
   /: ELSE
    }
