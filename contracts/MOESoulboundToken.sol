// SPDX-License-Identifier: MIT
pragma solidity 0.8.28;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";
import "@openzeppelin/contracts/token/ERC721/extensions/ERC721Burnable.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

struct Artist {
    string name;
    string uri;
}

contract MOESoulboundToken is Ownable, ERC721, ERC721Burnable, ERC721URIStorage {

    mapping (address => Artist) public artists;

    constructor(address _ownerAddress, string memory _name, string memory _symbol) Ownable(_ownerAddress) ERC721(_name, _symbol) {

    }

    function _update(address to, uint256 tokenId, address auth) internal virtual override {
        
        address from = _ownerOf(tokenId);

        if (from != address(0) && to != address(0)){
            revert("MOESBT: Transfer failed");
        }

        return super._update(to, tokenId, auth);
    }

    function safeMint(address to, uint256 tokenId, string memory uri) public onlyOwner {
        _safeMint(to, tokenId);
        _setTokenURI(tokenId, uri);
    }

    function supportsInterface(bytes4 interfaceId) public view override(ERC721, ERC721URIStorage) returns (bool) {
        return super.supportsInterface(interfaceId);
    }
        
}