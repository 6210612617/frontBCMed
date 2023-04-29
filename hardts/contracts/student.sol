pragma solidity ^0.8.0;

contract student {

    mapping(address => address) _nextStudents;
    uint256 public listsize;
    address constant GUARD = address(1); //make blank link list

    constructor() public {
        _nextStudents[GUARD] = GUARD;
    }

    function isStudent(address student) public view returns (bool) {
        return _nextStudents[student] != address(0);
    }

    function addStudent(address student) public{
        require(!isStudent(student));

    }
}
 