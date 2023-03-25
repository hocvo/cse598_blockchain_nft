// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";

contract MyToken is ERC721URIStorage {
    address owner = msg.sender;
    uint256 private tokenCounter = 0;
    constructor() ERC721("EF1DC563", "B558786E") {}

    // function mint(address to, uint256 tokenId) public returns (uint256)  {
    //     require(msg.sender == owner);
    //     _safeMint(to, tokenId);
    // }
    function mint(address to, string memory tokenURI) public returns (uint256)  {
        require(msg.sender == owner);
        // todo get tokenId from uri;
        uint256 tokenId = tokenCounter;
        _safeMint(to, tokenId);
        _setTokenURI(tokenId, tokenURI);
        tokenCounter = tokenCounter + 1;
        return tokenId;
    }
}
