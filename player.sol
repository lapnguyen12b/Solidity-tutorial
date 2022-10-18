pragma solidity >=0.7.0 <0.9.0;

contract Game {

  uint public countPlayer = 0;
  // Player public players;
  // Player[] public playerArray;
  mapping (address => Player) public playerMapping;
  enum Level {fresher, junior, senior}

  struct Player {
    address addressPlayer;
    string fullName;
    uint age;
    Level playerLevel;
    string sex;
    uint createdAt;
  }
  
  function addPlayer(string memory fullName, uint age, string memory sex) public {
    // players = Player(fullName, age, sex);
    // playerArray.push(Player(fullName, age, sex));
    playerMapping[msg.sender] = Player(msg.sender, fullName, age, Level.fresher, sex, block.timestamp);
    countPlayer += 1;
  }

  function getPlayerLevel(address addressPlayer) public view returns (Level) {
    return playerMapping[addressPlayer].playerLevel;
  }

  function changePlayerLevel(address playerAddress) public {
    Player storage newPlayer = playerMapping[playerAddress];
    if (block.timestamp >= newPlayer.createdAt + 15) {
      newPlayer.playerLevel = Level.junior;
    }
  }
}