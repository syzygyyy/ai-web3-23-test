pragma solidity 0.8.0;

contract VulnerableToken{
    uint256 public totalSupply;
    uint256 public balance;
    mapping(address => uint256) public balances;

    function deposit() public payable {
        balances[msg.sender] += msg.value;
    }

    function withdraw(uint256 _amount) public {
        require(balances[msg.sender] >= _amount);
        payable(msg.sender).transfer(_amount);
        balances[msg.sender] -= _amount;
    }

    function getPrice() public view returns (uint256) {
        uint256 price = 10000 / totalSupply;
        return price
    }
}

