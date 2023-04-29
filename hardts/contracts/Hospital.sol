pragma solidity ^0.8.0;

import "./Patient.sol";
import "./RecordActionfile.sol";

import "@openzeppelin/contracts/access/AccessControl.sol";
import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract Hospital {
    address owner;
    Patient public  myPatient;
    RecordActionfile public recordAction;


    //Hospital
    struct Hospitals {
        address Hospitals;
        string name;
        string  id;
        string  addr;
        string ppr_addr;
        string  status;
        string  ehr;
        string  permission;
        string  phone;
        string  fax_claim;
    
    }
    //
    struct relaPatient {
        address Hospitals;
        string staus;
        Patient id;
        
        
    }
    struct recordEHR {
        address id;
        string dataEHR;
        string other;

    }
    struct recordTreatment {
        address id;
        string dataTreatment;
        string other;


    }
    struct  recordPayment {
        address id;
        string dataPay;
        string other;


    }

    mapping( address => relaPatient[]) public relaPatients;
    
    mapping( address => bool) private hospitalAddressCheck;
    mapping( address => uint) private hospitalIndexes;

    Hospitals [] public listHospital ;

     constructor(address _idPatient)
    {
        owner = msg.sender;
        mypatient = myPatient(_idPatient) ;
    }

    modifier onlyHospital
    {
        require(hospitalAddressCheck[msg.sender] == true, "You are NOT a registered citizen");
        _;
    }

    
    function getHospitalDetails(address _hospital) public view returns(Hospitals memory)
    {
        require(hospitalAddressCheck[_hospital] == true, "Invalid patient");
        return listHospital[hospitalIndexes[_hospital]];
    }
    //id
    function getId() public view returns (string memory id ) {
        require(hospitalAddressCheck[msg.sender] == true, "You are NOT a registered Patient");
        return id;
    }
    function setId (string memory _id ) public view onlyHospital  {
        //require(patientAddressCheck[_id] == true, "InavalidPatient");
        Hospitals memory pt;
        pt.id = _id;
    }
    
    //ppr_addr
    function getPpr_addr() public view returns (string memory ppr_addr ) {
        require(hospitalAddressCheck[msg.sender] == true, "You are NOT a registered Patient");
        return ppr_addr;
    }
    function setPpr_addr (string memory _ppr_addr ) public view onlyHospital  {
        //require(patientAddressCheck[_id] == true, "InavalidPatient");
        Hospitals memory pt;
        pt.ppr_addr = _ppr_addr;
    }

    //status 
      function getStatus() public view returns (string memory status ) {
        require(hospitalAddressCheck[msg.sender] == true, "You are NOT a registered Patient");
        return status;
    }
    function setStatus (string memory _status ) public view onlyHospital  {
        //require(patientAddressCheck[_id] == true, "InavalidPatient");
        Hospitals memory pt;
        pt.status = _status;
    }
    //address
    function getAddress() public view returns (string memory addr ) {
        require(hospitalAddressCheck[msg.sender] == true, "You are NOT a registered Patient");
        return addr;
    }
    function setAddress (string memory _addr ) public view onlyHospital  {
        //require(patientAddressCheck[_id] == true, "InavalidPatient");
        Hospitals memory pt;
        pt.addr = _addr;
    }
    //EHR
    function getEHR() public view returns (string memory dataEHR ) {
        require(hospitalAddressCheck[msg.sender] == true, "You are NOT a registered Patient");
        return dataEHR;
    }
     function getEHRid() public view returns (string memory dataEHR ) {
        require(hospitalAddressCheck[msg.sender] == true, "You are NOT a registered Patient");
        return dataEHR;
    }
    
    function setEHR (string memory _ehr , string _other, Patients _id ) public view onlyHospital  {
        //require(patientAddressCheck[_id] == true, "InavalidPatient");
        recordEHR memory reEHR;
        reEHR.id = _id;
        reEHR.dataEHR = _data;
        reEHR.other = _other;
    }
    //permission
    function getPermission() public view returns (string memory permission ) {
        require(hospitalAddressCheck[msg.sender] == true, "You are NOT a registered Patient");
        return permission;
    }
    function setPermission (string memory _permission ) public view onlyHospital  {
        //require(patientAddressCheck[_id] == true, "InavalidPatient");
        Hospitals memory pt;
        pt.permission = _permission;
    }
    //phone
    function getPhone() public view returns (string memory phone ) {
        require(hospitalAddressCheck[msg.sender] == true, "You are NOT a registered Patient");
        return phone;
    }
    function setPhone (string memory _phone ) public view onlyHospital  {
        //require(patientAddressCheck[_id] == true, "InavalidPatient");
        Hospitals memory pt;
        pt.phone = _phone;
    }
    //fax_claim
    function getFax_claim() public view returns (string memory fax_claim ) {
        require(hospitalAddressCheck[msg.sender] == true, "You are NOT a registered Patient");
        return fax_claim;
    }
    function setFax_claim (string memory _fax_claim ) public view onlyHospital  {
        //require(patientAddressCheck[_id] == true, "InavalidPatient");
        Hospitals memory pt;
        pt.fax_claim = _fax_claim;
    }
   
         //======================================== function Action ======================================================================

    function addRelationHos (address id , string status ,string pa_id ) public {
            relaPatient memory newRelaPatient = relaPatient(id,status,pa_id);
            relaPatients[id].push(newRelaPatient);
            
    }

    function countRelationHos (address id) public returns (unit)  {
        return relaPatients[id].Lenght;
    }
//******** */
    function isPatient (Patient id) public view returns (bool){
       if (relaPatients[id] == true){
        return true;
       }
       return false;
    }

//******** maybe not work bc not have about detail in patient this is simple list**** */
    function getPatientDetail (address id ) public{ 
        if (isPatient(id) == true){
            //want to call data from patient 
            //make id to key for call data from 
           /*  relaPatient currentPatient = relaPatients[id];
            return (currentPatient.name, currentPatient.gender,currentPatient.id); */
            Patient memory _patient = myPatient.getAddr(id);
        }

    }



//========ehr fun==============
    function addEHR (string memory dataehr , string other, address idPatient, address idHospital) public {
        //check is in relation
        recordAction.setEHR( dataehr ,other, idPatient, idHospital);

    }   
    //id cuerrent hospital return all ehr 
    function getEHRpa (address _idHospital, address _idPatient) public {
        //checkrelation
        recordAction.getEHR(_idHospital, _idPatient);
    }
    
//======= payment =============

    function addPayment (string memory datapay , string other, address idPatient, address idHospital) public {
        //check is in relation
        recordAction.setPayment( datapay ,other, idPatient, idHospital);

    }   
    //id cuerrent hospital return all ehr 
    function getPaymentPa (address _idHospital, address _idPatient) public {
        //checkrelation
        recordAction.getPayment(_idHospital, _idPatient);
    }
//

}