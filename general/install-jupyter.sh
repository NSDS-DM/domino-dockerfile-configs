#!/bin/bash
set -euo pipefail


# Jupyter kernel
R --no-echo -e "
install.packages('IRkernel')
IRkernel::installspec(user = FALSE)  # all users for consistent install loc
"

echo 'Goodbye!'
