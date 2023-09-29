// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;


interface IChallenge {
    function det(int256[] memory mat, uint256 n) external pure returns (int256);
        function getSubMatrix(int256[] memory mat, uint256 row, uint256 col, uint256 n)
        external
        pure
        returns (int256[] memory);
}

// ******* This is for use by the challenge creator only!     *******
// ******* Players do not need to change anything here. *******
library CREATOR {

    uint8 constant internal _challengeId = 0x89; // IMPORTANT: CREATOR TO UPDATE THIS!

    // IMPORTANT: CREATOR TO UPDATE THIS!
    // This function returns true or false if the solution is correct.
    // Write logic that will check if the provided solution is correct
    function verify(address solution) internal returns (bool) {
        IChallenge ctf = IChallenge(solution);
        return test2x2Det(ctf) && test4x4Det(ctf) && test7x7Det(ctf);
        }

    function test2x2Det(IChallenge ctf) internal returns (bool) {
        int256[] memory mat = new int256[](4);
        mat[0] = 1;
        mat[1] = 2;
        mat[2] = 3;
        mat[3] = 4;

        return (-2 == ctf.det(mat, 2));
    }

    function test4x4Det(IChallenge ctf) internal returns (bool) {
        int256[] memory mat = new int256[](16);
        mat[0] = 1;
        mat[1] = 2;
        mat[2] = -3;
        mat[3] = 4;
        mat[4] = -5;
        mat[5] = 6;
        mat[6] = 7;
        mat[7] = -8;
        mat[8] = 9;
        mat[9] = -10;
        mat[10] = 11;
        mat[11] = 12;
        mat[12] = -13;
        mat[13] = 14;
        mat[14] = -15;
        mat[15] = 16;

        return (ctf.det(mat, 4) == 12_960);
    }

    function test7x7Det(IChallenge ctf) internal returns (bool) {
        int256[] memory mat = new int256[](49);
        mat[0] = 1;
        mat[1] = 2;
        mat[2] = -1;
        mat[3] = 4;
        mat[4] = 5;
        mat[5] = 6;
        mat[6] = 7;
        mat[7] = -6;
        mat[8] = 9;
        mat[9] = -8;
        mat[10] = 11;
        mat[11] = 12;
        mat[12] = -11;
        mat[13] = -12;
        mat[14] = -13;
        mat[15] = 16;
        mat[16] = 17;
        mat[17] = -16;
        mat[18] = -17;
        mat[19] = -18;
        mat[20] = 21;
        mat[21] = -20;
        mat[22] = 23;
        mat[23] = 24;
        mat[24] = -23;
        mat[25] = -24;
        mat[26] = 27;
        mat[27] = -26;
        mat[28] = 29;
        mat[29] = -28;
        mat[30] = -29;
        mat[31] = 32;
        mat[32] = 33;
        mat[33] = -32;
        mat[34] = 35;
        mat[35] = -34;
        mat[36] = 37;
        mat[37] = 38;
        mat[38] = -37;
        mat[39] = -38;
        mat[40] = 41;
        mat[41] = 42;
        mat[42] = -41;
        mat[43] = -42;
        mat[44] = 45;
        mat[45] = 46;
        mat[46] = -45;
        mat[47] = 48;
        mat[48] = 49;
        return (ctf.det(mat, 7) == -774978176);
    }
    // IMPORTANT: CREATOR TO UPDATE THIS!
    // his function should return the number that should reported for gas for the solution.
    // It could be the measurement of a single function call or multiple.
    function gasReport(address solution)  internal returns (uint256 gasUsed) {
        IChallenge ctf = IChallenge(solution);
       int256[] memory mat = new int256[](49);
        mat[0] = 1;
        mat[1] = 2;
        mat[2] = -1;
        mat[3] = 4;
        mat[4] = 5;
        mat[5] = 6;
        mat[6] = 7;
        mat[7] = -6;
        mat[8] = 9;
        mat[9] = -8;
        mat[10] = 11;
        mat[11] = 12;
        mat[12] = -11;
        mat[13] = -12;
        mat[14] = -13;
        mat[15] = 16;
        mat[16] = 17;
        mat[17] = -16;
        mat[18] = -17;
        mat[19] = -18;
        mat[20] = 21;
        mat[21] = -20;
        mat[22] = 23;
        mat[23] = 24;
        mat[24] = -23;
        mat[25] = -24;
        mat[26] = 27;
        mat[27] = -26;
        mat[28] = 29;
        mat[29] = -28;
        mat[30] = -29;
        mat[31] = 32;
        mat[32] = 33;
        mat[33] = -32;
        mat[34] = 35;
        mat[35] = -34;
        mat[36] = 37;
        mat[37] = 38;
        mat[38] = -37;
        mat[39] = -38;
        mat[40] = 41;
        mat[41] = 42;
        mat[42] = -41;
        mat[43] = -42;
        mat[44] = 45;
        mat[45] = 46;
        mat[46] = -45;
        mat[47] = 48;
        mat[48] = 49;
        uint start = gasleft();
        ctf.det(mat, 7);
        gasUsed = start - gasleft();
    }

    function challengeId() internal pure returns (uint8) {
        require(_challengeId != 0xff, "IMPORTANT: CREATOR to update challengeId!");
        return _challengeId;
    }
}