#!/bin/bash

# PRIMERA PART

/home/josep/Baixades/MGLTools_1.5.7./bin/pythonsh \
        /home/josep/Baixades/MGLTools_1.5.7./MGLToolsPckgs/AutoDockTools/Utilities24/prepare_gpf4.py \
        -l 8j6j_editSPLL_OKL.pdbqt \
        -r 8j6j_editSPLL_protein.pdbqt \
        -o 8j6j_editSPLL_OKL.gpf \
        -p npts='30,30,30' \
        -p gridcenter='112.026,116.480,83.866'
for ((XX=1; XX<=1181; XX++)); do
for ((YY=1; YY<=5; YY++)); do
/home/josep/Baixades/MGLTools_1.5.7./bin/pythonsh \
        /home/josep/Baixades/MGLTools_1.5.7./MGLToolsPckgs/AutoDockTools/Utilities24/prepare_gpf4.py \
        -l untitled_line_${XX}__input${XX}__variant${YY}.pdbqt \
        -r 8j6j_editSPLL_protein.pdbqt \
        -o 8j6j_${XX}_var${YY}.gpf \
        -p npts='30,30,30' \
        -p gridcenter='112.026,116.480,83.866'
done
done

# SEGONA PART

for ((XX=1; XX<=1181; XX++)); do
for ((YY=1; YY<=5; YY++)); do
        mkdir Gypsum_8j6j_${XX}_var${YY}
        mv untitled_line_${XX}__input${XX}__variant${YY}.pdbqt Gypsum_8j6j_${XX}_var${YY}
        mv 8j6j_${XX}_var${YY}.gpf Gypsum_8j6j_${XX}_var${YY}
done
done

# TERCERA PART

for ((XX=1; XX<=1181; XX++)); do
for ((YY=1; YY<=5; YY++)); do
autogrid4 -p ./Gypsum_8j6j_${XX}_var${YY}/8j6j_${XX}_var${YY}.gpf
mv *map ./Gypsum_8j6j_${XX}_var${YY}
mv *fld ./Gypsum_8j6j_${XX}_var${YY}
mv *xyz ./Gypsum_8j6j_${XX}_var${YY}
done
done
autogrid4 -p ./8j6j_editSPLL_OKL.gpf
