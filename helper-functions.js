const { run, network } = require("hardhat")
const { networkConfig } = require("./helper-hardhat-config")

const verify = async (contractAddress, args) => {
  console.log("Verifying contract...")
  try {
    await run("verify:verify", {
      constructorArguments: args,
      address: contractAddress,
      contract: "contracts/ERC20Token.sol:ERC20Token",
    })
  } catch (e) {
    if (e.message.toLowerCase().includes("already verified")) {
      console.log("Already verified!")
    } else {
      console.log(e)
    }
  }
}

module.exports = {
  verify,
}
