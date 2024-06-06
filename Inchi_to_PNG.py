import os
import pandas as pd
from rdkit import Chem
from rdkit.Chem import Draw
from rdkit.Chem.rdMolDescriptors import CalcNumRotatableBonds

archivo_csv = '/home/josep/Baixades/Projectes/TFM/metabos.csv'
dir_salida = '/home/josep/Baixades/Projectes/TFM/RDKit'

inchi_list = pd.read_csv(archivo_csv, sep=";")
mol_list = []

for inchis in inchi_list['inchi']:
	mol = Chem.MolFromInchi(inchis)
	if CalcNumRotatableBonds(mol) <= 8:
		mol_list.append(mol)
		
for i, mol in enumerate(mol_list):
	Draw.MolToFile(mol, os.path.join(dir_salida, f'mol_{i}.png'))      
        
