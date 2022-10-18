pragma solidity >=0.7.0 <0.9.0;

contract FirstCoin {
  address public minter;
  mapping (address => uint) public balances;

  event sent(address from, address to, uint amount);

  modifier onlyMinter() {
    require(msg.sender == minter);
    _;
  }

  modifier checkAmount(uint amount) {
    require(amount < 1e60);
    _;
  }

  modifier checkBalance(uint amount) {
    require(amount <= balances[msg.sender], "khong du tien");
    _;
  }

  constructor () {
    minter = msg.sender;
  }

  function mint(address receiver, uint amount) public onlyMinter checkAmount(amount){
    // require(msg.sender == minter);
    // require(amount < 1e60);
    balances[receiver] += amount;
  }

  function send(address receiver, uint amount) public checkBalance(amount){
    // require(amount <= balances[msg.sender], "khong du tien");
    balances[msg.sender] -= amount;
    balances[receiver] += amount;
    emit sent(msg.sender, receiver, amount);
  }
}