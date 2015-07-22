begin_remark: coding RZ VP criteria. 16/07/15: 1) included moved objects in VP1 and VP2. In VP2, objects must be adjacent to non-finite verb. 2) new definitions for subjects (nom-arg|nom-arg-moved) and objects (obl-arg-usable) 3) permit non-adjacency in VP2 if relevant object is separated from verb by another object. 21/07/15: clean up nom-args.
end_remark
node: IP*
remove_nodes: t
nodes_only: t
ignore_nodes: \**|CODE|ID|'|\"|,|/|\.|FRAG|X|COMMENT|LB|BREAK|HL|LL|*PRN*|*VOC*

coding_query: 

// VP1 - position of diagnostics in clauses with aux and main verb
6: {
// particles
   6f1: (CODING col 2 auxv)
      AND (IP* idoms nom-arg-usable)
      AND (IP* idoms verb-f-all)
      AND (IP* idoms verb-nf-all)
      AND (IP* idoms RP)
      AND (nom-arg-usable precedes verb-f-all)
      AND (verb-f-all precedes RP)
      AND (RP precedes verb-nf-all)
      AND (RP iprecedes !PP*)
   6i1: (CODING col 2 auxv)
      AND (IP* idoms nom-arg-usable)
      AND (IP* idoms verb-f-all)
      AND (IP* idoms verb-nf-all)
      AND (IP* idoms RP)
      AND (nom-arg-usable precedes verb-f-all)
      AND (verb-f-all precedes verb-nf-all)
      AND (verb-nf-all precedes RP)
      AND (RP iprecedes !PP*)
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
      AND (obl-arg-usable idoms NEG+N*|NEG+Q*)
      AND (nom-arg-usable precedes verb-f-all)
      AND (verb-f-all precedes obl-arg-usable)
      AND (obl-arg-usable precedes verb-nf-all)
   6i3: (CODING col 2 auxv)
      AND (IP* idoms nom-arg-usable)
      AND (IP* idoms verb-f-all)
      AND (IP* idoms verb-nf-all)
      AND (IP* idoms obl-arg-usable)
      AND (obl-arg-usable idoms NEG+N*|NEG+Q*)
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
   /: ELSE
}

7: {
// positive two-word objects
// object can be separated from the verb only by another object
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
