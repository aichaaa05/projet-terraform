# Projet Terraform GCP

## Convention de nommage

Toutes les ressources créées dans ce projet utilisent le préfixe unique `acjc-`, construit à partir de nos initiales.

Format général :

`acjc-<type>-<nom>`

Exemples :
- `acjc-vpc`
- `acjc-subnet`
- `acjc-vm-web`
- `acjc-bucket-12345`

Les noms des ressources Compute Engine sont toujours en minuscules, sans accent et sans caractère souligné.

Les buckets Cloud Storage utilisent en plus un suffixe personnel afin de garantir leur unicité au niveau mondial.

Toutes les ressources de la séance sont déployées dans la région `europe-west1`.
