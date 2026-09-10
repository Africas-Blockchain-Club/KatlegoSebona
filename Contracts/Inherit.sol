// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "./WeThinkCodeStudents.sol";
import "./ABCStudentRanks.sol";

contract SchoolManager {
    address public admin;
    WeThinkCodeStudents public wtcContract;
    ABCStudentRanks public abcContract;

    modifier onlyAdmin() {
        require(msg.sender == admin, "Only admin can perform this action");
        _;
    }

    constructor(address _wtcAddress, address _abcAddress) {
        admin = msg.sender;
        wtcContract = WeThinkCodeStudents(_wtcAddress);
        abcContract = ABCStudentRanks(_abcAddress);
    }

    // Call functions on both contracts without inheritance collision
    function setStudentMarksAndRank(
        address studentAddress,
        uint marks,
        ABCStudentRanks.Rank rank
    ) public onlyAdmin {
        wtcContract.setMarks(studentAddress, marks);
        abcContract.setRank(studentAddress, rank);
    }
}