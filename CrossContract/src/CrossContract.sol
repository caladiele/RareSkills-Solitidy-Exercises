// SPDX-License-Identifier: BUSL-1.1
pragma solidity ^0.8.13;

contract CrossContract {
    /**
     * The function below is to call the price function of PriceOracle1 and PriceOracle2 contracts below and return the lower of the two prices
     */

    function getLowerPrice(
        address _priceOracle1,
        address _priceOracle2
    ) external returns (uint256) {
        (bool oracle1, bytes memory data1) = _priceOracle1.call(abi.encodeWithSignature("price()"));
        (bool oracle2, bytes memory data2) = _priceOracle2.call(abi.encodeWithSignature("price()"));

        require(oracle1, "Oracle 1 call failed");
        require(oracle2, "Oracle 2 call failed");
        
        uint256 priceOracle1 = abi.decode(data1, (uint256));
        uint256 priceOracle2 = abi.decode(data2, (uint256));

        bool isPriceOracle1Lower = priceOracle1 <= priceOracle2;

        return isPriceOracle1Lower ? priceOracle1 : priceOracle2;
    }
}

contract PriceOracle1 {
    uint256 private _price;

    function setPrice(uint256 newPrice) public {
        _price = newPrice;
    }

    function price() external view returns (uint256) {
        return _price;
    }
}

contract PriceOracle2 {
    uint256 private _price;

    function setPrice(uint256 newPrice) public {
        _price = newPrice;
    }

    function price() external view returns (uint256) {
        return _price;
    }
}
