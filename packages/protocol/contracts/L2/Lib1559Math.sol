// SPDX-License-Identifier: MIT
//  _____     _ _         _         _
// |_   _|_ _(_) |_____  | |   __ _| |__ ___
//   | |/ _` | | / / _ \ | |__/ _` | '_ (_-<
//   |_|\__,_|_|_\_\___/ |____\__,_|_.__/__/

pragma solidity ^0.8.20;

library Lib1559Math {
    function calcBaseFeePerGas(
        uint256 prevBaseFeePerGas,
        uint256 gasUsed,
        uint256 blockGasTarget
    )
        public
        pure
        returns (uint256)
    {
        // Formula:
        // base_fee * (1 + 1/8 * (block_gas_used / block_gas_target - 1))
        return prevBaseFeePerGas * (gasUsed + blockGasTarget * 7)
            / (blockGasTarget * 8);
    }
}