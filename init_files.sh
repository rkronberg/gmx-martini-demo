#!/bin/bash

# Set absolute paths in topolgy file
sed "s|FIXME|$PWD|g" template/template.top > topol.top

# Copy energy minimization input to workdir
cp template/em.mdp em.mdp

# Add index groups to MD input, copy to workdir
sed "s|ADDINDEXGROUPS|$1 SOLVENTS|g" template/md.mdp > md.mdp

echo "Initialized input files for $1 (topol.top, em.mdp, md.mdp)"
