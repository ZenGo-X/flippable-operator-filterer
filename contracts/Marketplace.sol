// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;


import "@openzeppelin/contracts/access/Ownable.sol";

interface IERC721A {
    // =============================================================
    //                            IERC721
    // =============================================================


    event Transfer(
        address indexed from,
        address indexed to,
        uint256 indexed tokenId
    );


    event Approval(
        address indexed owner,
        address indexed approved,
        uint256 indexed tokenId
    );


    event ApprovalForAll(
        address indexed owner,
        address indexed operator,
        bool approved
    );

    function safeTransferFrom(
        address from,
        address to,
        uint256 tokenId,
        bytes calldata data
    ) external payable;


    function safeTransferFrom(
        address from,
        address to,
        uint256 tokenId
    ) external payable;

    /**
     * @dev Transfers tokenId from from to to.
     *
     * WARNING: Usage of this method is discouraged, use {safeTransferFrom}
     * whenever possible.
     *
     * Requirements:
     *
     * - from cannot be the zero address.
     * - to cannot be the zero address.
     * - tokenId token must be owned by from.
     * - If the caller is not from, it must be approved to move this token
     * by either {approve} or {setApprovalForAll}.
     *
     * Emits a {Transfer} event.
     */
    function transferFrom(
        address from,
        address to,
        uint256 tokenId
    ) external payable;
}

contract Marketplace is Ownable {
    address public NFTCollectionAddress;

    constructor(address _nftCollectionAddress) {
        NFTCollectionAddress = _nftCollectionAddress;
    }

    function moveNFT(
        address from,
        address to,
        uint256 tokenId
    ) public {        
        IERC721A collectionContract = IERC721A(NFTCollectionAddress);
        collectionContract.safeTransferFrom(from, to, tokenId);
    }

    function changeCollectionAddress(address _newAddress) public onlyOwner {
        NFTCollectionAddress = _newAddress;
    }
}