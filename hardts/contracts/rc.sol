pragma solidity ^0.8.9;

import "@openzeppelin/contracts/access/AccessControl.sol";
import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

import "./Patient.sol";
import "./Hospital.sol";
import "./Insurance.sol";


contract MyToken is ERC20, AccessControl {
    bytes32 public constant PATIENT_ROLE = keccak256("PATIENNT_ROLE");
    bytes32 public constant HOSPITAL_ROLE = keccak256("HOSPITAL_ROLE");

    constructor() public ERC20("MyToken", "TKN") {
        // Grant the contract deployer the default admin role: it will be able
        // to grant and revoke any roles
        _setupRole(PATIENT_ROLE, msg.sender);
    }

    function callPatient(address to, uint256 amount) public {
        require(hasRole(PATIENT_ROLE, msg.sender), "Caller is not a patient");
        callPatient(to, amount);
    }

    function callHospital(address from, uint256 amount) public {
        require(hasRole(HOSPITAL_ROLE, msg.sender), "Caller is not a hospital");
        callHospital(from, amount);
    }
   


}