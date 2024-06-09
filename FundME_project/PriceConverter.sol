// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

import "@chainlink/contracts/src/v0.8/shared/interfaces/AggregatorV3Interface.sol";

// Library for Storing Maths
library PriceConverter {
    function getPrice() internal view returns (uint256) {
        // Address - ETH/USD - 0x694AA1769357215DE4FAC081bf1f309aDC325306
        // ABI - An interface to interact b/w external data with smart contracts, solving the oracle problem
        AggregatorV3Interface priceFeed = AggregatorV3Interface(0x694AA1769357215DE4FAC081bf1f309aDC325306);
        (,int256 price,,,) = priceFeed.latestRoundData();
        // Price of ETH in terms of USD
        return uint256(price * 1e10);
    }

    function getConversionRate(uint256 ethAmount) internal view returns(uint256) {
        uint256 ethPrice = getPrice();
        uint256 ethAmoundInUsd = (ethPrice * ethAmount) / 1e18; // Multiply first, then divide in solidity
        return ethAmoundInUsd;
    }

    function getVersion() internal view returns(uint256) {
        return AggregatorV3Interface(0x694AA1769357215DE4FAC081bf1f309aDC325306).version();
    }
}