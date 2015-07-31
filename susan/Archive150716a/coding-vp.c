begin_remark: coding RZ VP criteria. 16/07/15: included moved objects in VP1 and VP2. In VP2, objects must be adjacent to non-finite verb.
end_remark
node: IP*
remove_nodes: t
nodes_only: t
ignore_nodes: \**|CODE|ID|'|\"|,|/|\.|FRAG|X|COMMENT|LB|BREAK|HL|LL|*PRN*|VOC

coding_query: 

// VP1 - position of diagnostics in clauses with aux and main verb
6: {
// particles
   6f1: (CODING col 2 auxv)
      AND (IP* idoms nom-arg)
      AND (IP* idoms verb-f-all)
      AND (IP* idoms v-nf-all)
      AND (IP* idoms RP)
      AND (nom-arg precedes verb-f-all)
      AND (verb-f-all precedes RP)
      AND (RP precedes v-nf-all)
      AND (RP iprecedes !PP*)
   6i1: (CODING col 2 auxv)
      AND (IP* idoms nom-arg)
      AND (IP* idoms verb-f-all)
      AND (IP* idoms v-nf-all)
      AND (IP* idoms RP)
      AND (nom-arg precedes verb-f-all)
      AND (verb-f-all precedes v-nf-all)
      AND (v-nf-all precedes RP)
      AND (RP iprecedes !PP*)
// stranded prepositions
   6f2: (CODING col 2 auxv)
      AND (IP* idoms nom-arg)
      AND (IP* idoms verb-f-all)
      AND (IP* idoms v-nf-all)
      AND (IP* idoms PP*)
      AND (PP* idomsonly P)
      AND (nom-arg precedes verb-f-all)
      AND (verb-f-all precedes PP*)
      AND (PP* precedes v-nf-all)
   6i2: (CODING col 2 auxv)
      AND (IP* idoms nom-arg)
      AND (IP* idoms verb-f-all)
      AND (IP* idoms v-nf-all)
      AND (IP* idoms PP*)
      AND (PP* idomsonly P)
      AND (nom-arg precedes verb-f-all)
      AND (verb-f-all precedes v-nf-all)
      AND (v-nf-all precedes PP*)
// negative np's
   6f3: (CODING col 2 auxv)
      AND (IP* idoms nom-arg)
      AND (IP* idoms verb-f-all)
      AND (IP* idoms v-nf-all)
      AND (IP* idoms obl-arg)
      AND (obl-arg idoms NEG+N*|NEG+Q*)
      AND (nom-arg precedes verb-f-all)
      AND (verb-f-all precedes obl-arg)
      AND (obl-arg precedes v-nf-all)
   6i3: (CODING col 2 auxv)
      AND (IP* idoms nom-arg)
      AND (IP* idoms verb-f-all)
      AND (IP* idoms v-nf-all)
      AND (IP* idoms obl-arg)
      AND (obl-arg idoms NEG+N*|NEG+Q*)
      AND (nom-arg precedes verb-f-all)
      AND (verb-f-all precedes v-nf-all)
      AND (v-nf-all precedes obl-arg)
// negative adv's
   6f4: (CODING col 2 auxv)
      AND (IP* idoms nom-arg)
      AND (IP* idoms verb-f-all)
      AND (IP* idoms v-nf-all)
      AND (IP* idoms ADVP*)
      AND (ADVP* idoms NEG+ADV*)
      AND (nom-arg precedes verb-f-all)
      AND (verb-f-all precedes ADVP*)
      AND (ADVP* precedes v-nf-all)
   6i4: (CODING col 2 auxv)
      AND (IP* idoms nom-arg)
      AND (IP* idoms verb-f-all)
      AND (IP* idoms v-nf-all)
      AND (IP* idoms ADVP*)
      AND (ADVP* idoms NEG+ADV*)
      AND (nom-arg precedes verb-f-all)
      AND (verb-f-all precedes v-nf-all)
      AND (v-nf-all precedes ADVP*)
// pronominal np's
   6f5: (CODING col 2 auxv)
      AND (IP* idoms nom-arg)
      AND (IP* idoms verb-f-all)
      AND (IP* idoms v-nf-all)
      AND (IP* idoms obl-arg)
      AND (obl-arg idomsonly PRO|PRO^*)
      AND (nom-arg precedes verb-f-all)
      AND (verb-f-all precedes obl-arg)
      AND (obl-arg precedes v-nf-all)
   6i5: (CODING col 2 auxv)
      AND (IP* idoms nom-arg)
      AND (IP* idoms verb-f-all)
      AND (IP* idoms v-nf-all)
      AND (IP* idoms obl-arg)
      AND (obl-arg idomsonly PRO|PRO^*) 
      AND (nom-arg precedes verb-f-all)
      AND (verb-f-all precedes v-nf-all)
      AND (v-nf-all precedes obl-arg)
   /: ELSE
}

7: {
// positive two-word objects
   7f: (CODING col 2 auxv)
      AND (IP* idoms nom-arg)
      AND (IP* idoms verb-f-all)
      AND (IP* idoms v-nf-all)
      AND (IP* idoms obl-arg)
      AND (obl-arg domswords 2)
      AND (obl-arg idoms !NEG*|Q*|CP*)
      AND (nom-arg precedes verb-f-all)
      AND (verb-f-all precedes obl-arg)
      AND (obl-arg iprecedes v-nf-all)
   7i: (CODING col 2 auxv)
      AND (IP* idoms nom-arg)
      AND (IP* idoms verb-f-all)
      AND (IP* idoms v-nf-all)
      AND (IP* idoms obl-arg)
      AND (obl-arg domswords 2)
      AND (obl-arg idoms !NEG*|Q*|CP*)
      AND (nom-arg precedes verb-f-all)
      AND (verb-f-all precedes v-nf-all)
      AND (v-nf-all iprecedes obl-arg)
   /: ELSE
    }