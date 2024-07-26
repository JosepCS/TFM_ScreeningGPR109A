#!/bin/bash

./../../../../AutoDock_Vina_1.2.5/bin/vina \
     --receptor 8i7v_editSPLL_protein.pdbqt \
     --ligand 8i7v_editSPLL_OJX.pdbqt \
     --config config.txt \
     --exhaustiveness 32 \
     --out decoy_OJX_00_out.pdbqt

# Bucle para valores de XX de 1 a 50
for ((XX=1; XX<=50; XX++)); do
    # Ejecutar el comando Vina con los parámetros especificados
./../../../../AutoDock_Vina_1.2.5/bin/vina \
         --receptor 8i7v_editSPLL_protein.pdbqt \
         --ligand decoy_OJX_${XX}.pdbqt \
         --config config.txt \
         --exhaustiveness 32 \
         --out decoy_OJX_${XX}_out.pdbqt
done

