pragma solidity >=0.5.0 <0.6.0;

contract CarRental {
    constructor() {
        owner = msg.sender;
    }
    mapping (address => uint) rentals;
    
    function confirmAgreement()
}