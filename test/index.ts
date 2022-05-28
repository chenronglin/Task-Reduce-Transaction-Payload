import { expect } from "chai";
import { ethers } from "hardhat";

describe("Greeter", function () {
  it("call all 100 times: ", async function () {
    const Greeter = await ethers.getContractFactory("Greeter");
    const greeter = await Greeter.deploy();
    await greeter.deployed();

    for (let index = 0; index < 100; index++) {
      if (index % 10 != 6) {
        console.log('No Params Call M()', index);
        expect(await greeter["M()"]());
      } else {
        console.log('6 Params Call M(uint256,uint256,uint256,address,uint256,uint256)', index);
        expect(
          await greeter["M(uint256,uint256,uint256,address,uint256,uint256)"](
            1000,
            2000,
            13000,
            "0x5B38Da6a701c568545dCfcB03FcB875f56beddC4",
            4000,
            15000
          )
        );
      }
    }

    // const setGreetingTx = await greeter.setGreeting("Hola, mundo!");

    // // wait until the transaction is mined
    // await setGreetingTx.wait();

    // expect(await greeter.greet()).to.equal("Hola, mundo!");
  });
});
