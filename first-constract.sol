pragma solidity >=0.7.0 <0.9.0;

contract firtconstract {
  uint saveData;
  uint public data;

  function set(uint x) public {
    saveData = x;
    data = x;
  }

  function get() public view returns (uint x) {
    return saveData;
  }
}