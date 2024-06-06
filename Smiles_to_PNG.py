from rdkit import Chem
from rdkit.Chem import Draw

def smiles_from_file(input_file):
    with open(input_file, "r") as f:
        smiles_list = [line.strip() for line in f if line.strip()]
    return smiles_list

def smiles_to_png(smiles_list, output_dir="output", size=(300, 300)):
    import os
    if not os.path.exists(output_dir):
        os.makedirs(output_dir)
    for i, smiles in enumerate(smiles_list):
        mol = Chem.MolFromSmiles(smiles)
        if mol is None:
            print(f"Invalid SMILES at index {i}: {smiles}")
            continue
        filename = os.path.join(output_dir, f"mol_{i}.png")
        img = Draw.MolToImage(mol, size=size)
        img.save(filename)
        print(f"Imagen {filename} guardada.")

# Ejemplo de uso:
input_file = "smiles.txt"  # Nombre del archivo que contiene los SMILES
smiles_list = smiles_from_file(input_file)
smiles_to_png(smiles_list)

