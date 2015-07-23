begin_remark: coding RZ IP criteria. 16/07/15 1) included moved objects in IP4. 2) new definitions for subjects (nom-arg|nom-arg-moved) and objects (obl-arg-usable).  21/07/15: clean up nom-args.
end_remark
node: IP*
remove_nodes: t
nodes_only: t
ignore_nodes: \**|CODE|ID|'|\"|,|/|\.|FRAG|X|COMMENT|LB|BREAK|HL|LL|*PRN*|NEG|*VOC*

coding_query:

// IP1, IP2 - position of diagnostics in clauses with finite main verbs
3: {
// particles
   3f1: (CODING col 2 vf)
      AND (IP* idoms nom-arg-usable)
      AND (IP* idoms verb-f-all)
      AND (IP* idoms RP)
      AND (nom-arg-usable precedes RP)
      AND (RP precedes verb-f-all)
      AND (RP iprecedes !PP*)
   3i1: (CODING col 2 vf)
      AND (IP* idoms nom-arg-usable)
      AND (IP* idoms verb-f-all)
      AND (IP* idoms RP)
      AND (nom-arg-usable precedes verb-f-all)
      AND (verb-f-all precedes RP)
      AND (RP iprecedes !PP*)
// stranded prepositions
   3f2: (CODING col 2 vf)
      AND (IP* idoms nom-arg-usable)
      AND (IP* idoms verb-f-all)
      AND (IP* idoms PP*)
      AND (PP* idomsonly P)
      AND (nom-arg-usable precedes PP*)
      AND (PP* precedes verb-f-all)
   3i2: (CODING col 2 vf)
      AND (IP* idoms nom-arg-usable)
      AND (IP* idoms verb-f-all)
      AND (IP* idoms PP*)
      AND (PP* idomsonly P)
      AND (nom-arg-usable precedes verb-f-all)
      AND (verb-f-all precedes PP*)
// negative np's
   3f3: (CODING col 2 vf)
      AND (IP* idoms nom-arg-usable)
      AND (IP* idoms verb-f-all)
      AND (IP* idoms obl-arg-usable)
      AND (obl-arg-usable idoms NEG+N*|NEG+Q*)
      AND (nom-arg-usable precedes obl-arg-usable)
      AND (obl-arg-usable precedes verb-f-all)
   3i3: (CODING col 2 vf)
      AND (IP* idoms nom-arg-usable)
      AND (IP* idoms verb-f-all)
      AND (IP* idoms obl-arg-usable)
      AND (obl-arg-usable idoms NEG+N*|NEG+Q*)
      AND (nom-arg-usable precedes verb-f-all)
      AND (verb-f-all precedes obl-arg-usable)
// negative advp's
   3f4: (CODING col 2 vf)
      AND (IP* idoms nom-arg-usable)
      AND (IP* idoms verb-f-all)
      AND (IP* idoms ADVP*)
      AND (ADVP* idoms NEG+ADV*)
      AND (nom-arg-usable precedes ADVP*)
      AND (ADVP* precedes verb-f-all)
   3i4: (CODING col 2 vf)
      AND (IP* idoms nom-arg-usable)
      AND (IP* idoms verb-f-all)
      AND (IP* idoms ADVP*)
      AND (ADVP* idoms NEG+ADV*)
      AND (nom-arg-usable precedes verb-f-all)
      AND (verb-f-all precedes ADVP*)
// pronominal objects
   3f5: (CODING col 2 vf)
      AND (IP* idoms nom-arg-usable)
      AND (IP* idoms verb-f-all)
      AND (IP* idoms obl-arg-usable)
      AND (obl-arg-usable idomsonly PRO|PRO^*)
      AND (nom-arg-usable precedes obl-arg-usable)
      AND (obl-arg-usable precedes verb-f-all)
   3i5: (CODING col 2 vf)
      AND (IP* idoms nom-arg-usable)
      AND (IP* idoms verb-f-all)
      AND (IP* idoms obl-arg-usable)
      AND (obl-arg-usable idomsonly PRO|PRO^*)
      AND (nom-arg-usable precedes verb-f-all)
      AND (verb-f-all precedes obl-arg-usable)
   /: ELSE
}

// IP3 - order of finite aux and non-finite main verb
4: {
   4f: (CODING col 2 auxv|vaux)
      AND (IP* idoms nom-arg-usable)
      AND (IP* idoms verb-f-all)
      AND (IP* idoms verb-nf-all|IP-INF*)
      AND (nom-arg-usable precedes verb-nf-all|IP-INF*)
      AND (verb-nf-all|IP-INF* precedes verb-f-all)
   4i: (CODING col 2 auxv|vaux)
      AND (IP* idoms nom-arg-usable)
      AND (IP* idoms verb-f-all)
      AND (IP* idoms verb-nf-all|IP-INF*)
      AND (nom-arg-usable precedes verb-f-all)
      AND (verb-f-all precedes verb-nf-all|IP-INF*)
   /: ELSE
}

//IP4 - position of heavy argument in clauses with finite main verbs
5: {
// DP argument; note that DPs with indices are included
   5f: (CODING col 2 vf)
      AND (IP* idoms nom-arg-usable)
      AND (IP* idoms verb-f-all)
      AND (IP* idoms obl-arg-usable|*PRD*)
      AND (obl-arg-usable|*PRD* idoms non-pronominal)
      AND (nom-arg-usable precedes obl-arg-usable|*PRD*)
      AND (obl-arg-usable|*PRD* precedes verb-f-all)
   5i: (CODING col 2 vf)
      AND (IP* idoms nom-arg-usable)
      AND (IP* idoms verb-f-all)
      AND (IP* idoms obl-arg-usable|*PRD*)
      AND (obl-arg-usable|*PRD* idoms non-pronominal)
      AND (nom-arg-usable precedes verb-f-all)
      AND (verb-f-all precedes obl-arg-usable|*PRD*)
   /: ELSE
}
