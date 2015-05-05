node: CP*

define: ../queries/defs.def

coding_query:

10: {

    /* We exclude nested genitives, on the hypothesis that something funny
       might be going on with them.  We also implicitly exclude NP-GEN-PRN,
       since these will not reflect the base order.
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
