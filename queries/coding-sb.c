begin_remark: coding RZ SB criteria. Changes: 1) used new definitions of nominative and oblique arguments. 2) separation from subject by another pronoun is equivalent to adjacency to subject. 3) separation from verb by another object is equivalent to adjacency to verb. 21/07/15: clean up nom-args. 30/07/15: cosmetic changes and documentation
end_remark
node: IP*
remove_nodes: t
nodes_only: t
ignore_nodes: \**|CODE|ID|'|\"|,|/|\.|FRAG|X|COMMENT|LB|BREAK|HL|LL|*PRN*|NEG|ne|*VOC*

define: susan.def

coding_query:

// SB1|2 - scrambling of pronominal objects
// 's' indicates scrambled, 'n' non-scrambled, 'x' ambiguous (adjacent to both subject and main verb)
// finite main verb:
// scrambled:
// 8s1: pro (...) sbj ...
// 8s2: (...) sbj pro (...) xp (...) vf
// 8s4: (...) sbj (...) xp (...) pro (...) yp (...) vf
// ambiguous (adjacent to both subject and verb)
// 8x1: (...) sbj pro obj|prd vf
// 8x2: (...) sbj pro1 pro2 obj|prd vf (with pro2 the target object)
// 8x5: (...) sbj pro vf
// not scrambled:
// 8n2: (...) sbj (...) xp (...) pro vf
// 8n4: (...) sbj (...) xp (...) pro obj|prd vf

// 8x: not specified (probably error)

// non-finite main verb:
// scrambled:
// 8s6: (...) sbj pro xp (...) vnf vf (8s6 doesn't check the position of the finite verb)
// 8s6: (...) sbj pro xp (...) vf vnf
// 8s7: (...) sbj xp pro yp vnf vf (8s7 doesn't check the position of the finite verb)
// 8s7: (...) sbj xp pro yp vf vnf
// ambiguous (adjacent to both subject and verb)
// 8x3: (...) sbj pro obj|prd vnf vf
// 8x4: (...) sbj pro1 pro2 obj|prd vnf vf (with pro2 the target object)
// 8x6: (...) sbj pro vnf vf
// not scrambled:
// 8n1: (...) sbj (...) vf (...) pro (...) vnf (...)
// 8n5: (...) sbj (...) xp pro obj|prd vnf vf

// 8x: not specified (probably error)

8: {
// finite main verb, pronoun before subject
   8s1: (CODING col 2 vf)
      AND (IP* idoms nom-arg-usable)
      AND (IP* idoms verb-f-all)
      AND (nom-arg-usable precedes verb-f-all)
      AND (IP* idoms obl-arg-usable)
      AND (obl-arg-usable idomsonly PRO|PRO^*)
      AND (obl-arg-usable precedes nom-arg-usable)
// finite main verb, pronoun immediately after subject and separated from finite main verb
// only by another object or predicate
   8x1: (CODING col 2 vf)
      AND (IP* idoms nom-arg-usable)
      AND (IP* idoms verb-f-all)
      AND (nom-arg-usable precedes verb-f-all)
      AND (IP* idoms obl-arg-usable)
      AND (IP* idoms obl-arg-usable|*PRD*)
      AND (obl-arg-usable idomsonly PRO|PRO^*)
      AND (nom-arg-usable iprecedes obl-arg-usable)
      AND (obl-arg-usable iprecedes obl-arg-usable|*PRD*)
      AND (obl-arg-usable|*PRD* iprecedes verb-f-all)
// finite main verb, pronoun immediately after subject and not adjacent to finite main verb
   8s2: (CODING col 2 vf)
      AND (IP* idoms nom-arg-usable)
      AND (IP* idoms verb-f-all)
      AND (nom-arg-usable precedes verb-f-all)
      AND (IP* idoms obl-arg-usable)
      AND (obl-arg-usable idomsonly PRO|PRO^*)
      AND (nom-arg-usable iprecedes obl-arg-usable)
      AND (obl-arg-usable precedes *)
      AND (* precedes verb-f-all)
// pronoun separated from subject by another pronoun, and separated from finite main verb
// by another object or predicate
   8x2: (CODING col 2 vf)
      AND (IP* idoms nom-arg-usable)
      AND (IP* idoms verb-f-all)
      AND (nom-arg-usable precedes verb-f-all)
      AND (IP* idoms obl-arg-usable)
      AND (IP* idoms obl-arg-usable|*PRD*)
      AND (obl-arg-usable idomsonly [1]PRO|PRO^*)
      AND (IP* idoms [3]*)
      AND ([3]* idomsonly [2]PRO|PRO^*)
      AND (nom-arg-usable iprecedes [4]*)
      AND ([4]* iprecedes obl-arg-usable)
      AND (obl-arg-usable iprecedes obl-arg-usable|*PRD*)
      AND (obl-arg-usable|*PRD* iprecedes verb-f-all)
// finite main verb, pronoun separated from subject but not adjacent to verb
   8s4: (CODING col 2 vf)
      AND (IP* idoms nom-arg-usable)
      AND (IP* idoms verb-f-all)
      AND (nom-arg-usable precedes verb-f-all)
      AND (IP* idoms obl-arg-usable)
      AND (obl-arg-usable idomsonly [1]PRO|PRO^*)
      AND (IP* idoms [3]*)
      AND (nom-arg-usable iprecedes [3]*)
      AND ([3]* iprecedes obl-arg-usable)
      AND (IP* idoms [4]*)
      AND (obl-arg-usable precedes [4]*)
      AND ([4]* precedes verb-f-all)
// finite main verb, sbj-pro-v
   8x5: (CODING col 2 vf)
      AND (IP* idoms nom-arg-usable)
      AND (IP* idoms verb-f-all)
      AND (IP* idoms obl-arg-usable)
      AND (obl-arg-usable idomsonly PRO|PRO^*)
      AND (nom-arg-usable iprecedes obl-arg-usable)
      AND (obl-arg-usable iprecedes verb-f-all)
// non-finite main verb, pronoun after aux
   8n1: (CODING col 2 auxv)
      AND (IP* idoms nom-arg-usable)
      AND (IP* idoms verb-f-all)
      AND (IP* idoms verb-nf-all)
      AND (nom-arg-usable precedes verb-f-all)
      AND (IP* idoms obl-arg-usable)
      AND (obl-arg-usable idomsonly PRO|PRO^*)
      AND (verb-f-all precedes obl-arg-usable)
// non-finite main verb, pronoun before subject
   8s5: (CODING col 2 auxv|vaux)
      AND (IP* idoms nom-arg-usable)
      AND (IP* idoms verb-f-all)
      AND (IP* idoms verb-nf-all)
      AND (nom-arg-usable precedes verb-f-all)
      AND (IP* idoms obl-arg-usable)
      AND (obl-arg-usable idomsonly PRO|PRO^*)
      AND (obl-arg-usable precedes nom-arg-usable)
// non-finite main verb, pronoun immediately after subject and separated from non-finite verb
// only by another object or a PRD. Note: none in Beowulf.
   8x3: (CODING col 2 auxv|vaux)
      AND (IP* idoms nom-arg-usable)
      AND (IP* idoms verb-f-all)
      AND (IP* idoms verb-nf-all)
      AND (nom-arg-usable precedes verb-f-all)
      AND (IP* idoms obl-arg-usable)
      AND (IP* idoms obl-arg-usable|*PRD*)
      AND (obl-arg-usable idomsonly PRO|PRO^*)
      AND (nom-arg-usable iprecedes obl-arg-usable)
      AND (obl-arg-usable iprecedes obl-arg-usable|*PRD*)
      AND (obl-arg-usable|*PRD* iprecedes verb-nf-all)
// non-finite main verb, pronoun immediately after subject and separated from non-finite verb.
// Note: none in Beowulf.
   8s6: (CODING col 2 auxv|vaux)
      AND (IP* idoms nom-arg-usable)
      AND (IP* idoms verb-f-all)
      AND (IP* idoms verb-nf-all)
      AND (nom-arg-usable precedes verb-f-all)
      AND (IP* idoms obl-arg-usable)
      AND (obl-arg-usable idomsonly PRO|PRO^*)
      AND (nom-arg-usable iprecedes obl-arg-usable)
      AND (obl-arg-usable iprecedes *)
      AND (* precedes verb-nf-all)
// non-finite main verb, pronoun separated from subject by another pronoun and separated
// from non-finite verb only by another object. Note: none in Beowulf.
   8x4: (CODING col 2 auxv|vaux)
      AND (IP* idoms nom-arg-usable)
      AND (IP* idoms verb-f-all)
      AND (IP* idoms verb-nf-all)
      AND (nom-arg-usable precedes verb-f-all)
      AND (IP* idoms obl-arg-usable)
      AND (IP* idoms obl-arg-usable|*PRD*)
      AND (obl-arg-usable idomsonly [1]PRO|PRO^*)
      AND (IP* idoms *)
      AND (* idomsonly [2]PRO|PRO^*)
      AND (nom-arg-usable iprecedes *)
      AND (* iprecedes obl-arg-usable)
      AND (obl-arg-usable iprecedes obl-arg-usable|*PRD*)
      AND (obl-arg-usable|*PRD* iprecedes verb-nf-all)
// non-finite main verb, pronoun separated from subject but not adjacent to verb.
//  Note: none in Beowulf.
   8s7: (CODING col 2 auxv|vaux)
      AND (IP* idoms nom-arg-usable)
      AND (IP* idoms verb-f-all)
      AND (IP* idoms verb-nf-all)
      AND (nom-arg-usable precedes verb-f-all)
      AND (IP* idoms obl-arg-usable)
      AND (obl-arg-usable idomsonly PRO|PRO^*)
      AND (IP* idoms [3]*)
      AND (nom-arg-usable iprecedes [3]*)
      AND ([3]* iprecedes obl-arg-usable)
      AND (IP* idoms [4]*)
      AND (obl-arg-usable precedes [4]*)
      AND ([4]* precedes verb-nf-all)
// non-finite main verb, sbj-pro-vnf-vf.  Note: none in Beowulf.
   8x6: (CODING col 2 vaux)
      AND (IP* idoms nom-arg-usable)
      AND (IP* idoms verb-f-all)
      AND (IP* idoms verb-nf-all)
      AND (IP* idoms obl-arg-usable)
      AND (obl-arg-usable idomsonly PRO|PRO^*)
      AND (nom-arg-usable iprecedes obl-arg-usable)
      AND (obl-arg-usable iprecedes verb-nf-all)
// pronoun after non-finite verb. Note: none in Beowulf.
   8n1: (CODING col 2 auxv|vaux)
      AND (IP* idoms verb-f-all)
      AND (IP* idoms verb-nf-all)
      AND (IP* idoms nom-arg-usable)
      AND (IP* idoms obl-arg-usable)
      AND (obl-arg-usable idomsonly PRO|PRO^*)
      AND (nom-arg-usable precedes verb-f-all)
      AND (verb-nf-all precedes obl-arg-usable)
// pronoun after finite main verb. Note: none in Beowulf.
   8n2: (CODING col 2 vf)
      AND (IP* idoms verb-f-all)
      AND (IP* idoms nom-arg-usable)
      AND (IP* idoms obl-arg-usable)
      AND (obl-arg-usable idomsonly PRO|PRO^*)
      AND (nom-arg-usable precedes verb-f-all)
      AND (verb-f-all precedes obl-arg-usable)
// pronoun separated from subject and adjacent to non-finite main verb.
//  Note: none in Beowulf.
   8n3: (CODING col 2 auxv|vaux)
      AND (IP* idoms verb-f-all)
      AND (IP* idoms verb-nf-all)
      AND (IP* idoms nom-arg-usable)
      AND (IP* idoms obl-arg-usable)
      AND (obl-arg-usable idomsonly PRO|PRO^*)
      AND (nom-arg-usable precedes *)
      AND (* precedes obl-arg-usable)
      AND (obl-arg-usable iprecedes verb-nf-all)
// pronoun separated from subject and separated from non-finite main verb only by another object|PRD.
   8n5: (CODING col 2 auxv|vaux)
      AND (IP* idoms verb-f-all)
      AND (IP* idoms verb-nf-all)
      AND (IP* idoms nom-arg-usable)
      AND (IP* idoms obl-arg-usable)
      AND (IP* idoms obl-arg-usable|*PRD*)
      AND (obl-arg-usable idomsonly PRO|PRO^*)
      AND (nom-arg-usable precedes *)
      AND (* precedes obl-arg-usable)
      AND (obl-arg-usable iprecedes obl-arg-usable|*PRD*)
      AND (obl-arg-usable|*PRD* iprecedes verb-nf-all)
// pronoun separated from subject and adjacent to finite main verb
   8n4: (CODING col 2 vf)
      AND (IP* idoms verb-f-all)
      AND (IP* idoms nom-arg-usable)
      AND (IP* idoms obl-arg-usable)
      AND (obl-arg-usable idomsonly PRO|PRO^*)
      AND (nom-arg-usable precedes *)
      AND (* precedes obl-arg-usable)
      AND (obl-arg-usable iprecedes verb-f-all)
// pronoun separated from subject and separated from finite main verb only by another object/PRD.
   8n6: (CODING col 2 vf)
      AND (IP* idoms verb-f-all)
      AND (IP* idoms nom-arg-usable)
      AND (IP* idoms obl-arg-usable)
      AND (IP* idoms obl-arg-usable|*PRD*)
      AND (obl-arg-usable idomsonly PRO|PRO^*)
      AND (nom-arg-usable precedes *)
      AND (* precedes obl-arg-usable)
      AND (obl-arg-usable iprecedes obl-arg-usable|*PRD*)
      AND (obl-arg-usable|*PRD* iprecedes verb-f-all)
// pronoun exists but doesn't fall into any of the above categories
   8x: (CODING col 2 auxv|vaux)
      AND (IP* idoms nom-arg-usable)
      AND (IP* idoms verb-f-all)
      AND (IP* idoms verb-nf-all)
      AND (IP* idoms obl-arg-usable)
      AND (obl-arg-usable idomsonly PRO|PRO^*)
      AND (nom-arg-usable precedes verb-f-all)
// pronoun exists but doesn't fall into any of the above categories
   8x: (CODING col 2 vf)
      AND (IP* idoms nom-arg-usable)
      AND (IP* idoms verb-f-all)
      AND (IP* idoms obl-arg-usable)
      AND (obl-arg-usable idomsonly PRO|PRO^*)
      AND (nom-arg-usable precedes verb-f-all)
   /: ELSE
}

9: {
// clauses with finite main verb and one-word post-verbal constituent, pre-verbal (scrambled)
// or post-verbal (not scrambled) pronoun
   9s1: (CODING col 2 vf)
      AND (IP* idoms nom-arg-usable)
      AND (IP* idoms verb-f-all)
      AND (nom-arg-usable precedes verb-f-all)
      AND (IP* idoms obl-arg-usable)
      AND (obl-arg-usable idomsonly PRO|PRO^*)
      AND (IP* idoms *)
      AND (* domswords 1)
      AND (* idoms !CP*|IP*)
      AND (verb-f-all precedes *)
      AND (obl-arg-usable precedes verb-f-all)
   9s2: (CODING col 2 auxv)
      AND (IP* idoms nom-arg-usable)
      AND (IP* idoms verb-f-all)
      AND (IP* idoms verb-nf-all)
      AND (nom-arg-usable precedes verb-f-all)
      AND (IP* idoms obl-arg-usable)
      AND (obl-arg-usable idomsonly PRO|PRO^*)
      AND (IP* idoms *)
      AND (* domswords 1)
      AND (* idoms !CP*|IP*)
      AND (verb-nf-all precedes *)
      AND (obl-arg-usable precedes verb-f-all)
   9n1: (CODING col 2 vf)
      AND (IP* idoms nom-arg-usable)
      AND (IP* idoms verb-f-all)
      AND (nom-arg-usable precedes verb-f-all)
      AND (IP* idoms obl-arg-usable)
      AND (obl-arg-usable idomsonly PRO|PRO^*)
      AND (IP* idoms *)
      AND (* domswords 1)
      AND (* idoms !CP*|IP*)
      AND (verb-f-all precedes *)
      AND (verb-f-all precedes obl-arg-usable)
   9n2: (CODING col 2 vf)
      AND (IP* idoms nom-arg-usable)
      AND (IP* idoms verb-f-all)
      AND (IP* idoms verb-nf-all)
      AND (nom-arg-usable precedes verb-f-all)
      AND (IP* idoms obl-arg-usable)
      AND (obl-arg-usable idomsonly PRO|PRO^*)
      AND (IP* idoms *)
      AND (* domswords 1)
      AND (* idoms !CP*|IP*)
      AND (verb-nf-all precedes *)
      AND (verb-nf-all precedes obl-arg-usable)
// we shouldn't see any tokens coded 9x1/2; this is a check only
    9x1: (CODING col 2 vf)
      AND (IP* idoms nom-arg-usable)
      AND (IP* idoms verb-f-all)
      AND (nom-arg-usable precedes verb-f-all)
      AND (IP* idoms obl-arg-usable)
      AND (obl-arg-usable idomsonly PRO|PRO^*)
      AND (IP* idoms *)
      AND (* domswords 1)
      AND (* idoms !CP*|IP*)
      AND (verb-f-all precedes *)
    9x2: (CODING col 2 auxv)
      AND (IP* idoms nom-arg-usable)
      AND (IP* idoms verb-f-all)
      AND (IP* idoms verb-nf-all)
      AND (nom-arg-usable precedes verb-f-all)
      AND (IP* idoms obl-arg-usable)
      AND (obl-arg-usable idomsonly PRO|PRO^*)
      AND (IP* idoms *)
      AND (* domswords 1)
      AND (* idoms !CP*|IP*)
      AND (verb-nf-all precedes *)
   /: ELSE
    }
