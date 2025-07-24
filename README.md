# subfindersearcher
#  Subdomain Recon 

Ce script Bash permet de découvrir de manière passive les sous-domaines d’un domaine cible (ex : `exemple.com`), et de vérifier lesquels sont vivants via des connexions HTTP/HTTPS.

---

## Fonctionnalités

- Récupération de sous-domaines via :
  - [assetfinder](https://github.com/tomnomnom/assetfinder)
  - [subfinder](https://github.com/projectdiscovery/subfinder)
  - [amass](https://github.com/owasp-amass/amass)
- Fusion et suppression des doublons
- Vérification des sous-domaines actifs via [httprobe](https://github.com/tomnomnom/httprobe)
- Sauvegarde des résultats dans :
  - `all_subs.txt` – Tous les sous-domaines trouvés
  - `alive.txt` – Sous-domaines actifs

---

##  Prérequis

Assurez-vous que les outils suivants sont installés :

```bash
go install github.com/tomnomnom/assetfinder@latest
go install github.com/projectdiscovery/subfinder/v2/cmd/subfinder@latest
go install github.com/owasp-amass/amass/v3/...@latest
go install github.com/tomnomnom/httprobe@latest
export PATH=$PATH:$HOME/go/bin
chmod +x scanner.sh
./scanner.sh
