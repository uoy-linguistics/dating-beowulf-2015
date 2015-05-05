node: CP*

define: ../queries/defs.def

coding_query:

/* Date of a text, according to Zimmermann */

/* comment these out, they take too long

1: {
        \870: (coalex* inID)
        \870: (comarvel* inID)
        \870: (cochad* inID)
        \870: (cochristoph* inID)
        \870: (cosolsat2* inID)
        \870: (comart* inID)
        \880: (Chronicle1* inID)
        \891: (coprefcura*|cocura* inID)
        \895: (cobede* inID)
        \897: (coboeth* inID)
        \898: (coorosiu* inID)
        \899: (coprefsolilo*|cosolilo* inID)
        \900: (Charters1* inID)
        \910: (LeechEarly* inID)
        \930: (Chronicle2* inID)
        \940: (coherbar* inID)
        \940: (coquadru* inID)
        \945: (conicodA,Nic_[A]* inID)
        \945: (covinsal* inID)
        \950: (coblick* inID)
        \955: (coverhom* inID)
        \965: (cobenrul* inID)
        \980: (Charters2* inID)
        \985: (cochdrul* inID)
        \989: (comary* inID)
        \989: (coeuphr* inID)
        \989: (cosevensl* inID)
        \990: (cowsgosp* inID)
        \991: (coprefcath1*|cocathom1* inID)
        \991: (coaelhom* inID)
        \994: (coprefcath2*|cocathom2* inID)
        \995: (codicts* inID)
        \996: (cotempo* inID)
        \997: (copreflives*|coaelive* inID)
        \1000: (AelfLetters* inID)
        \1005: (OldTest* inID)
        \1007: (Chronicle3* inID)
        \1008: (coinspolX* inID)
        \1009: (LeechLate* inID)
        \1010: (cocanedgX* inID)
        \1010: (cowulf* inID)
        \1011: (cobyrhtf* inID)
        \1014: (colaw6atr* inID)
        \1020: (colacnu* inID)
        \1025: (coapollo* inID)
        \1030: (conicodD* inID)
        \1030: (corood* inID)
        \1030: (cojames* inID)
        \1030: (coeust* inID)
        \1030: (comargaT* inID)
        \1050: (Charters3* inID)
        \1060: (comargaC* inID)
        \1060: (coleofri* inID)
        \1065: (coneot* inID)
        \1070: (coalcuin* inID)
        \1101: (Chronicle4* inID)
}
*/

/* Text */

/*
2: {
        LetterAlexander: (coalex* inID)
        MarvelsEast: (comarvel* inID)
        SaintChat: (cochad* inID)
        SaintChristopher: (cochristoph* inID)
        SolomonSaturn: (cosolsat2* inID)
        Martyrology: (comart* inID)
        AngloSaxonChronicle1: (Chronicle1* inID)
        CuraPastoralis: (coprefcura*|cocura* inID)
        Bede: (cobede* inID)
        Boethius: (coboeth* inID)
        Orosius: (coorosiu* inID)
        AugustineSoliloquy: (coprefsolilo*|cosolilo* inID)
        Charters1: (Charters1* inID)
        LeechbookEarly: (LeechEarly* inID)
        AngloSaxonChronicle2: (Chronicle2* inID)
        Herbarium: (coherbar* inID)
        Quadrupedibus: (coquadru* inID)
        Nicodemus: (conicodA,Nic_[A]* inID)
        VindictaSalvatoris: (covinsal* inID)
        BlicklingHomilies: (coblick* inID)
        VercelliHomilies: (coverhom* inID)
        BenedictineRule: (cobenrul* inID)
        Charters2: (Charters2* inID)
        Chrodegang: (cochdrul* inID)
        MaryEgypt: (comary* inID)
        SaintEuphrosyne: (coeuphr* inID)
        SevenSleepers: (cosevensl* inID)
        WestSaxonGospels: (cowsgosp* inID)
        AelfricCatholicHomilies1: (coprefcath1*|cocathom1* inID)
        AelfricSupplemental: (coaelhom* inID)
        AelfricCatholicHomilies2: (coprefcath2*|cocathom2* inID)
        DistichsCato: (codicts* inID)
        AelfricTemporibus: (cotempo* inID)
        AelfricLivesSaints: (copreflives*|coaelive* inID)
        AelfricLetters: (AelfLetters* inID)
        AelfricOldTestament: (OldTest* inID)
        AngloSaxonChronicle3: (Chronicle3* inID)
        WulfstanInstitutes: (coinspolX* inID)
        LeechbookLate: (LeechLate* inID)
        WulfstanCanonsEdgar: (cocanedgX* inID)
        WulfstanHomilies: (cowulf* inID)
        ByhrtferthManual: (cobyrhtf* inID)
        WulfstanLawAethelredVI: (colaw6atr* inID)
        Lacnunga: (colacnu* inID)
        Apollonius: (coapollo* inID)
        DeAscensione: (conicodD* inID)
        HolyRoodTree: (corood* inID)
        JamesGreater: (cojames* inID)
        SaintEustaceCompanions: (coeust* inID)
        SaintMargaretTiberius: (comargaT* inID)
        Charters3: (Charters3* inID)
        SaintMargaretCorpus: (comargaC* inID)
        Leofric: (coleofri* inID)
        SaintNeot: (coneot* inID)
        AlcuinVirtutibus: (coalcuin* inID)
        AngloSaxonChronicle4: (Chronicle4* inID)

        X: ELSE
}
*/

/* Clause type */
3: {
   rel: CP-REL* isroot
   tht: CP-THT* isroot
   que: CP-QUE* isroot
   mat: CP-MAT* isroot
   inf: CP-INF* isroot
   adv: CP-ADV* isroot
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
   be: CP* idoms IP* AND IP* idoms be-f
   have: CP* idoms IP* AND IP* idoms have-f
   modal: CP* idoms IP* AND IP* idoms modal-f
   aux: CP* idoms IP* AND IP* idoms auxiliary-f
   lexical: CP* idoms IP* AND IP* idoms lexical-verb-f

   X: ELSE
}

/* Mood */
6: {
   subjunctive: CP* idoms IP* AND IP* idoms *BEPS|*BEDS|*HVPS|*HVDS|*MDPS|*MDDS|*AXPS|*AXDS|*VBPS|*VBDS
   indicative: CP* idoms IP* AND IP* idoms *BEPI|*BEDI|*HVPI|*HVDI|*MDPI|*MDDI|*AXPI|*AXDI|*VBPI|*VBDI
   ambig: CP* idoms IP* AND IP* idoms *BEP|*BED|*HVP|*HVD|*MDP|*MDD|*AXP|*AXD|*VBP|*VBD

   X: ELSE
}

/* Polairty */
7: {
   neg: CP* idoms IP* AND IP* idoms NEG|NEG+*
   pos: ELSE
}

/* TODO: conjoined clauses */
8: {
   _: ELSE
}

/* Genitive-noun order */
10: {

    /* we exclude nested genitives, on the hypothesis that something funny
       might be going on with them.
     */
    n-gen: (NP* idoms noun-not-genitive) AND
           (NP* idoms NP-GEN) AND
           (NP-GEN idoms N^G|NR^G) AND
           (noun-not-genitive precedes NP-GEN)
    gen-n: (NP* idoms noun-not-genitive) AND
           (NP* idoms NP-GEN) AND
           (NP-GEN idoms N^G|NR^G) AND
           (NP-GEN precedes noun-not-genitive)
}

/* Preposition object order */
11: {
    p-pro: PP* idoms P AND PP* idoms NP* AND NP* idomsonly PRO* AND
        P precedes NP*
    pro-p: PP* idoms P AND PP* idoms NP* AND NP* idomsonly PRO* AND
        NP* precedes P
}


/* first element */
15: {
    tha: CP* idomsfirst ADVP-TMP* AND ADVP-TMP* idomsonly THA
    nu:  CP* idomsfirst ADVP-TMP* AND ADVP-TMP* idomsonly NU
    swa: CP* idomsfirst ADVP-TMP* AND ADVP-TMP* idomsonly SWA
}

/* diagnostic elements + finite verb */

/* particles */
16: {
    infl-medial: CP* idoms IP* AND IP* idoms RP AND RP idoms diagnostic-part AND
        IP* idoms verb-f-all AND verb-f-all precedes RP
    infl-final: CP* idoms IP* AND IP* idoms RP AND RP idoms diagnostic-part AND
        IP* idoms verb-f-all AND RP precedes verb-f-all
}

/* stranded preposition */
17: {
    infl-medial: CP* idoms IP* AND IP* idoms PP* AND PP* idoms P AND PP* idoms \*T* AND
        IP* idoms verb-f-all AND verb-f-all precedes PP*
    infl-medial: CP* idoms IP* AND IP* idoms PP* AND PP* idoms P AND PP* idoms \*T* AND
        IP* idoms verb-f-all AND PP* precedes verb-f-all
}

/* negative objects */
18: {
    _: ELSE
}

/* pronominal objects */
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
