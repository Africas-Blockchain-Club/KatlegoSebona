// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract WeThinkCodeStudents {

    address public admin;

    struct Student {
        string name;
        uint marks;
        bool isWeThinkCode;
        bool isABC;
    }

    // Mapping to store student details using address as the key
    mapping(address => Student) public students;

    // Modifier to restrict access to admin
    modifier onlyAdmin() {
        require(msg.sender == admin, "Only admin can perform this action");
        _;
    }

    // Constructor to set the deployer as admin
    constructor() {
        admin = msg.sender;
    }

    // Function to enroll a student in WeThinkCode or ABC
    function enrollStudent(address studentAddress, string memory name, bool isWeThinkCode, bool isABC) public onlyAdmin {
        students[studentAddress] = Student(name, 0, isWeThinkCode, isABC);
    }

    // Function to set marks for a student
    function setMarks(address studentAddress, uint marks) public onlyAdmin {
        require(bytes(students[studentAddress].name).length != 0, "Student not enrolled");
        students[studentAddress].marks = marks;
    }

    // Function to retrieve marks for a student
    function getMarks(address studentAddress) public view returns (uint) {
        return students[studentAddress].marks;
    }

    // Function to check enrollment
    function checkEnrollment(address studentAddress) public view returns (string memory) {
        if (students[studentAddress].isWeThinkCode && students[studentAddress].isABC) {
            return "WeThinkCode and ABC";
        } else if (students[studentAddress].isWeThinkCode) {
            return "WeThinkCode only";
        } else if (students[studentAddress].isABC) {
            return "ABC only";
        } else {
            return "Not enrolled";
        }
    }
}