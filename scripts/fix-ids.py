#!/usr/bin/env python2

# The default output of CorpusSearch contains the coding string, with each
# column separated by a :, followed by an @ then the ID.  For reading into R,
# we need to make : the delimiter of all fields, including the ID.  We also
# need to change :s in the ID (which would otherwise be interpreted as
# delimting a spurious column) to another character, in this case a ;

import sys

with open(sys.argv[1]) as f:
    lines = f.readlines()

with open(sys.argv[1], "w") as f:
    for line in lines:
        codes, id_ = line.split("@")
        id_ = id_.replace(":", ";")
        f.write(codes + ":" + id_)
