//const { error } = require("console");
const { ethers } = require("hardhat");

async function main() {
  try {
    const [deployer] = await ethers.getSigners();
    console.log(
      "Deploying crowdfunding contract with the account:",
      deployer.address
    );
    const Portfolio = await ethers.getContractFactory("PortfolioManager");
    const portfolio = await Portfolio.deploy();

    await portfolio.waitForDeployment();

    console.log(`portfolio manager deployed to ${portfolio.target}`);
  } catch (error) {
    console.error(error);
    process.exit(1);
  }
}

main();
