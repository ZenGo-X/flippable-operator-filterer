// We require the Hardhat Runtime Environment explicitly here. This is optional
// but useful for running the script in a standalone fashion through `node <script>`.
//
// You can also run a script with `npx hardhat run <script>`. If you do that, Hardhat
// will compile your contracts, add the Hardhat Runtime Environment's members to the
// global scope, and execute the script.
const hre = require("hardhat");

async function main() {
    [deployer] = await ethers.getSigners();

    const ExampleERC721 = await hre.ethers.getContractFactory("ExampleERC721");
    const exampleERC721 = await ExampleERC721.deploy();
    await exampleERC721.deployed();

    const Marketplace = await hre.ethers.getContractFactory("Marketplace");
    const marketplace = await Marketplace.deploy(exampleERC721.address);
    await marketplace.deployed();


    var res = await exampleERC721.mint(3);
    a= await res.wait();
    await exampleERC721.setApprovalForAll(marketplace.address, true);


}

// We recommend this pattern to be able to use async/await everywhere
// and properly handle errors.
main().catch((error) => {
  console.error(error);
  process.exitCode = 1;
});
