// SPDX-License-Identifier: MIT
pragma solidity 0.8.28;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";

struct Artist {
    string name;
    string uri;
}

contract MOESoulboundToken {

    mapping (address => Artist) public artists;

    function _update(address to, uint256 tokenId, address auth) internal virtual override {
        
        address from = _ownerOf(tokenId);

        if (from != address(0) && to != address(0)){
            revert("MOESBT: Transfer failed");
        }

        return super._update(to, tokenId, auth);
    }


}