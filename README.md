# Flippable Operator filterer
## Experimental
### Usage

Simply implement the following function on your ERC721 collection after nhereting `FlippableOperatorFilterer` as in the [ExampleERC721](https://github.com/ZenGo-X/flippable-operator-filterer/blob/main/contracts/ExampleERC721.sol)

```solidity
    function flipOtherMarketplacesBlockingState() public onlyOwner {
        flipBlockingState();
    }
```

Also as in the orignal [repo](https://github.com/ProjectOpenSea/operator-filter-registry) you need to override all the transfer functions to include a modifier that checks whether the marketplace is allowed or not, within the Flippable version you'll have to use:
```solidity
    onlyIfOtherMarketplacesAllowed(from)
```
modifier instead which checks wheter the `areOtherMarketplacesAllowed` flag is set to false then forwards to the original `onlyAllowedOperator` modifier,
if the `areOtherMarketplacesAllowed` is set to true, this check will be bypassed, default is false (meaning trading in blocked plafroms is disabled)

