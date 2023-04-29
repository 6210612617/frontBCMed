// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.9;

import "@openzeppelin/contracts/access/AccessControl.sol";
import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract Insurance is ERC20, AccessControl {

    address owner;
     bytes32 public constant MINTER_ROLE = keccak256("MINTER_ROLE");

    constructor(address minter) public ERC20("Insurances", "TKN") {
        // Grant the minter role to a specified account
        _setupRole(MINTER_ROLE, minter);
    }

    function mint(address to, uint256 amount) public {
        // Check that the calling account has the minter role
        require(hasRole(MINTER_ROLE, msg.sender), "Caller is not a minter");
        _mint(to, amount);
    }

    //Insurance
    struct Insurances {
        address Insurances;
        string  name;
        string  id; 
        string  ppr_addr;
        string  addr;
        string  permission;
        string  status;
        string  limit; //for limit information
        string  namr_c; //name client
        string  DateLong; //begin-expire
        string  history; //history for use insurance
        string  description; 
        string  fax_claim; 
    
    }
    
    mapping( address => bool) private insuranceAddressCheck;
    mapping( address => uint) private insuranceIndexes;

    Insurances [] public listInsurance ;


    modifier onlyInsurance
    {
        require(insuranceAddressCheck[msg.sender] == true, "You are NOT a registered citizen");
        _;
    }

    
    function getInsuranceDetails(address _insurance) public view returns(Insurances memory)
    {
        require(insuranceAddressCheck[_insurance] == true, "Invalid patient");
        return listInsurance[insuranceIndexes[_insurance]];
    }
    //id
    function getId() public view returns (string memory id ) {
        require(insuranceAddressCheck[msg.sender] == true, "You are NOT a registered Patient");
        return id;
    }
    function setId (string memory _id ) public view onlyInsurance  {
        //require(patientAddressCheck[_id] == true, "InavalidPatient");
       Insurances memory pt;
        pt.id = _id;
    }
    
    //ppr_addr
    function getPpr_addr() public view returns (string memory ppr_addr ) {
        require(insuranceAddressCheck[msg.sender] == true, "You are NOT a registered Patient");
        return ppr_addr;
    }
    function setPpr_addr (string memory _ppr_addr ) public view onlyInsurance  {
        //require(patientAddressCheck[_id] == true, "InavalidPatient");
        Insurances memory pt;
        pt.ppr_addr = _ppr_addr;
    }

    //status 
      function getStatus() public view returns (string memory status ) {
        require(insuranceAddressCheck[msg.sender] == true, "You are NOT a registered Patient");
        return status;
    }
    function setStatus (string memory _status ) public view onlyInsurance  {
        //require(patientAddressCheck[_id] == true, "InavalidPatient");
        Insurances memory pt;
        pt.status = _status;
    }
    //address
    function getAddress() public view returns (string memory addr ) {
        require(insuranceAddressCheck[msg.sender] == true, "You are NOT a registered Patient");
        return addr;
    }
    function setAddress (string memory _addr ) public view onlyInsurance  {
        //require(patientAddressCheck[_id] == true, "InavalidPatient");
        Insurances memory pt;
        pt.addr = _addr;
    }
    //limit
    function getLimit() public view returns (string memory limit ) {
        require(insuranceAddressCheck[msg.sender] == true, "You are NOT a registered Patient");
        return limit;
    }
    function setlimit (string memory _limit ) public view onlyInsurance  {
        //require(patientAddressCheck[_id] == true, "InavalidPatient");
        Insurances memory pt;
        pt.limit= _limit;
    }
    //permission
    function getPermission() public view returns (string memory permission ) {
        require(insuranceAddressCheck[msg.sender] == true, "You are NOT a registered Patient");
        return permission;
    }
    function setPermission (string memory _permission ) public view onlyInsurance  {
        //require(patientAddressCheck[_id] == true, "InavalidPatient");
        Insurances memory pt;
        pt.permission = _permission;
    }
    //name_c
    function getName_c() public view returns (string memory name_c ) {
        require(insuranceAddressCheck[msg.sender] == true, "You are NOT a registered Patient");
        return name_c;
    }
    function setName_c (string memory _name_c ) public view onlyInsurance  {
        //require(patientAddressCheck[_id] == true, "InavalidPatient");
        Insurances memory pt;
        pt.name_c = _name_c;
    }
    //fax_claim
    function getFax_claim() public view returns (string memory fax_claim ) {
        require(insuranceAddressCheck[msg.sender] == true, "You are NOT a registered Patient");
        return fax_claim;
    }
    function setFax_claim (string memory _fax_claim ) public view onlyInsurance   {
        //require(patientAddressCheck[_id] == true, "InavalidPatient");
        Insurances memory pt;
        pt.fax_claim = _fax_claim;
    }
      //description
    function getDescription() public view returns (string memory description ) {
        require(insuranceAddressCheck[msg.sender] == true, "You are NOT a registered Patient");
        return description;
    }
    function setDescription(string memory _description ) public view onlyInsurance   {
        //require(patientAddressCheck[_id] == true, "InavalidPatient");
        Insurances memory pt;
        pt.description= _description;
    }
          //datalong
    function getDatalong() public view returns (string memory datalong ) {
        require(insuranceAddressCheck[msg.sender] == true, "You are NOT a registered Patient");
        return datalong;
    }
    function setDatalong(string memory _datalong ) public view onlyInsurance   {
        //require(patientAddressCheck[_id] == true, "InavalidPatient");
        Insurances memory pt;
        pt.datalong= _datalong;
    }
          //history
    function getHistory() public view returns (string memory history ) {
        require(insuranceAddressCheck[msg.sender] == true, "You are NOT a registered Patient");
        return history;
    }
    function setHistory(string memory _history ) public view onlyInsurance   {
        //require(patientAddressCheck[_id] == true, "InavalidPatient");
        Insurances memory pt;
        pt.history = _history;
    }
   

}