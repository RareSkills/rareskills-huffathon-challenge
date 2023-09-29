// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

import {Script} from "forge-std/Script.sol";
import "../src/utils/Utils.sol";

contract Register is Script, Utils {
    IRegistry public constant REGISTRY = IRegistry(0xf6aE79c0674df852104D214E16AC9c065DAE5896); // registry deployed on Optimism mainnet

    function setUp() public {}

    // PLAYER to run this command to register their solution:
    // forge script script/Solution.s.sol:Register --rpc-url <OPTIMISM RPC URL> --broadcast -vvvv ----priority-gas-price 0.000001gwei
    // This needs to be a live transaction on Optimism and you will need to replace <OPTIMISM RPC URL> with a valid url.
    // NOTE: We recently added --priority-gas-price 0.000001gwei to the suggested command. Without it, your gas prices may be higher.
    // You will also need to use an actual wallet which you can do using the --wallet flag or enter your pk in other ways
    // such as by using the --interactive flag.
    function run() public {
        require(challengeId() != 0xff, "IMPORTANT: CREATOR to update challengeId!");
        require(verify(), "Solution not passing!"); // check that solution passes
        uint8 challengeId_ = challengeId();
        string memory solverHandle_ = playerHandle();
        bytes32 codeHash_ = codeHash();
        uint256 gas_ = gasReport();
        console.log("Calling register() on HuffCTFRegistry contract 0xf6aE79c0674df852104D214E16AC9c065DAE5896 on Optimism mainnet with args:");
        console.log("challengeId: ");
        console.logBytes(abi.encode(challengeId_));
        console.log("solverHandle: ");
        console.log(solverHandle_);
        console.log("codeHash: ");
        console.logBytes(abi.encode(codeHash_));
        console.log("gas: ");
        console.logBytes(abi.encode(gas_));

        vm.broadcast();
        REGISTRY.register({challengeId: challengeId_, solverHandle: solverHandle_, codeHash: codeHash_, gas: gas_});
    }
}

interface IRegistry {
    function register(uint8 challengeId, string calldata solverHandle, bytes32 codeHash, uint256 gas) external;
}
