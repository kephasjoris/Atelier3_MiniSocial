// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

/**
 * @title MiniSocial
 * @notice Mini-reseau social pedagogique : publier et consulter des messages.
 * @dev Chaque message est conserve sur la blockchain avec l'adresse de l'auteur.
 */
contract MiniSocial {
    // Structure d'un message et de son auteur.
    struct Post {
        string message;
        address author;
    }

    // Tableau dynamique contenant l'ensemble des publications.
    Post[] public posts;

    /**
     * @notice Publie un nouveau message depuis le portefeuille connecte.
     * @param _message Texte a publier.
     */
    function publishPost(string memory _message) public {
        posts.push(Post({message: _message, author: msg.sender}));
    }

    /**
     * @notice Consulte une publication grace a son indice (a partir de zero).
     * @param index Position de la publication.
     * @return Texte et adresse de l'auteur.
     */
    function getPost(uint index) public view returns (string memory, address) {
        require(index < posts.length, "Index invalide");
        Post memory post = posts[index];
        return (post.message, post.author);
    }

    /** @notice Retourne le nombre total de publications. */
    function getTotalPosts() public view returns (uint) {
        return posts.length;
    }
}
