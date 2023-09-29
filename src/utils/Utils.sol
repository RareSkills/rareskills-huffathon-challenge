// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

import {CREATOR} from "./CREATOR.sol";
import "forge-std/Test.sol";

// huff-runner
import {compileWithVersion, create, EvmVersion} from "huff-runner/Deploy.sol";
using {compileWithVersion} for Vm;
using {create} for bytes;

/// @notice This file generally does not need to be updated by CREATOR or PLAYER.
/// This contract is inherited by both Tests and Scripts and provides an interface
/// to the CREATOR contract along with some other helper functions.

contract Utils is Test {
    function verify() public returns (bool) {
        return CREATOR.verify(getTempSolutionAddress());
    }

    function gasReport() public returns (uint256 gasUsed) {
        return CREATOR.gasReport(getTempSolutionAddress());
    }

    function codeHash() public returns (bytes32) {
        bytes memory bytecode = getCreationCode();
        console.logBytes(bytecode);
        return keccak256(bytecode);
    }

    function challengeId() public pure returns (uint8) {
        return CREATOR.challengeId();
    }

    function playerHandle() public returns (string memory PLAYER_HANDLE) {
        PLAYER_HANDLE = vm.envString("PLAYER_HANDLE");
        require(keccak256(abi.encode(PLAYER_HANDLE)) != keccak256(abi.encode("")), "IMPORTANT: PLAYER to update env var PLAYER_HANDLE");

    }

    // It might be useful for the CREATOR during development to switch the getCreationCode
    // to point at a reference implementation in Solidity for example.
    function getCreationCode() public returns (bytes memory) {
        return vm.compileWithVersion("src/PLAYER_SOLUTION.huff", EvmVersion.Paris);
    }

    function getTempSolutionAddress() public returns (address) {
        return getCreationCode().create({value: 0});
    }
}
