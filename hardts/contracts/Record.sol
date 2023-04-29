pragma solidity ^0.8.0;

library Record{
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

    
}