// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

import "@openzeppelin/contracts/access/Ownable.sol";
import "erc721a/contracts/ERC721A.sol";
import "./FlippableOperatorFilterer721.sol";

contract ExampleERC721 is ERC721A, FlippableOperatorFilterer721, Ownable {
    constructor() ERC721A("Test", "TEST") {}

    function mint(uint8 quantity) public payable {
        _safeMint(msg.sender, quantity);
    }

    function _startTokenId() internal pure override returns (uint256) {
        return 1;
    }

    function transferFrom(address from, address to, uint256 tokenId) public payable override onlyIfOtherMarketplacesAllowed(from) {
        super.transferFrom(from, to, tokenId);
    }

    function safeTransferFrom(address from, address to, uint256 tokenId) public payable override onlyIfOtherMarketplacesAllowed(from) {
        super.safeTransferFrom(from, to, tokenId);
    }

    function safeTransferFrom(address from, address to, uint256 tokenId, bytes memory data) public payable override onlyIfOtherMarketplacesAllowed(from)
    {
        super.safeTransferFrom(from, to, tokenId, data);
    }

    function flipOtherMarketplacesBlockingState() public onlyOwner {
        flipBlockingState();
    }

}
