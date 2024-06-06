import os
import pandas as pd
from rdkit import Chem
from rdkit.Chem.rdMolDescriptors import CalcNumRotatableBonds
from rdkit.Chem import AllChem

archivo_csv = '/home/josep/Baixades/Projectes/TFM/metabos.csv'
dir_salida = '/home/josep/Baixades/Projectes/TFM/Metabo_Estructures'

inchi_list = pd.read_csv(archivo_csv, sep=";")
mol_list = []
smiles_list = []

for inchis in inchi_list['inchi']:
	mol = Chem.MolFromInchi(inchis)
	if CalcNumRotatableBonds(mol) <= 8:
		smiles_list.append(Chem.MolToSmiles(mol))
		
with open(os.path.join(dir_salida, 'smiles.txt'), 'w') as f:
    for smiles in smiles_list:
        f.write(smiles + '\n')
