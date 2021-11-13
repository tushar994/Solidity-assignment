pragma solidity >=0.5.0 <0.6.0;

contract Holder{
    address payable owner;
    address payable P;
    address payable Q;
    constructor(address payable _P, address payable _Q) public {
        owner = msg.sender;
        Q = _Q;
        P = _P;
    }

    bool paid = false;


    function PayForCar() public payable {
        require(Q==msg.sender);
        require(msg.value==100 wei);
        paid = true;
    }

    function RecievedCar() public payable{
        require(paid==true);
        require(owner==msg.sender);
        selfdestruct(P);
    }

}