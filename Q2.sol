pragma solidity >=0.5.0 <0.6.0;

contract Fest {
    constructor() {
        owner = msg.sender;
    }
    event Desposit(address indexed _from, bytes32 indexed _id, uint _value);
    event Send(address indexed _to, bytes32 indexed _id, uint _value);

    mapping(address => uint) public balances;
    uint tickets_sold = 0;
    uint max_tickets = 10;

    function buyTicket() public payable {
        require(msg.value == 0.01 ether, "please send only 0.01 ether");
        if(tickets_sold>=max_tickets){
            throw;
        }
        tickets_sold++;
        balances[msg.sender]++;
    }

    function refundTicket() public{
        require(balances[msg.sender]>=1);
        msg.sender.tranfer(0.01 ether);
        balances[msg.sender]--;
        tickets_sold--;
    }
    function destroySmartContract(address payable _to) public {
        require(msg.sender == owner, "You are not the owner");
        selfdestruct(_to);
    }
}