pragma solidity ^0.8.0;

contract VendingMachine {

    // Declare state variables of the contract
    address public patient;
    string public name;

    // When 'VendingMachine' contract is deployed:
    // 1. set the deploying address as the sen of the contract
    // 2. set the deployed smart contract's cupcake balance to 100
    constructor() {
        patient = msg.sender;
        name = name;
    }

    // Allow the owner to increase the smart contract's cupcake balance
    function refill(string memory _name) public {
        require(msg.sender == patient, "Only the owner can refill.");
        name = _name;
    }

    // Allow anyone to purchase cupcakes
    function purchase(uint amount) public payable {
        require(msg.value >= amount * 1 ether, "You must pay at least 1 ETH per cupcake");
  
    }
}
