pragma solidity >=0.5.0 <0.6.0;

contract Credit{
    mapping (address => uint) credits;

    function AddFunds() public payable {
        credits[msg.sender] += msg.value;
    }

    function ViewEther(address _add) public view returns (uint){
        return credits[_add];
    }

    function Withdraw(uint _amount) public {
        require(credits[msg.sender]>=_amount);
        msg.sender.transfer(_amount);
        credits[msg.sender] -= _amount;
    }
}