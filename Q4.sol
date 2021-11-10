pragma solidity >=0.5.0 <0.6.0;

contract Holder{
    constructor(address _P, address _Q, uint _car_cost) {
        owner = msg.sender;
        Q = _Q;
        P = _P;
        car_cost = _car_cost;
    }

    paid = false;


    function PayForCar() public payable {
        require(Q==msg.sender);
        require(msq.value==car_cost);
        paid = true;
    }

    function RecievedCar() public{
        require(paid==true);
        require(owner==msg.sender);
        selfdestruct(P);
    }

}