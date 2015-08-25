# Introduction

This repository contains the technical materials underlying the paper
“The Syntax of Old English Poetry and the Dating of *Beowulf*” by
[Aaron Ecay](aaron) and [Susan Pintzuk](susan), which appears in the
volume *Old English Philology: Studies in Honour of R.D. Fulk*.

[aaron]: http://aaronecay.com/
[susan]: https://www.york.ac.uk/language/people/academic-research/susan-pintzuk/

# Introduction

our general strategy: code corpus, extract coding strings, analyze data etc.

# Instructions

In order to duplicate the analyses in the paper, you will need a copy of
the [York Corpus of Old English (YCOE)](ycoe) and the
[YCOE poetry](ycoep).  You should place the YCOE files in the `corpus`
subdirectory of this repository, and the YCOEP files (where?)
<!-- TODO -->

<!-- TODO: distribute the corpus with the repository? -->


[ycoe]: http://www-users.york.ac.uk/~lang22/YcoeHome1.htm
[ycoep]: http://www-users.york.ac.uk/~lang18/pcorpus.html

Note that there may be slight discrepancies between the published
figures and those generated from this repository, since the published
figures were generated from a copy of the YCOE with unreleased fixes and
enhancements.

## Prerequisites

This analysis requires a Unix-like command-line environment in order to
be run (such as that present on Mac OS X and Linux).  In addition to
standard shell tools, you will need the following tools installed in
order to perform all the steps:

- the command-line text processor `sed`
- the build automation tool `make`
- the statistical computing language `R`
- the `python` programming language

`make` is available from Linux package managers, and is often installed
by default.  On a Mac, it can be installed with the Xcode command line
tools [following these steps](xcode-cli).  [R](r) and [python](python)
can be installed from their respective websites.

[xcode-cli]: https://railsapps.github.io/xcode-command-line-tools.html
[r]: https://www.r-project.org/
[python]: https://www.r-project.org/

You will also need the `R` packages `dplyr`, `ggplot2`, `memisc`,
`reshape2`, and `stringr`.  You can install these by issuing the
following command at an R command line:

    install.packages(c("dplyr", "ggplot2", "memisc", "reshape2", "stringr"))

## Assembling the corpus

The first step is to assemble the corpus that will be used for the
analysis, which is handled by the first several rules in
`data/Makefile`.  The following steps are undertaken:

1. Parenthetical IPs have their tags changed from `IP-PRN` to
   `IP-PAREN`.  This is because we want to treat parenthetical IPs
   differently than parenthetical non-IPs.  We generally want to search
   inside the former for IP-level syntactic features, while we wish to
   ignore the latter.
2. We restrict our searches to clauses which contain both a verb and a
   subject via `first-cut.q`.
3. We remove clauses with an empty (elided) verb, or those with two
   non-finite verbs directly dominated by the root of the clause.
   `first-cut1.q` accomplishes this.  We use CorpusSearch’s complement
   feature to write a query which matches undesirable clause types, and
   then continue the analysis with all the tokens which do not match
   this query.

## Coding queries

The next portion of the analysis uses CorpusSearch coding queries to
analyze the data in the corpus.  A coding query is an ordered list of
alternative CorpusSearch queries.  Each token in the corpus is matched
against each query, and is assigned the label corresponding to the first
matching query.  Each coding query is referred to as a column, because
of the two-dimensional structure formed by queries (horizontally) and
tokens (vertically, rows).  The coding is organized into the following
groups:

`coding.c`: defines two general purpose columns which encode the clause
type (main, conjoined main, or subordinate) and the presence and
position of auxiliary verbs respectively.

`coding-ip.c`: encodes 3 columns relating to diagnostics of IP head
directionality

`coding-vp.c`: encodes 2 columns relating to diagnostics of VP
head-directionality

`coding-sb.c`: encodes 2 columns related to pronominal scrambling

`coding-sbj.cod`: encodes 7 columns related to the position of
subjects.  Many of these are variations on a theme of determining
whether the subject is in “canonical” position between a complementizer
and Infl/Tense in a subordinate clause, with several different
exceptional configurations in- or excluded from the count.

`coding-vtoc.c`: encodes three columns relating to movement of the
tensed verb to the complementizer position (before pronominal subjects)
in matrix declarative clauses

The above coding queries are all accumulated into the `final.cod` file
(and the extraction of just the coding strings into `final.cod.ooo`).
There are also two other coding queries which are collected in separate
files, because they target constituents other than clauses (IPs):

`coding-gen.q`, `coding-gen.c`: encode a single column related to the
ordering between a noun and its genitive.  The query (`.q`) file
pre-selects noun phrase tokens.

`coding-cprel.q`, `coding-cprel.c`: encode a single column relating to
the complementizer/relative pronoun before.  As before, a query file
pre-selects the relative clauses.

### A note on using make

The `make` tool automates the sequencing of several shell commands to
produce a desired result, automatically moving through prerequisite
steps as needed.  In order to generate the files for the quantitative
analysis, you should run the following shell commands in the `data/`
subdirectory of this repository:

    make final.cod.ooo
    make coding-gen.cod.ooo
    make coding-cprel.cod.ooo

## Quantitative analysis

The next step in the analysis is to analyze the data that was generated
from the coding queries.

## External data


# File layout

[cs]: http://corpussearch.sourceforge.net/

The following files and directories are present in this repository:

- `CS-2.002.21.jar` and `CS_2.003.04.jar`: two versions of the
  [CorpusSearch](cs) program.  Both versions are needed for different
  parts of the analysis.  2.002.21 is an older version, but its
  execution of the CorpusSearch query language is most closely adapted
  to the queries we have written.  2.003.04 is a newer version which has
  changed the semantics of the query language.  However, it includes a
  useful feature to include the ID of a token when extracting the coding
  string.  Thus we will use it only for the final extraction.

- `R` is a directory containing R scripts

- `queries` contains CorpusSearch queries

- `scripts` contains a utility python script

- `trees` contains Latex code for two syntactic trees which are included
  in the article

- `data` contains the main makefile which organizes the CorpusSearch
  queries and other steps involved in the analysis.  It also is where
  the output of these scripts will be generated
