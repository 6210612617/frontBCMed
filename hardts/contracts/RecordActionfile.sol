pragma solidity ^0.8.0;

import "./Patient.sol";
import "./Hospital.sol";
import "./Insurance.sol";

contract RecordActionfile {
    Patient public  myPatient;
    Hospital public myHospital;

    uint count1 = 0;
    uint count2 = 0;
    uint count3 = 0;
    uint count4 = 0;
    uint recordid = 0;

    struct recordEHR {
        string recordid;
        string idPatient;
        string idHospital;
        string dataEHR;
        string other;

    }
    struct recordTreatment {
        string recordid;
        string idPatient;
        string idHospital;
        string dataTreatment;
        string other;


    }
    struct  recordPayment {
        string recordid;
        string idPatient;
        string idHospital;
        string dataPayment;
        string other;

    }

    struct recordInsurance {
        string recordid;
        string idPatient;
        string idInsu;
        string datapoiicy; //all detail
        string policyid;
        string other;
    }

    mapping(address => recordEHR[]) public historyEHR;
    mapping(address => recordTreatment[]) public historyTreatment;
    mapping(address => recordPayment[]) public historyPayment;

  
    function generateid (string kindOfUser) public returns (string){
        if (kindOfUser == 1){
            recordid = recordid + count1;
            while (historyEHR[recordid] == false){
                uint256 randNumber = random();
                uint256 randNumberMod = randNumber % 10;
                recordid = 100 + randNumberMod;
                count1++;
            }
        }
        else if (kindOfUser == 2){
            recordid = recordid + count2;
            while (historyTreatment[recordid] == false){
                uint256 randNumber = random();
                uint256 randNumberMod = randNumber % 10;
                recordid = 100 + randNumberMod;
                count2++;
            }
        }
        else if (kindOfUser == 3){
            recordid = recordid + count3;
            while (historyPayment[recordid] == false){
                uint256 randNumber = random();
                uint256 randNumberMod = randNumber % 10;
                recordid = 100 + randNumberMod;
                count3++;
            }
        }
        else if (kindOfUser == 4){
            recordid = recordid + count4;
            while (historyInsurance[recordid] == false){
                uint256 randNumber = random();
                uint256 randNumberMod = randNumber % 10;
                recordid = 100 + randNumberMod;
                count4++;
            }
        }
        return recordid;
    }

      //ehr set ==============ehr===============
    function setEHR (string memory dataehr , string other, address idPatient, address idHospital) public {
        //require(patientAddressCheck[_id] == true, "InavalidPatient");
        recordid = generateid(1);
        recordEHR memory newRec = recordEHR(idPatient,dataehr,other,idHospital,recordid);
        historyEHR[recordid].push(newRec);
    }
    //get all data ehr in this patient
    function getEHR (address _idHospital, address _idPatient) public {
        //hospital request "id is pateint" so check is have raltion
        uint i = 0;
        recordids[] = findHistoryEHR(_idPatient);
        if (recordids.Lenght != 0 ){
            while (i > recordids.Lenght){
                dataEhr[] =  historyEHR[recordid].dataEHR;
                dataidHospital[] =historyEHR[recordid].idHospital;
                dataother[] = historyEHR[recordid].other;
                datarecid[] =historyEHR[recordid].recordid;
                dataidPatient[] = historyEHR[recordid].idPatient;
                i++;
            }
            return (dataEhr,dataid,dataother,datarecid,dataidPatient,dataidHospital);
       }

    
    }

    function getDetailEhr (string _idrecord) public returns (string){
            dataEhr =  historyEHR[recordid].dataEHR;
            dataidHospital =historyEHR[recordid].idHospital;
            dataother = historyEHR[recordid].other;
            datarecid =historyEHR[recordid].recordid;
            dataidPatient = historyEHR[recordid].idPatient;
            return (dataEhr,dataid,dataother,datarecid,dataidPatient,dataidHospital);

    }
    //find record  id to show in another function
    function findHistoryEHR (address _idHospital, address _idPatient) public {
        uint i ;
        while (i<(historyEHR.Lenght)){
            if (historyEHR[i].idPatient == _idPatient){
                historyrecord[] = historyEHR[i].recordid ;
            }
            i++;
        }
        return historyrecord;
        
    }
    //==================== tratment zone ====================
    function setTreatment (string memory datatreat , string other, address idPatient, address idHospital) public {
        //require(patientAddressCheck[_id] == true, "InavalidPatient");
        recordid = generateid(2);
        recordTreatment memory newRec = recordTreatment(recordid,idPatient,idHospital,datatreat,other);
        historyTreatment[recordid].push(newRec);
    }

    function getTreatment (address _idHospital, address _idPatient) public {
        //hospital request "id is pateint" so check is have raltion
        recordid = findHistoryTreatment(_idPatient);
        if (recordid != 0 ){
            dataTreat[] =  historyTreatment[recordid].dataTreatment;
            dataidHospital[] =  historyTreatment[recordid].idHospital;
            dataidpatient [] =  historyTreatment[recordid].idPatient;
            dataid[] =  historyTreatment[recordid].recordid;
            dataother[] = historyTreatment[recordid].other;

            return (dataTreat,dataidHospital,dataidpatient,dataid,dataother);
       }
    
    }
    function findHistoryTreatment (address _idHospital, address _idPatient) public {
        uint i ;
        while (i<(historyTreatment.Lenght)){
            if (historyTreatment[i].idPatient == _idPatient){
                return historyTreatment[i].recordid ;
            }
            i++;
        }
        return 0;
        
    }
   //==================== Payment zone ====================
    function setPayment(string memory datapayment , string other, address idPatient, address idHospital) public {
        //require(patientAddressCheck[_id] == true, "InavalidPatient");
        recordid = generateid(3);
        recordPayment memory newRec = recordPayment(recordid,idPatient,idHospital,datapayment,other);
        historyPayment[recordid].push(newRec);
    }

    function getPayment(address _idHospital, address _idPatient) public {
        //hospital request "id is pateint" so check is have raltion
        recordid = findHistoryPayment(_idPatient);
        if (recordid != 0 ){
            dataPay[] =  historyPayment[recordid].dataPayment;
            dataidHospital[] =  historyPayment[recordid].idHospital;
            dataidpatient [] = historyPayment[recordid].idPatient;
            dataid[] = historyPayment[recordid].recordid;
            dataother[] =historyPayment[recordid].other;

            return (dataPay,dataidHospital,dataidpatient,dataid,dataother);
       }
    
    }
    function findHistoryPayment (address _idHospital, address _idPatient) public {
        uint i ;
        while (i<(historyPayment.Lenght)){
            if (historyPayment[i].idPatient == _idPatient){
                return historyPayment[i].recordid ;
            }
            i++;
        }
        return 0;
        
    }

   //==================== recInsurance zone ====================
    function setPayment(string memory datapayment , string other, address idPatient, address idHospital) public {
        //require(patientAddressCheck[_id] == true, "InavalidPatient");
        recordid = generateid(4);
        recordPayment memory newRec = recordPayment(recordid,idPatient,idHospital,datapayment,other);
        historyPayment[recordid].push(newRec);
    }

    function getPayment(address _idHospital, address _idPatient) public {
        //hospital request "id is pateint" so check is have raltion
        recordid = findHistoryPayment(_idPatient);
        if (recordid != 0 ){
            dataPay[] =  historyPayment[recordid].dataPayment;
            dataidHospital[] =  historyPayment[recordid].idHospital;
            dataidpatient [] = historyPayment[recordid].idPatient;
            dataid[] = historyPayment[recordid].recordid;
            dataother[] =historyPayment[recordid].other;

            return (dataPay,dataidHospital,dataidpatient,dataid,dataother);
       }
    
    }
    function findHistoryPayment (address _idHospital, address _idPatient) public {
        uint i = 0 ;
        while (i<(historyPayment.Lenght)){
            if (historyPayment[i].idPatient == _idPatient){
                return historyPayment[i].recordid ;
            }
            i++;
        }
        return 0;
        
    }


   



  

   
}