begin_remark: coding RZ IP criteria. 16/07/15 1) included moved objects in IP4. 2) new definitions for subjects (nom-arg|nom-arg-moved) and objects (obl-arg-usable)
end_remark
node: IP*
remove_nodes: t
nodes_only: t
ignore_nodes: \**|CODE|ID|'|\"|,|/|\.|FRAG|X|COMMENT|LB|BREAK|HL|LL|*PRN*|NEG|VOC

coding_query: 

// IP1, IP2 - position of diagnostics in clauses with finite main verbs
3: {
// particles
   3f1: (CODING col 2 vf)
      AND (IP* idoms nom-arg|nom-arg-moved)
      AND (IP* idoms verb-f-all)
      AND (IP* idoms RP)
      AND (nom-arg|nom-arg-moved precedes RP)
      AND (RP precedes verb-f-all)
      AND (RP iprecedes !PP*)
   3i1: (CODING col 2 vf)
      AND (IP* idoms nom-arg|nom-arg-moved)
      AND (IP* idoms verb-f-all)
      AND (IP* idoms RP)
      AND (nom-arg|nom-arg-moved precedes verb-f-all)
      AND (verb-f-all precedes RP)
      AND (RP iprecedes !PP*)
// stranded prepositions
   3f2: (CODING col 2 vf)
      AND (IP* idoms nom-arg|nom-arg-moved)
      AND (IP* idoms verb-f-all)
      AND (IP* idoms PP*)
      AND (PP* idomsonly P)
      AND (nom-arg|nom-arg-moved precedes PP*)
      AND (PP* precedes verb-f-all)
   3i2: (CODING col 2 vf)
      AND (IP* idoms nom-arg|nom-arg-moved)
      AND (IP* idoms verb-f-all)
      AND (IP* idoms PP*)
      AND (PP* idomsonly P)
      AND (nom-arg|nom-arg-moved precedes verb-f-all)
      AND (verb-f-all precedes PP*)
// negative np's
   3f3: (CODING col 2 vf)
      AND (IP* idoms nom-arg|nom-arg-moved)
      AND (IP* idoms verb-f-all)
      AND (IP* idoms obl-arg-usable)
      AND (obl-arg-usable idoms NEG+N*|NEG+Q*)
      AND (nom-arg|nom-arg-moved precedes obl-arg-usable)
      AND (obl-arg-usable precedes verb-f-all)
   3i3: (CODING col 2 vf)
      AND (IP* idoms nom-arg|nom-arg-moved)
      AND (IP* idoms verb-f-all)
      AND (IP* idoms obl-arg-usable)
      AND (obl-arg-usable idoms NEG+N*|NEG+Q*)
      AND (nom-arg|nom-arg-moved precedes verb-f-all)
      AND (verb-f-all precedes obl-arg-usable)
// negative advp's
   3f4: (CODING col 2 vf)
      AND (IP* idoms nom-arg|nom-arg-moved)
      AND (IP* idoms verb-f-all)
      AND (IP* idoms ADVP*)
      AND (ADVP* idoms NEG+ADV*)
      AND (nom-arg|nom-arg-moved precedes ADVP*)
      AND (ADVP* precedes verb-f-all)
   3i4: (CODING col 2 vf)
      AND (IP* idoms nom-arg|nom-arg-moved)
      AND (IP* idoms verb-f-all)
      AND (IP* idoms ADVP*)
      AND (ADVP* idoms NEG+ADV*)
      AND (nom-arg|nom-arg-moved precedes verb-f-all)
      AND (verb-f-all precedes ADVP*)
// pronominal objects
   3f5: (CODING col 2 vf)
      AND (IP* idoms nom-arg|nom-arg-moved)
      AND (IP* idoms verb-f-all)
      AND (IP* idoms obl-arg-usable)
      AND (obl-arg-usable idomsonly PRO|PRO^*)
      AND (nom-arg|nom-arg-moved precedes obl-arg-usable)
      AND (obl-arg-usable precedes verb-f-all)
   3i5: (CODING col 2 vf)
      AND (IP* idoms nom-arg|nom-arg-moved)
      AND (IP* idoms verb-f-all)
      AND (IP* idoms obl-arg-usable)
      AND (obl-arg-usable idomsonly PRO|PRO^*)
      AND (nom-arg|nom-arg-moved precedes verb-f-all)
      AND (verb-f-all precedes obl-arg-usable)
   /: ELSE
}

// IP3 - order of finite aux and non-finite main verb
4: {
   4f: (CODING col 2 auxv|vaux)
      AND (IP* idoms nom-arg|nom-arg-moved)
      AND (IP* idoms verb-f-all)
      AND (IP* idoms v-nf-all)
      AND (nom-arg|nom-arg-moved precedes v-nf-all)
      AND (v-nf-all precedes verb-f-all)
   4i: (CODING col 2 auxv|vaux)
      AND (IP* idoms nom-arg|nom-arg-moved)
      AND (IP* idoms verb-f-all)
      AND (IP* idoms v-nf-all)
      AND (nom-arg|nom-arg-moved precedes verb-f-all)
      AND (verb-f-all precedes v-nf-all)
   /: ELSE
}

//IP4 - position of heavy constituents in clauses with finite main verbs
5: {
// DP argument; note that DPs with indices are included
   5f1: (CODING col 2 vf)
      AND (IP* idoms nom-arg|nom-arg-moved)
      AND (IP* idoms verb-f-all)
      AND (IP* idoms obl-arg-usable)
      AND (obl-arg-usable idoms non-pronominal)
      AND (nom-arg|nom-arg-moved precedes obl-arg-usable)
      AND (obl-arg-usable precedes verb-f-all)
   5i1: (CODING col 2 vf)
      AND (IP* idoms nom-arg|nom-arg-moved)
      AND (IP* idoms verb-f-all)
      AND (IP* idoms obl-arg-usable)
      AND (obl-arg-usable idoms non-pronominal)
      AND (nom-arg|nom-arg-moved precedes verb-f-all)
      AND (verb-f-all precedes obl-arg-usable)
// adjectival phrase
   5f2: (CODING col 2 vf)
      AND (IP* idoms nom-arg|nom-arg-moved)
      AND (IP* idoms verb-f-all)
      AND (IP* idoms ADJP-NOM-PRD)
      AND (nom-arg|nom-arg-moved precedes ADJP-NOM-PRD)
      AND (ADJP-NOM-PRD precedes verb-f-all)
   5i2: (CODING col 2 vf)
      AND (IP* idoms nom-arg|nom-arg-moved)
      AND (IP* idoms verb-f-all)
      AND (IP* idoms ADJP-NOM-PRD)
      AND (ADJP-NOM-PRD idoms non-pronominal)
      AND (nom-arg|nom-arg-moved precedes verb-f-all)
      AND (verb-f-all precedes ADJP-NOM-PRD)
// PP + something else
   5f3a: (CODING col 2 vf)
      AND (IP* idoms nom-arg|nom-arg-moved)
      AND (IP* idoms verb-f-all)
      AND (IP* idoms PP*)
      AND (IP* idoms *)
      AND (* idoms non-pronominal)
      AND (nom-arg|nom-arg-moved precedes PP*)
      AND (PP* precedes *)
      AND (* precedes verb-f-all)
   5f3b: (CODING col 2 vf)
      AND (IP* idoms nom-arg|nom-arg-moved)
      AND (IP* idoms verb-f-all)
      AND (IP* idoms PP*)
      AND (IP* idoms *)
      AND (* idoms non-pronominal)
      AND (nom-arg|nom-arg-moved precedes *)
      AND (* precedes PP*)
      AND (PP* precedes verb-f-all)
   5i3a: (CODING col 2 vf)
      AND (IP* idoms nom-arg|nom-arg-moved)
      AND (IP* idoms verb-f-all)
      AND (IP* idoms PP*)
      AND (IP* idoms *)
      AND (* idoms non-pronominal)
      AND (nom-arg|nom-arg-moved precedes verb-f-all)
      AND (verb-f-all precedes PP*)
      AND (PP* precedes *)
   5i3b: (CODING col 2 vf)
      AND (IP* idoms nom-arg|nom-arg-moved)
      AND (IP* idoms verb-f-all)
      AND (IP* idoms PP*)
      AND (IP* idoms *)
      AND (* idoms non-pronominal)
      AND (nom-arg|nom-arg-moved precedes verb-f-all)
      AND (verb-f-all precedes *)
      AND (* precedes PP*)
// any three (non-pronominal) constituents
   5f4: (CODING col 2 vf)
      AND (IP* idoms nom-arg|nom-arg-moved)
      AND (IP* idoms verb-f-all)
      AND (IP* idoms [1]*)
      AND (IP* idoms [2]*)
      AND (IP* idoms [3]*)
      AND ([1]* idoms [4]non-pronominal)
      AND ([2]* idoms [5]non-pronominal)
      AND ([3]* idoms [6]non-pronominal)
      AND (nom-arg|nom-arg-moved precedes [1]*)
      AND ([1]* precedes [2]*)
      AND ([2]* precedes [3]*)
      AND ([3]* precedes verb-f-all)
   5i4: (CODING col 2 vf)
       AND (IP* idoms nom-arg|nom-arg-moved)
       AND (IP* idoms verb-f-all)
       AND (IP* idoms [1]*)
       AND (IP* idoms [2]*)
       AND (IP* idoms [3]*)
       AND ([1]* idoms [4]non-pronominal)
       AND ([2]* idoms [5]non-pronominal)
       AND ([3]* idoms [6]non-pronominal)
       AND (nom-arg|nom-arg-moved precedes verb-f-all)
       AND (verb-f-all precedes [1]*)
       AND ([1]* precedes [2]*)
       AND ([2]* precedes [3]*)
   /: ELSE
}
