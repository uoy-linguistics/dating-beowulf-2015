node: CP*

define: ../queries/defs.def

coding_query:

/* Clause type */
3: {
   imp: CP-MAT* isroot AND CP-MAT* idoms IP-MAT* AND IP-MAT* idoms imperative
   mat: CP-MAT* isroot

   adv: CP-ADV* isroot
   rel: CP-REL* isroot
   tht: CP-THT* isroot

   que: CP-QUE* isroot
   inf: CP-INF* isroot
   frl: CP-FRL* isroot
   cmp: CP-CMP* isroot
   eop: CP-EOP* isroot
   deg: CP-DEG* isroot


   X: ELSE
}

/* Verb-first clauses */
4: {
   v1: CP* idoms IP* AND IP* idomsfirst verb-f-all
   _: ELSE
}

/* Finite verb type */
5: {
   lexical: CP* idoms IP* AND IP* idoms lexical-verb-f
   be: CP* idoms IP* AND IP* idoms be-f
   have: CP* idoms IP* AND IP* idoms have-f
   modal: CP* idoms IP* AND IP* idoms modal-f
   aux: CP* idoms IP* AND IP* idoms auxiliary-f

   X: ELSE
}

/* Mood */
6: {
   indicative: CP* idoms IP* AND IP* idoms *BEPI|*BEDI|*HVPI|*HVDI|*MDPI|*MDDI|*AXPI|*AXDI|*VBPI|*VBDI
   ambig: CP* idoms IP* AND IP* idoms *BEP|*BED|*HVP|*HVD|*MDP|*MDD|*AXP|*AXD|*VBP|*VBD
   subjunctive: CP* idoms IP* AND IP* idoms *BEPS|*BEDS|*HVPS|*HVDS|*MDPS|*MDDS|*AXPS|*AXDS|*VBPS|*VBDS

   X: ELSE
}

/* Polarity */
7: {
   neg: CP* idoms IP* AND IP* idoms NEG|NEG+*
   pos: ELSE
}

/* Column 8, conjoined clauses: see conj.c */

/* Genitive-noun order */
10: {

    /* we exclude nested genitives, on the hypothesis that something
       funny might be going on with them.  Thus also with parenthetical
       (-PRN) and extent (-EXT) genitives, but temporal ones (-TMP) are
       included.
      */

    n-gen: (NP* idoms noun-not-genitive) AND
           (NP* idoms np-genitive) AND
           (np-genitive idoms noun-genitive) AND
           (noun-not-genitive precedes np-genitive)
    gen-n: (NP* idoms noun-not-genitive) AND
           (NP* idoms np-genitive) AND
           (np-genitive idoms noun-genitive) AND
           (np-genitive precedes noun-not-genitive)
}

/* Preposition object order */
/*
11: {
    p-pro: PP* idoms P AND PP* idoms NP* AND NP* idomsonly PRO* AND
        P precedes NP*
    pro-p: PP* idoms P AND PP* idoms NP* AND NP* idomsonly PRO* AND
        NP* precedes P
}
*/


/* first element */
15: {
    tha: CP* idomsfirst ADVP-TMP* AND ADVP-TMP* idomsonly ADV* AND ADV* idomsonly THA
    tha: IP* idomsfirst ADVP-TMP* AND ADVP-TMP* idomsonly ADV* AND ADV* idomsonly THA
    nu:  CP* idomsfirst ADVP-TMP* AND ADVP-TMP* idomsonly ADV* AND ADV* idomsonly NU
    nu:  IP* idomsfirst ADVP-TMP* AND ADVP-TMP* idomsonly ADV* AND ADV* idomsonly NU
    swa: CP* idomsfirst ADVP-TMP* AND ADVP-TMP* idomsonly ADV* AND ADV* idomsonly SWA
    swa: IP* idomsfirst ADVP-TMP* AND ADVP-TMP* idomsonly ADV* AND ADV* idomsonly SWA
}

/* diagnostic elements + finite verb */

/* particles */
16: {
    discard: CP* idoms IP* AND IP* idoms RP AND RP idoms diagnostic-part AND
        IP* idoms VAG|VBN AND RP iprecedes VAG|VBN
    infl-medial: CP* idoms IP* AND IP* idoms RP AND RP idoms diagnostic-part AND
        IP* idoms verb-f-all AND verb-f-all precedes RP
    infl-final: CP* idoms IP* AND IP* idoms RP AND RP idoms diagnostic-part AND
        IP* idoms verb-f-all AND RP precedes verb-f-all
}

/* stranded preposition */
17: {
    infl-medial: CP* idoms IP* AND IP* doms PP* AND PP* idoms P AND PP* idoms NP* AND
        NP* idoms \*T* AND
        IP* idoms verb-f-all AND verb-f-all precedes PP*
    infl-final: CP* idoms IP* AND IP* doms PP* AND PP* idoms P AND PP* idoms NP* AND
        NP* idoms \*T* AND
        IP* idoms verb-f-all AND PP* precedes verb-f-all
}

/* TODO negative objects */
18: {
    _: ELSE
}

/* pronominal objects */

/*

19: {
    /* dative */
    infl-medial: CP* idoms IP* AND IP* idoms NP-DAT* AND NP-DAT* idomsonly PRO^D AND
        IP* idoms verb-f-all AND verb-f-all precedes NP-DAT*
    infl-final: CP* idoms IP* AND IP* idoms NP-DAT* AND NP-DAT* idomsonly PRO^D AND
        IP* idoms verb-f-all AND NP-DAT* precedes verb-f-all

    /* accusative */
    infl-medial: CP* idoms IP* AND IP* idoms NP-ACC* AND NP-ACC* idomsonly PRO^A AND
        IP* idoms verb-f-all AND verb-f-all precedes NP-ACC*
    infl-final: CP* idoms IP* AND IP* idoms NP-ACC* AND NP-ACC* idomsonly PRO^A AND
        IP* idoms verb-f-all AND NP-ACC* precedes verb-f-all
}

*/

/* infl headedness without considering the Pintzuk and Haeberli list cf col 16 */
25: {
    discard: CP* idoms IP* AND IP* idoms RP AND
        IP* idoms VAG|VBN AND RP iprecedes VAG|VBN
    infl-medial: CP* idoms IP* AND IP* idoms RP AND
        IP* idoms verb-f-all AND verb-f-all precedes RP
    infl-final: CP* idoms IP* AND IP* idoms RP AND
        IP* idoms verb-f-all AND RP precedes verb-f-all
}

30: {
    _: ELSE
}
