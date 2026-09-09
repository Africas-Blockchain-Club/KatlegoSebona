// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "Contracts/Schools.sol";

contract GetSchholNames{
    School externalContract;

    constructor(address _externalSchoolName){
        externalContract = School(_externalSchoolName);
    }

    function callgetSchoolName() public view returns (string memory){
        return externalContract.getSchoolName();
    }
}