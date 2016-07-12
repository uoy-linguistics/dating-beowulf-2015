begin_remark: coding RZ VP criteria. 16/07/15: 1) included moved objects in VP1 and VP2. In VP2, objects must be adjacent to non-finite verb. 2) new definitions for subjects (nom-arg|nom-arg-moved) and objects (obl-arg-usable) 3) permit non-adjacency in VP2 if relevant object is separated from verb by another object. 21/07/15: clean up nom-args.
end_remark
node: IP*
remove_nodes: t
nodes_only: t
ignore_nodes: \**|CODE|ID|'|\"|,|/|\.|FRAG|X|COMMENT|LB|BREAK|HL|LL|*PRN*|*VOC*

define: susan.def

coding_query:

// VP1 - position of diagnostics in clauses with aux and main verb
6: {
   -: NOT (CODING col 2 auxv)

// particles
   6f1: (CODING col 2 auxv)
      AND (IP* idoms nom-arg-usable)
      AND (IP* idoms verb-f-all)
      AND (IP* idoms verb-nf-all)
      AND (IP* idoms RP|RPX)
      AND (nom-arg-usable precedes verb-f-all)
      AND (verb-f-all precedes RP|RPX)
      AND (RP|RPX precedes verb-nf-all)
      AND (RP|RPX iprecedes !PP*)
   6i1: (CODING col 2 auxv)
      AND (IP* idoms nom-arg-usable)
      AND (IP* idoms verb-f-all)
      AND (IP* idoms verb-nf-all)
      AND (IP* idoms RP|RPX)
      AND (nom-arg-usable precedes verb-f-all)
      AND (verb-f-all precedes verb-nf-all)
      AND (verb-nf-all precedes RP|RPX)
      AND (RP|RPX iprecedes !PP*)
// stranded prepositions
   6f2: (CODING col 2 auxv)
      AND (IP* idoms nom-arg-usable)
      AND (IP* idoms verb-f-all)
      AND (IP* idoms verb-nf-all)
      AND (IP* idoms PP*)
      AND (PP* idomsonly P)
      AND (nom-arg-usable precedes verb-f-all)
      AND (verb-f-all precedes PP*)
      AND (PP* precedes verb-nf-all)
   6i2: (CODING col 2 auxv)
      AND (IP* idoms nom-arg-usable)
      AND (IP* idoms verb-f-all)
      AND (IP* idoms verb-nf-all)
      AND (IP* idoms PP*)
      AND (PP* idomsonly P)
      AND (nom-arg-usable precedes verb-f-all)
      AND (verb-f-all precedes verb-nf-all)
      AND (verb-nf-all precedes PP*)
// negative np's
   6f3: (CODING col 2 auxv)
      AND (IP* idoms nom-arg-usable)
      AND (IP* idoms verb-f-all)
      AND (IP* idoms verb-nf-all)
      AND (IP* idoms obl-arg-usable)
      AND (obl-arg-usable idomsmod QP* NEG+Q*)
      AND (nom-arg-usable precedes verb-f-all)
      AND (verb-f-all precedes obl-arg-usable)
      AND (obl-arg-usable precedes verb-nf-all)
   6i3: (CODING col 2 auxv)
      AND (IP* idoms nom-arg-usable)
      AND (IP* idoms verb-f-all)
      AND (IP* idoms verb-nf-all)
      AND (IP* idoms obl-arg-usable)
      AND (obl-arg-usable idomsmod QP* NEG+Q*)
      AND (nom-arg-usable precedes verb-f-all)
      AND (verb-f-all precedes verb-nf-all)
      AND (verb-nf-all precedes obl-arg-usable)
// negative adv's
   6f4: (CODING col 2 auxv)
      AND (IP* idoms nom-arg-usable)
      AND (IP* idoms verb-f-all)
      AND (IP* idoms verb-nf-all)
      AND (IP* idoms ADVP*)
      AND (ADVP* idoms NEG+ADV*)
      AND (nom-arg-usable precedes verb-f-all)
      AND (verb-f-all precedes ADVP*)
      AND (ADVP* precedes verb-nf-all)
   6i4: (CODING col 2 auxv)
      AND (IP* idoms nom-arg-usable)
      AND (IP* idoms verb-f-all)
      AND (IP* idoms verb-nf-all)
      AND (IP* idoms ADVP*)
      AND (ADVP* idoms NEG+ADV*)
      AND (nom-arg-usable precedes verb-f-all)
      AND (verb-f-all precedes verb-nf-all)
      AND (verb-nf-all precedes ADVP*)
// pronominal np's
   6f5: (CODING col 2 auxv)
      AND (IP* idoms nom-arg-usable)
      AND (IP* idoms verb-f-all)
      AND (IP* idoms verb-nf-all)
      AND (IP* idoms obl-arg-usable)
      AND (obl-arg-usable idomsonly PRO|PRO^*)
      AND (nom-arg-usable precedes verb-f-all)
      AND (verb-f-all precedes obl-arg-usable)
      AND (obl-arg-usable precedes verb-nf-all)
   6i5: (CODING col 2 auxv)
      AND (IP* idoms nom-arg-usable)
      AND (IP* idoms verb-f-all)
      AND (IP* idoms verb-nf-all)
      AND (IP* idoms obl-arg-usable)
      AND (obl-arg-usable idomsonly PRO|PRO^*)
      AND (nom-arg-usable precedes verb-f-all)
      AND (verb-f-all precedes verb-nf-all)
      AND (verb-nf-all precedes obl-arg-usable)

// self

// We need two cases per condition (Infl-medial/-final) here.  The first
// is where the IP is the direct mother of the ADJP.  The second is
// where the IP dominates an NP, which contains the ADJP.  In the latter
// case, rarely, the NP can contain additional material (e.g. an appositive).
// We should not treat such cases as diagnostics, so we restrict to
// maximally 2-word NPs -- the self and possibly a pronoun (though we don't
// force the second word to necessarily be a pronoun, both because I couldn't
// see how to write such a query without making three cases, which would be a
// bit much; and because such cases don't seem to actually happen.)

   6f6: (CODING col 2 auxv)
      AND (IP* idoms nom-arg-usable)
      AND (IP* idoms verb-f-all)
      AND (IP* idoms verb-nf-all)
      AND (IP* idoms ADJP*)
      AND (ADJP* idomsonly ADJ*)
      AND (ADJ* idomsonly SELF)
      AND (nom-arg-usable precedes verb-f-all)
      AND (verb-f-all precedes ADJP*)
      AND (ADJP* precedes verb-nf-all)

   6f6: (CODING col 2 auxv)
      AND (IP* idoms nom-arg-usable)
      AND (IP* idoms verb-f-all)
      AND (IP* idoms verb-nf-all)
      AND (IP* idoms obl-arg-usable)
      AND (obl-arg-usable idoms ADJP*)
      AND (obl-arg-usable domswords< 3)
      AND (ADJP* idomsonly ADJ*)
      AND (ADJ* idomsonly SELF)
      AND (nom-arg-usable precedes verb-f-all)
      AND (verb-f-all precedes ADJP*)
      AND (ADJP* precedes verb-nf-all)

   6i6: (CODING col 2 auxv)
      AND (IP* idoms nom-arg-usable)
      AND (IP* idoms verb-f-all)
      AND (IP* idoms verb-nf-all)
      AND (IP* idoms ADJP*)
      AND (ADJP* idomsonly ADJ*)
      AND (ADJ* idomsonly SELF)
      AND (nom-arg-usable precedes verb-f-all)
      AND (verb-f-all precedes verb-nf-all)
      AND (verb-nf-all precedes ADJP*)

   6i6: (CODING col 2 auxv)
      AND (IP* idoms nom-arg-usable)
      AND (IP* idoms verb-f-all)
      AND (IP* idoms verb-nf-all)
      AND (IP* idoms obl-arg-usable)
      AND (obl-arg-usable idoms ADJP*)
      AND (obl-arg-usable domswords< 3)
      AND (ADJP* idomsonly ADJ*)
      AND (ADJ* idomsonly SELF)
      AND (nom-arg-usable precedes verb-f-all)
      AND (verb-f-all precedes verb-nf-all)
      AND (verb-nf-all precedes ADJP*)

   /: ELSE
}

7: {
// positive two-word objects
// object can be separated from the verb only by another object

   -: NOT (CODING col 2 auxv)

   7f1: (CODING col 2 auxv)
      AND (IP* idoms nom-arg-usable)
      AND (IP* idoms verb-f-all)
      AND (IP* idoms verb-nf-all)
      AND (IP* idoms [1]obl-arg-usable)
      AND ([1]obl-arg-usable domswords 2)
      AND ([1]obl-arg-usable idoms !NEG*|Q*|CP*)
      AND (IP* idoms [2]obl-arg-usable)
      AND (nom-arg-usable precedes verb-f-all)
      AND (verb-f-all precedes [1]obl-arg-usable)
      AND ([1]obl-arg-usable iprecedes [2]obl-arg-usable)
      AND ([2]obl-arg-usable iprecedes verb-nf-all)
   7f2: (CODING col 2 auxv)
      AND (IP* idoms nom-arg-usable)
      AND (IP* idoms verb-f-all)
      AND (IP* idoms verb-nf-all)
      AND (IP* idoms obl-arg-usable)
      AND (obl-arg-usable domswords 2)
      AND (obl-arg-usable idoms !NEG*|Q*|CP*)
      AND (nom-arg-usable precedes verb-f-all)
      AND (verb-f-all precedes obl-arg-usable)
      AND (obl-arg-usable iprecedes verb-nf-all)
   7i1: (CODING col 2 auxv)
      AND (IP* idoms nom-arg-usable)
      AND (IP* idoms verb-f-all)
      AND (IP* idoms verb-nf-all)
      AND (IP* idoms [1]obl-arg-usable)
      AND ([1]obl-arg-usable domswords 2)
      AND ([1]obl-arg-usable idoms !NEG*|Q*|CP*)
      AND (IP* idoms [2]obl-arg-usable)
      AND (nom-arg-usable precedes verb-f-all)
      AND (verb-f-all precedes verb-nf-all)
      AND (verb-nf-all iprecedes [2]obl-arg-usable)
      AND ([2]obl-arg-usable iprecedes [1]obl-arg-usable)
   7i2: (CODING col 2 auxv)
      AND (IP* idoms nom-arg-usable)
      AND (IP* idoms verb-f-all)
      AND (IP* idoms verb-nf-all)
      AND (IP* idoms obl-arg-usable)
      AND (obl-arg-usable domswords 2)
      AND (obl-arg-usable idoms !NEG*|Q*|CP*)
      AND (nom-arg-usable precedes verb-f-all)
      AND (verb-f-all precedes verb-nf-all)
      AND (verb-nf-all iprecedes obl-arg-usable)
   /: ELSE
    }
