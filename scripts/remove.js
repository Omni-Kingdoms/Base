const { getSelectors, FacetCutAction } = require('./libraries/diamond.js')

const upgradeExample = async () => {
    //const diamondAddress = "0x55Fd95F322ED24705441806b73dD969558f5E9E5"; //current v3 mantle test
    //const diamondAddress = "0x0A31e14967aA2CFD76DB8eF599e4eb032544e8AB"; //current v3 opg
    const diamondAddress = "0xAE3C48645436fa35D951e5314689cEcdC10ef9F3"; //current BASE LIVE


    const newFacetAddress = "0x0000000000000000000000000000000000000000";

    const diamondCutFacet = await ethers.getContractAt(
        "DiamondCutFacet",
        diamondAddress
    );

const NewFacet = await ethers.getContractFactory("TrainFacet");
    const selectorsToAdd = getSelectors(NewFacet);

    const tx = await diamondCutFacet.diamondCut(
        [
        {
            facetAddress: newFacetAddress,
            action: FacetCutAction.Remove,
            functionSelectors: selectorsToAdd,
        },
        ],
        ethers.constants.AddressZero,
        "0x",
        { gasLimit: 800000 }
    );

    const receipt = await tx.wait();
    if (!receipt.status) {
        throw Error(`Diamond remove failed: ${tx.hash}`);
    } else {
        console.log("Diamond remove success");
    }
};

// We recommend this pattern to be able to use async/await everywhere
// and properly handle errors.
if (require.main === module) {
upgradeExample()
    .then(() => process.exit(0))
    .catch((error) => {
    console.error(error);
    process.exit(1);
    });
}