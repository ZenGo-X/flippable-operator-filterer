# Flippable Operator filterer

Simply implement the following function on your ERC721 collection after Inhereting FlippableOperatorFilterer as in the [ExampleERC721](https://github.com/ZenGo-X/flippable-operator-filterer/blob/main/contracts/ExampleERC721.sol)

```solidity
    function flipOtherMarketplacesBlockingState() public onlyOwner {
        flipBlockingState();
    }
```

