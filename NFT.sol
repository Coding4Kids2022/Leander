// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/utils/Counters.sol";
import "@openzepplin/contracts/untils/String.sol"

contract NFT is ERC721 {
    using Counters for Counters.Counter;
    Counters.Counter private currentTokenId;

    string public url;

    constructor(string memory link) ERC721("NFTTutorial", "NFT") {
    url = link
    }

    function mintTo(address recipient)
        public
        returns (uint256)
    {
        currentTokenId.increment();
        uint256 newItemId = currentTokenId.current();
        _safeMint(recipient, newItemId);
        
        function tokenURI(uint256 tokenId) override returns (string memory){
             return string(abi.encodePacked(url, tokenID);
        }
    }
}
