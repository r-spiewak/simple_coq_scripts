# Simple Coq Scripts

Repo for some simple Coq scripts.

This repo uses Coq 8.19.2, with the [2024.10.1 release](https://github.com/coq/platform/releases/tag/2024.10.1).

## Installation

1. `git clone https://github.com/r-spiewak/simple_coq_scripts.git`
2. Run `coq_makefile -f _CoqProject -o CoqMakefile` to create the `CoqMakefile`, and then run `make -f CoqMakefile` to make it.

## Dev Installation

After completing the regular installation above, also do the following:
1. Install pre-commit (e.g., `apt install pre-commit`), if not already installed.
2. [Optional, as a precaution] After every update, consider first running `make -f CoqMakefile clean` or `make -f CoqMakefile cleanall` (to uninstall the package and ensure the new install works fine), or backing up the `CoqMakefile` so `clean` and `cleanall` can be run from it later in case of package issues. 
3. Then, add the new files (with path) to `_CoqProject`,run `coq_makefile -f _CoqProject -o CoqMakefile` to create the `CoqMakefile`, and then run `make -f CoqMakefile` to make it.
