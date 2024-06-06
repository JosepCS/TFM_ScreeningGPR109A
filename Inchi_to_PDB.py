import os
import pandas as pd
from rdkit import Chem
from rdkit.Chem.rdMolDescriptors import CalcNumRotatableBonds
from rdkit.Chem import AllChem

archivo_csv = '/home/josep/Baixades/Projectes/TFM/metabos.csv'
dir_salida = '/home/josep/Baixades/Projectes/TFM/Metabo_Estructures'

inchi_list = pd.read_csv(archivo_csv, sep=";")
mol_list = []

for inchis in inchi_list['inchi']:
	mol = Chem.MolFromInchi(inchis)
	if CalcNumRotatableBonds(mol) <= 8:
		mol_list.append(mol)
		
for i, mol in enumerate(mol_list):
	mol = Chem.AddHs(mol)
	AllChem.EmbedMolecule(mol,randomSeed=0xf00d)
	AllChem.MMFFOptimizeMolecule(mol)
	Chem.MolToPDBFile(mol, os.path.join(dir_salida, f'mol_{i}.pdb'))
	#with open(os.path.join(dir_salida, f'mol_{i}.mol2'),'w') as f:
	#	f.write(Chem.MolToMolBlock(mol))
        
