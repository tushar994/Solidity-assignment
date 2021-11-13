pragma solidity >=0.4.0 <0.4.1;

contract Fest2 {
    address owner;
    function constructor() public {
        owner = msg.sender;
    }
    event Desposit(address indexed _from, bytes32 indexed _id, uint _value);
    event Send(address indexed _to, bytes32 indexed _id, uint _value);

    mapping(address => uint) public balances;
    uint tickets_sold = 0;
    uint max_tickets = 10;

    function buyTicket() public payable {
        if(msg.value != 100 wei){
            throw;   
        }
        if(tickets_sold>=max_tickets){
            throw;
        }
        tickets_sold++;
        balances[msg.sender]++;
    }

    function refundTicket() public{
        if(balances[msg.sender]==0){
            throw;
        }
        address sender = msg.sender;
        bool k = sender.send(100 wei);
        balances[msg.sender]--;
        tickets_sold--;
    }
    function destroySmartContract(address _to) public {
        if(msg.sender != owner){
            throw;
        }
        selfdestruct(_to);
    }
}