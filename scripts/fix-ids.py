#!/usr/bin/env python2

import sys

with open(sys.argv[1]) as f:
    lines = f.readlines()

with open(sys.argv[1], "w") as f:
    for line in lines:
        codes, id_ = line.split("@")
        id_ = id_.replace(":", ";")
        f.write(codes + ":" + id_)
