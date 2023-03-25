// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";

contract MyToken is ERC721URIStorage {
    address owner = msg.sender;
    uint256 private tokenCounter = 0;
    constructor() ERC721("EF1DC563", "B558786E") {}

    function mint(address to, string memory tokenURI) public returns (uint256)  {
        // only owner can mint
        require(msg.sender == owner);

        //generate tokenId and start mint
        uint256 tokenId = tokenCounter;
        _safeMint(to, tokenId);
        _setTokenURI(tokenId, tokenURI);
        tokenCounter = tokenCounter + 1;

        return tokenId;
    }
    function safeTransferFrom(address from, address to, uint256 tokenId) public virtual override {
        // update owner when transfer
        owner = to;
        safeTransferFrom(from, to, tokenId, "");
    }
}