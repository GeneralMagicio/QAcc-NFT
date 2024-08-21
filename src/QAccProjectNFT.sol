// SPDX-License-Identifier: MIT
// Compatible with OpenZeppelin Contracts ^5.0.0
pragma solidity ^0.8.19;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract QAccProjectNFT is ERC721, Ownable {
    uint256 private _nextTokenId;
    string private _baseTokenURI;

    constructor(string memory name, string memory symbol, address initialOwner, string memory baseURI)
        ERC721(name, symbol)
        Ownable(initialOwner)
    {
        _nextTokenId = 1; // Start token IDs at 1
        _setBaseURI(baseURI);
    }

    function mint(address to) external onlyOwner {
        _safeMint(to, _nextTokenId);
        _nextTokenId++;
    }

    function currentTokenId() external view returns (uint256) {
        return _nextTokenId - 1;
    }

    // set base URI
    function setBaseURI(string memory baseURI) external onlyOwner {
        _setBaseURI(baseURI);
    }

    function _setBaseURI(string memory baseURI) internal {
        _baseTokenURI = baseURI;
    }

    function _baseURI() internal view override returns (string memory) {
        return _baseTokenURI;
    }
}
