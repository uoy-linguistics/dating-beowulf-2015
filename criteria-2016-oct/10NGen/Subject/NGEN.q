define: dating.def
node: NP-NOM|NP-NOM-RSP*|NP-NOM-x*|NP-NOM-#
add_to_ignore: \**
query:

    (SUBJECT idoms N^*|N|NR^*|NR|D^*|D)
AND (SUBJECT idoms NP-GEN)
AND (N^*|N|NR^*|NR|D^*|D precedes NP-GEN)