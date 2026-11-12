# Atelier 3 — Mini réseau social sur Ethereum (Solidity)

## Objectif
Développer et tester le smart contract `MiniSocial` demandé dans l'énoncé : publier un message associé à l'adresse de son auteur, lire un message par son indice, compter les messages.

## Périmètre
- Fichier unique : `MiniSocial.sol`.
- Structure `Post` : `string message`, `address author`.
- Tableau dynamique `Post[] public posts`.
- Fonctions : `publishPost`, `getPost`, `getTotalPosts`.
- **Aucun frontend, aucune fonctionnalité supplémentaire** : le contrat suffit pour l'énoncé. Le tutoriel webapp reste une ressource complémentaire.

## Outils
- [Remix IDE](https://remix.ethereum.org/)
- Extension MetaMask connectée au réseau de test Sepolia
- Un peu de Sepolia ETH de test pour payer les frais de déploiement/publication

## Déploiement et tests (sans code supplémentaire)
1. Dans Remix, créer `MiniSocial.sol` puis coller le code fourni.
2. Compiler avec une version Solidity compatible `^0.8.20`.
3. Dans MetaMask, sélectionner **Sepolia**, puis autoriser Remix à se connecter.
4. Dans « Deploy & Run Transactions », choisir **Injected Provider - MetaMask** (ou le fournisseur injecté équivalent) et vérifier l'adresse du compte ainsi que le réseau.
5. Déployer `MiniSocial`, confirmer la transaction dans MetaMask et attendre sa confirmation.
6. Déplier le contrat déployé. `getTotalPosts()` doit retourner **0** au départ.
7. Depuis **Compte A**, appeler `publishPost("Bonjour de A")`, puis confirmer la transaction.
8. Appeler `getTotalPosts()` : résultat attendu **1**. Appeler `getPost(0)` : message **Bonjour de A**, auteur **adresse de A**.
9. Passer sur **Compte B** dans MetaMask. Si Remix garde l'ancienne adresse, reconnecter le fournisseur injecté et vérifier le champ `Account` avant de publier.
10. Depuis **Compte B**, appeler `publishPost("Bonjour de B")`, confirmer, puis lire `getTotalPosts()` et `getPost(1)` : résultats attendus **2**, message de B et **adresse de B**.
11. Tester `getPost(2)` lorsque le total est 2 : l'appel doit être rejeté avec `Index invalide`.

> Les valeurs ci-dessus sont des **résultats attendus**, pas des tests exécutés sur Sepolia. Les adresses, hashes de transaction et frais doivent être relevés pendant votre propre démonstration.


## Limitations importantes
- Une adresse de portefeuille ne prouve pas l'identité civile de la personne.
- Une publication est une transaction : elle requiert de l'ETH de test sur Sepolia et une confirmation.
- Les lectures `view` faites localement dans Remix ne nécessitent pas de transaction de modification d'état.
- Les messages sont publics ; ne publier aucune information privée.
- Pas de suppression, de modification, de likes ni d'interface Web : hors périmètre demandé.

## Livrables
- `MiniSocial.sol` : code source à publier sur GitHub.

