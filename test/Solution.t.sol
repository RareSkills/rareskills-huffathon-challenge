// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

import "forge-std/Test.sol";
import {Utils} from "../src/utils/Utils.sol";
import {CREATOR} from "../src/utils/CREATOR.sol";

/// @notice These tests are available to the player to use for debugging/deving their solution.
/// Any changes here do not have any effects outside this file so feel free to change as you like.
contract SolutionTest is Test, Utils {

    function setUp() public {}

    function testChallengeId() public {
        require(challengeId() != 0xff, "IMPORTANT: CREATOR to update challengeId!");
    }

    function testPlayerHandle() public {
        playerHandle();
    }

    function testGasReport() public {
        gasReport();
    }

    function testSolution() public {
        address solutionAddress = getTempSolutionAddress();
        (bool success, bytes memory data) = solutionAddress.call("");
        console.log("success: ", success);
        console.log("data:");
        console.logBytes(data);

        bool solved = CREATOR.verify(solutionAddress);

        require(solved, "Solution failed");
    }
}
