pragma solidity >=0.5.0 <0.6.0;

contract Wallet {
    uint balance;
    address payable owner;
    constructor() public {
        owner = msg.sender;
    }

    function withdraw(uint _withdrawing_amount) public {
        require(msg.sender==owner);
        require(balance >= _withdrawing_amount);
        balance -= _withdrawing_amount;
        owner.transfer(_withdrawing_amount);
    }

    function deposit() public payable{
        balance += msg.value;
    }

    function display() public view returns (uint){
        require(msg.sender==owner);
        return balance;
    }
}