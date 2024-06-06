from rdkit import Chem
from rdkit.Chem import AllChem

def smiles_to_pdb(input_file, output_file):
    with open(input_file, 'r') as f:
        smiles_list = f.readlines()
    for idx, smiles in enumerate(smiles_list):
        mol = Chem.MolFromSmiles(smiles.strip())
        if mol:
            mol = Chem.AddHs(mol)
            AllChem.EmbedMolecule(mol, AllChem.ETKDG())
            AllChem.MMFFOptimizeMolecule(mol)
            pdb_file = output_file.format(idx + 1)
            writer = Chem.PDBWriter(pdb_file)
            writer.write(mol)
            writer.close()
        else:
            print(f"Error: Unable to generate molecule for SMILES {smiles.strip()}")

input_file = 'input_smiles.txt'
output_file = 'output_molecule_{0}.pdb'
smiles_to_pdb(input_file, output_file)


