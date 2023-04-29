pragma solidity ^0.8.0;
pragma experimental ABIEncoderV2;

import "./rc.sol";
import {Hospital} from "./Hospital.sol";

import "@openzeppelin/contracts/access/AccessControl.sol";
import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract Patient {
    address owner;
    Hospital public myHospital;
    //patient
    struct Patients  {
        address Patient;
        string name;
        string  id;
        string  addr;
        string ppr_addr;
        string  status;
        string  price;
        string  dateofbirth;
        string  phone;
        string  disease;
        string  identification_pill;
        string  healthAllergic ;
        string  gender;
        string  b_type;

    }

     struct relaHos {
        address Patient;
        string staus;
        Hospital id;
        
        
    }
    mapping( address => bool) private patientAddressCheck;
    mapping( address => uint) private patientIndexes;

    mapping(address => string[]) relationHos;
    mapping(address => string[]) relationInsu;

    mapping(address => relaHospital[]) public relaHospitals;
    


    Patients[] public listPatient ;

     constructor()
    {
        owner = msg.sender;
    }

    modifier onlyPatients
    {
        require(patientAddressCheck[msg.sender] == true, "You are NOT a registered citizen");
        _;
    }

    
    function getPatientDetails(address _patients) public view returns(Patients memory)
    {
        require(patientAddressCheck[_patients] == true, "Invalid patient");
        return listPatient[patientIndexes[_patients]];
    }
    //id
    function getId() public view returns (string memory id ) {
        require(patientAddressCheck[msg.sender] == true, "You are NOT a registered Patient");
        return id;
    }
    function setId (string memory _id ) public view onlyPatients  {
        //require(patientAddressCheck[_id] == true, "InavalidPatient");
        Patients memory pt;
        pt.id = _id;
    }
    
    //ppr_addr
   function getPpr_addr() public view returns (string memory ppr_addr ) {
        require(patientAddressCheck[msg.sender] == true, "You are NOT a registered Patient");
        return ppr_addr;
    }
    function setPpr_addr (string memory _ppr_addr ) public view onlyPatients  {
        //require(patientAddressCheck[ _ppr_addr] == true, "InavalidPatient");
        Patients memory pt;
        pt.ppr_addr = _ppr_addr;
    }

    //status 
  function getStatus() public view returns (string memory status ) {
        require(patientAddressCheck[msg.sender] == true, "You are NOT a registered Patient");
        return status;
    }
    function setStatus (string memory _status ) public view onlyPatients  {
        //require(patientAddressCheck[ _status] == true, "InavalidPatient");
        Patients memory pt;
        pt.status = _status;
    }
    //address
    function getAddr() public view returns (string memory addr ) {
        require(patientAddressCheck[msg.sender] == true, "You are NOT a registered Patient");
        return addr;
    }
    function setAddr (string memory _addr) public view onlyPatients  {
        //require(patientAddressCheck[ _status] == true, "InavalidPatient");
        Patients memory pt;
        pt.addr = _addr;
    }
    //price
     function getPrice() public view returns (string memory price ) {
        require(patientAddressCheck[msg.sender] == true, "You are NOT a registered Patient");
        return price;
    }
    function setPrice (string memory _price) public view onlyPatients  {
        //require(patientAddressCheck[ _status] == true, "InavalidPatient");
        Patients memory pt;
        pt.price = _price;
    }
    //dateofbirth
    function getDateOfBirth() public view returns (string memory datefb ) {
        require(patientAddressCheck[msg.sender] == true, "You are NOT a registered Patient");
        return datefb;
    }
    function setDateOfBirth (string memory _datefb) public view onlyPatients  {
        //require(patientAddressCheck[ _status] == true, "InavalidPatient");
        Patients memory pt;
        pt.dateofbirth = _datefb;
    }
    //phone
    function getPhone() public view returns (string memory phone ) {
        require(patientAddressCheck[msg.sender] == true, "You are NOT a registered Patient");
        return phone;
    }
    function setPhone (string memory _phone) public view onlyPatients  {
        //require(patientAddressCheck[ _status] == true, "InavalidPatient");
        Patients memory pt;
        pt.phone = _phone;
    }
    //disease
    function getDisease() public view returns (string memory disease ) {
        require(patientAddressCheck[msg.sender] == true, "You are NOT a registered Patient");
        return disease;
    }
    function setDisease (string memory _disease) public view onlyPatients  {
        //require(patientAddressCheck[ _status] == true, "InavalidPatient");
        Patients memory pt;
        pt.disease = _disease;
    }
    //identification_pill;
    function getIdentification_pill() public view returns (string memory identification_pill ) {
        require(patientAddressCheck[msg.sender] == true, "You are NOT a registered Patient");
        return identification_pill;
    }
    function setdentification_pill (string memory _identification_pill) public view onlyPatients  {
        //require(patientAddressCheck[ _status] == true, "InavalidPatient");
        Patients memory pt;
        pt.identification_pill = _identification_pill;
    }
    // healthAllergic
    function getHealthAllergic() public view returns (string memory healthAllergic ) {
        require(patientAddressCheck[msg.sender] == true, "You are NOT a registered Patient");
        return healthAllergic;
    }
    function setHealthAllergic (string memory _healthAllergic) public view onlyPatients  {
        //require(patientAddressCheck[ _status] == true, "InavalidPatient");
        Patients memory pt;
        pt.healthAllergic = _healthAllergic;
    }
    //gender
    function getGender() public view returns (string memory gender ) {
        require(patientAddressCheck[msg.sender] == true, "You are NOT a registered Patient");
        return gender;
    }
    function setGender (string memory _gender) public view onlyPatients  {
        //require(patientAddressCheck[ _status] == true, "InavalidPatient");
        Patients memory pt;
        pt.gender = _gender;
    }
    //B-type
    function getB_type() public view returns (string memory b_type ) {
        require(patientAddressCheck[msg.sender] == true, "You are NOT a registered Patient");
        return b_type;
    }
    function setB_type (string memory _b_type) public view onlyPatients  {
        //require(patientAddressCheck[ _status] == true, "InavalidPatient");
        Patients memory pt;
        pt.b_type = _b_type;
    }

     //======================================== function Action ======================================================================

    
    function registerPatient(string calldata _name,string calldata _id ,string calldata _addr,string calldata _ppr_addr,string calldata _status,string calldata _price,string calldata _dateofbirth,string calldata _phone,string calldata _disease,string calldata _identification_pill,string calldata _healthAllergic,
    string calldata _gender,string calldata _b_type) external{
        require(patientAddressCheck[msg.sender] == false, "You are already registered!");

        Patients memory pt;
        pt.patient = msg.sender;
        pt.name = _name;
        pt.id = _id;
        pt.addr = _addr;
        pt.ppr_addr= _ppr_addr;
        pt.status = _status;
        pt.dateofbirth=_dateofbirth;
        pt.phone = _phone;
        pt.disease = _disease;
        pt.identification_pill = _identification_pill;
        pt.healthAllergic = _healthAllergic;
        pt.gender = _gender;
        pt.b_type = _b_type;
    }

    //relation Hos-Pa ***maybe use myHospital
    function acceptRelationHos (address id , string status) public returns (bool){
        relaHospital memory newRelaHospital = relaHospitals(id,status);
        relaHospitals[id].push(newRelaHospital);
        return true ;
    }

    function isHospital (Hospital id) public view returns (bool){
       if (relaHospitals[id] == true){
        return true;
       }
       return false;
    }
    
    function getHosDetail (address id) public {
        relaHospital currentHospital = relaHospital[id];
        return (currentHospital.name , currentHospital.addr,currentHospital.id);
    }

    //delete 

    function requestToRemove (address id) public {
        return id;
    }

    //

}