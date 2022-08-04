// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/utils/Counters.sol";
import "@openzeppelin/contracts/utils/Strings.sol";

contract NFT is ERC721 {
    using Counters for Counters.Counter;
    Counters.Counter private currentTokenId;
     mapping(uint256 => uint) public NFTs_schon_gekauft;
    string public url;

    constructor(string memory link) ERC721(unicode"Schöne Bunte Farben", "Bunt") {
    url = link;
    }
    function mintTo(address recipient,uint256 pictur_number)
        public payable
    {   
        if (msg.value>10 ether) {
            require (NFTs_schon_gekauft[pictur_number]<=100);
        _safeMint(recipient, pictur_number);
        NFTs_schon_gekauft[pictur_number]+=1;
        payable(0xd771a9bE526776B4855D69ED97c50da90C87ACf7).transfer(msg.value);
        }  
    }  
        function tokenURI(uint256 tokenID) public view override returns (string memory) {
             return string(abi.encodePacked(url, Strings.toString(tokenID),".json"));
        }
}
