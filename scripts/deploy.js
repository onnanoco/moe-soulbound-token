require("dotenv").config();
const hre = require("hardhat");

async function main() {
    const MOESoulboundToken = await hre.ethers.getContractFactory("MOESoulboundToken");
    const moeSoulboundToken = await MOESoulboundToken.deploy(process.env.OWNER_ADDRESS, "MOE Verified Address", "MOEVERIFIED");

    await moeSoulboundToken.deployed();

    console.log(`MOE Soulbound Token contract has been deployed: ${moeSoulboundToken.address}`);
}

main()
.then(() => process.exit(0))
.catch((error) => {
console.error(error);
process.exit(1);
})