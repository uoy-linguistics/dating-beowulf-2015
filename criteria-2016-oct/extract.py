#!/usr/bin/env python3

import glob
import sys
from collections import defaultdict
import re

values = defaultdict(lambda: defaultdict(int))

ANTIQUITY = {
    "initial": "new",
    "final": "old",
    "AUXV": "new",
    "VAUX": "old",
    "PROV": "new",
    "VPRO": "old",
    "se": "old",
    "te": "new",
    "null": "old",
    "overt": "new",
    "noscrIfinal": "new",
    "scrIfinal": "old",
    "scan": "new",
    "snoncan": "old",
    "notop": "new",
    "top": "old",
    "any": "new",
    "nany": "old",
    "aught": "new",
    "naught": "old",
    "ever": "new",
    "never": "old",
    "one": "new",
    "none": "old",
    "or": "new",
    "nor": "old",
    "GENN": "new",
    "NGEN": "old"
}

for path in glob.glob("*/*.out") + glob.glob("*/*/*.out"):
    parts = path.split("/")
    criterion = parts[0]
    value = parts[-1]
    value = value[:-4]  # strip .out
    if value.endswith("initial"):
        value = "initial"
    if value.endswith("final"):
        value = "final"
    if value.startswith("scan"):
        value = "scan"
    if value.startswith("snoncan"):
        value = "snoncan"
    if criterion == "12Topic":
        if parts[1] == "full-PP":
            criterion = "TopPPSbj"
        elif parts[1] == "full-OBJ":
            criterion = "TopObjSbj"
        elif parts[1] == "spro-PP":
            criterion = "TopPPSpro"
        elif parts[1] == "spro-OBJ":
            criterion = "TopObjSpro"
        else:
            raise Exception("oops %s" % parts[1])
    elif criterion == "10NGen":
        if parts[1] == "Object":
            criterion = "NGenObj"
        elif parts[1] == "Subject":
            criterion = "NGenSbj"
        else:
            raise Exception("oops %s" % parts[1])
    else:
        criterion = criterion[2:]  # Remove leading digits
    with open(path, "r") as fin:
        value_line = set(filter(lambda l: l.startswith("  CO"), fin.readlines()))
        if len(value_line) != 1:
            raise Exception("oops: %s, %s" %
                            (criterion, value))
        value_line = value_line.pop()
    m = re.search("([0-9]+)/", value_line)
    if m:
        values[criterion][ANTIQUITY[value]] += int(m.group(1))
    else:
        raise Exception("couldn't find the line for %s, %s" %
                        (criterion, value))

sys.stdout.write("criterion,old,new\n")
for k, v in values.items():
    if k == "08SCan":
        continue
    sys.stdout.write("%s,%s,%s\n" % (k, v["old"], v["new"]))
