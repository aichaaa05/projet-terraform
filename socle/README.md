
## Règles de filtrage

L'étiquette `iap-ssh` cible les machines qui doivent être administrables en SSH via Identity Aware Proxy.

L'étiquette `web` cible les machines exposant le service web sur le port 80.

Le port 80 est ouvert depuis `0.0.0.0/0` car le service web doit être accessible publiquement depuis Internet, contrairement à l'accès SSH qui reste limité à IAP.
