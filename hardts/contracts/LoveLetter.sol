pragma solidity ^0.8.0;

import "hardhat/console.sol";

contract LoveLetter {
    uint256 public totalLetters;
    mapping(uint256 => address) public senders;
    mapping(uint256 => address) public receivers;
    struct Letter {
        string message;
        uint256 etherAmount;
        bool opened;
    }
    mapping(uint256 => Letter) public letters;

    event Sent(
        address indexed from,
        address indexed to,
        uint256 indexed id,
        uint256 amount
    );
    event Opened(
        address indexed from,
        address indexed to,
        uint256 indexed id,
        uint256 amount
    );

    constructor() {
        totalLetters = 0;
    }

    function send(address to, string memory message)
        external
        payable
        returns (uint256 id)
    {
        id = totalLetters;
        senders[id] = msg.sender;
        receivers[id] = to;
        letters[id] = Letter({
            message: message,
            etherAmount: msg.value,
            opened: false
        });
        console.log("[send]", id, msg.value);
        totalLetters++;
        emit Sent(msg.sender, to, id, msg.value);
    }

    function open(uint256 id) external returns (string memory message) {
        require(receivers[id] == msg.sender, "Not receiver");
        require(!letters[id].opened, "Already opened");
        message = letters[id].message;
        letters[id].opened = true;
        uint256 amount = letters[id].etherAmount;
        console.log("[open]", id, amount);
        if (amount > 0) {
            payable(msg.sender).transfer(amount);
        }
        emit Opened(senders[id], msg.sender, id, amount);
    }

    function readMessage(uint256 id)
        external
        view
        returns (string memory message)
    {
        message = letters[id].message;
    }

    function checkOpened(uint256 id) external view returns (bool opened) {
        opened = letters[id].opened;
    }

    function getEtherAmount(uint256 id)
        external
        view
        returns (uint256 etherAmount)
    {
        etherAmount = letters[id].etherAmount;
    }

    function getSender(uint256 id) external view returns (address sender) {
        sender = senders[id];
    }

    function getReceiver(uint256 id) external view returns (address receiver) {
        receiver = receivers[id];
    }
}