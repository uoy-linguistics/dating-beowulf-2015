define: dating.def
node: NP-ACC|NP|NP-DAT|NP-GEN|NP-ACC-RSP|NP-ACC-RFL|NP-ACC-#|NP-ACC-RSP-#|NP-ACC-RFL-#|NP-RSP|NP-RFL|NP-#|NP-RSP-#|NP-RFL-#|NP-DAT-RSP|NP-DAT-RFL|NP-DAT-#|NP-DAT-RSP-#|NP-DAT-RFL-#|NP-GEN-RSP|NP-GEN-RFL|NP-GEN-RSP-#|NP-GEN-RFL-#
add_to_ignore: \**
query:

    (OBJECT idoms N^*|N|NR^*|NR|D^*|D)
AND (OBJECT idoms NP-GEN)
AND (N^*|N|NR^*|NR|D^*|D precedes NP-GEN)