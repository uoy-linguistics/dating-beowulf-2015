begin_remark: coding RZ IP criteria. 16/07/15 1) included moved objects in IP4. 2) new definitions for subjects (nom-arg|nom-arg-moved) and objects (obl-arg-usable).  21/07/15: clean up nom-args.
end_remark
node: IP*
remove_nodes: t
nodes_only: t
ignore_nodes: \**|CODE|ID|'|\"|,|/|\.|FRAG|X|COMMENT|LB|BREAK|HL|LL|*PRN*|NEG|*VOC*

define: susan.def

coding_query:

// IP1, IP2 - position of diagnostics in clauses with finite main verbs
3: {
   -: NOT (CODING col 2 vf)

// particles
   3f1: (CODING col 2 vf)
      AND (IP* idoms nom-arg-usable)
      AND (IP* idoms verb-f-all)
      AND (IP* idoms RP|RPX)
      AND (nom-arg-usable precedes RP|RPX)
      AND (RP|RPX precedes verb-f-all)
      AND (RP|RPX iprecedes !PP*)
   3i1: (CODING col 2 vf)
      AND (IP* idoms nom-arg-usable)
      AND (IP* idoms verb-f-all)
      AND (IP* idoms RP|RPX)
      AND (nom-arg-usable precedes verb-f-all)
      AND (verb-f-all precedes RP|RPX)
      AND (RP|RPX iprecedes !PP*)
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
      AND (obl-arg-usable idomsmod QP* NEG+Q*)
      AND (nom-arg-usable precedes obl-arg-usable)
      AND (obl-arg-usable precedes verb-f-all)
   3i3: (CODING col 2 vf)
      AND (IP* idoms nom-arg-usable)
      AND (IP* idoms verb-f-all)
      AND (IP* idoms obl-arg-usable)
      AND (obl-arg-usable idomsmod QP* NEG+Q*)
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

// self

// See the remarks in coding-vp.c as to why there are two cases per condition here

   3f6: (CODING col 2 vf)
      AND (IP* idoms nom-arg-usable)
      AND (IP* idoms verb-f-all)
      AND (IP* idoms ADJP*)
      AND (ADJP* idomsonly ADJ*)
      AND (ADJ* idomsonly SELF)
      AND (nom-arg-usable precedes ADJP*)
      AND (ADJP* precedes verb-f-all)

   3f6: (CODING col 2 vf)
      AND (IP* idoms nom-arg-usable)
      AND (IP* idoms verb-f-all)
      AND (IP* idoms obl-arg-usable)
      AND (obl-arg-usable idoms ADJP*)
      AND (obl-arg-usable idomswords< 3)
      AND (ADJP* idomsonly ADJ*)
      AND (ADJ* idomsonly SELF)
      AND (nom-arg-usable precedes ADJP*)
      AND (ADJP* precedes verb-f-all)

   3i6: (CODING col 2 vf)
      AND (IP* idoms nom-arg-usable)
      AND (IP* idoms verb-f-all)
      AND (IP* idoms ADJP*)
      AND (ADJP* idomsonly ADJ*)
      AND (ADJ* idomsonly SELF)
      AND (nom-arg-usable precedes verb-f-all)
      AND (verb-f-all precedes ADJP*)

   3i6: (CODING col 2 vf)
      AND (IP* idoms nom-arg-usable)
      AND (IP* idoms verb-f-all)
      AND (IP* idoms obl-arg-usable)
      AND (obl-arg-usable idoms ADJP*)
      AND (obl-arg-usable idomswords< 3)
      AND (ADJP* idomsonly ADJ*)
      AND (ADJ* idomsonly SELF)
      AND (nom-arg-usable precedes verb-f-all)
      AND (verb-f-all precedes ADJP*)

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
   // NB Susan: the two clauses I told you I added to this query are below. -AE
   4f2: (IP* idoms nom-arg-usable)
      AND (IP* idoms verb-f-all)
      AND (IP* idoms verb-nf-all|IP-INF*)
      AND (nom-arg-usable precedes verb-nf-all|IP-INF*)
      AND (verb-nf-all|IP-INF* precedes verb-f-all)
   4i2: (IP* idoms nom-arg-usable)
      AND (IP* idoms verb-f-all)
      AND (IP* idoms verb-nf-all|IP-INF*)
      AND (nom-arg-usable precedes verb-f-all)
      AND (verb-f-all precedes verb-nf-all|IP-INF*)
   /: ELSE
}

//IP4 - position of heavy argument in clauses with finite main verbs
5: {

   -: NOT (CODING col 2 vf)

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
