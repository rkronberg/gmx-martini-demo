#!/bin/bash

if [ ${#} -ne 4 ]
then
    echo "Copy input files, fix paths, topology and index groups."
    echo "Usage: bash init_files.sh <lipid-name> <num-lipid-mols> <solvent-name> <num-solvent-mols>"
    echo "Input error!"
    exit
fi

# Set absolute paths in topolgy file
sed "s|FIXME|$PWD|g" template/template.top > topol.top

# Add type and number of lipid and solvent molecules
echo $1 $2 >> topol.top
echo $3 $4 >> topol.top

# Copy energy minimization input to workdir
cp template/em.mdp em.mdp

# Add index groups to MD input, copy to workdir
sed "s|ADDINDEXGROUPS|$1 SOLVENTS|g" template/md.mdp > md.mdp

echo "Success! Initialized topology and input files (topol.top, em.mdp, md.mdp)"
echo "Lipid:   $1 ($2 molecules)"
echo "Solvent: $3 ($4 molecules)"
