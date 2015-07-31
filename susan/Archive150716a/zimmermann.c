3: {
// RZ 1
   f: (IP* idoms nom-arg)
      AND (IP* idoms verb-f-all)
      AND (IP* idoms obl-arg)
      AND (obl-arg idoms !NEG*|Q*|PRO^*|PRO)
      AND (nom-arg precedes obl-arg)
      AND (obl-arg precedes verb-f-all)
// RZ 2
   f: (IP* idoms nom-arg)
      AND (IP* idoms verb-f-all)
      AND (IP* idoms v-nf-all|IP-INF*|IP-SMC*)
      AND (nom-arg precedes v-nf-all|IP-INF*|IP-SMC*)
      AND (v-nf-all|IP-INF*|IP-SMC* precedes verb-f-all)
// RZ 3
   f: (IP* idoms nom-arg)
      AND (IP* idoms verb-f-all)
      AND (IP* idoms *P*)
      AND (IP* idoms PP*)
      AND (PP* domswords> 1)
      AND (nom-arg precedes *P*)
      AND (nom-arg precedes PP)
      AND (*P* precedes verb-f-all)
      AND (PP precedes verb-f-all)
// RZ 4-5
   f: (IP* idoms nom-arg)
      AND (IP* idoms verb-f-all)
      AND (IP* idoms ADJP*|RP)
      AND (nom-arg precedes ADJP*|RP)
      AND (ADJP*|RP precedes verb-f-all)
// RZ 6
   f: (IP* idoms nom-arg)
      AND (IP* idoms verb-f-all)
      AND (IP* idoms PP*)
      AND (PP* idomsonly P)
      AND (nom-arg precedes PP*)
      AND (PP* precedes verb-f-all)
// RZ 7
   f: (IP* idoms nom-arg)
      AND (IP* idoms verb-f-all)
      AND (IP* idoms [1]*)
      AND (IP* idoms [2]*)
      AND (IP* idoms [3]*)
      AND (nom-arg precedes [1]*)
      AND (nom-arg precedes [2]*)
      AND (nom-arg precedes [3]*)
      AND ([1]* precedes verb-f-all)
      AND ([2]* precedes verb-f-all)
      AND ([3]* precedes verb-f-all)
   i: ELSE