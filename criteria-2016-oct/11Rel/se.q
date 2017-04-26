define: dating.def
node: CP-REL*
add_to_ignore: \**
query:

    (CP-REL* idoms WNP*)
AND (WNP* idoms D*)
AND (CP-REL* idoms C)


