---
title: GBUMP
section: 1
date: 2025-09-10
footer: ~/.script
header: Fran's Fun Functions
---

# NAME
gbump - git bump version

# SYNOPSIS
**gbump** [**major** **minor** **patch**] [**-s**] [**-f** *VERSION*]

# DESCRIPTION
Bumps or creates a git tag with a version number

# OPTIONS

**-f**, **`--force`** *`<VERSION>`*
: force a specific version number

**-s**, **`--skip-commit`**
: skips creating a commit

**-h**, **`--help`**
: display help and exit

# EXAMPLES
Bump the version by a minor increment, creating a commit  
E.g. 1.0.4 -> 1.1.0

> `$ gbump minor`

Skip creating a commit and force a tag v0.0.0

> `$ gbump -sf 0.0.0`

# SEE ALSO
fran-functions(1), fran-aliases(1), llias(1)
