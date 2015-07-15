node: CP*

define: ../queries/defs.def

coding_query:

/* particles */

25: {
    discard: CP* idoms IP* AND IP* idoms RP AND
        IP* idoms VAG|VBN AND RP iprecedes VAG|VBN
    infl-medial: CP* idoms IP* AND IP* idoms RP AND
        IP* idoms verb-f-all AND verb-f-all precedes RP
    infl-final: CP* idoms IP* AND IP* idoms RP AND
        IP* idoms verb-f-all AND RP precedes verb-f-all
}
