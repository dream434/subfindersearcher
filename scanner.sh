#!/bin/bash

domain="dyson.com"
output="all_subs.txt"
alive="alive.txt"

# Nettoyage
rm -f $output $alive

echo "[+] Récupération des sous-domaines pour $domain ..."

# Récupère avec assetfinder
command -v assetfinder &>/dev/null && assetfinder --subs-only $domain >> $output

# Récupère avec subfinder
command -v subfinder &>/dev/null && subfinder -d $domain >> $output

# Récupère avec amass
command -v amass &>/dev/null && amass enum -passive -d $domain >> $output

# Supprime les doublons
sort -u $output -o $output

echo "[+] Sous-domaines trouvés : $(wc -l < $output)"

# Vérifie les sous-domaines actifs (HTTP/HTTPS)
echo "[+] Vérification des sous-domaines vivants ..."
cat $output |/root/go/bin/httprobe | tee $alive

echo "[+] Sous-domaines actifs : $(wc -l < $alive)"
echo "[+] Résultats sauvegardés dans $alive"
