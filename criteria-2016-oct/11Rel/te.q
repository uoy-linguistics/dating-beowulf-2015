define: dating.def
node: CP-REL*
add_to_ignore: \**
query:

    (CP-REL* idoms W*)
AND (W* idoms 0)
AND (CP-REL* idoms C)
AND (C idoms !0)