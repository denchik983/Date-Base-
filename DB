pragma solidity >=0.7.0;
 
contract User {
    uint id;
    string login;
    string password;
    address owner;
    constructor(string memory _login, string memory _password , uint Id){
        login = _login;
        password = _password;
        uint Id;
    }
   function getpassword() public view returns(string memory){
       require(msg.sender == owner);
        return password;
    }
    function getlogin() public view returns(string memory){
        require(msg.sender == owner);
        return login;
    }

}
 
contract Database {
     
    address[] private usersAddress;
    address owner;
    function getUsers(uint id) public view returns(address){
        require(msg.sender == owner);
        return usersAddress[id];
    }
     
    function pushUser(address userAddress) public{
         require(msg.sender == owner);
        usersAddress.push(userAddress);
        
    }
     
    function checkIn(address add) public view returns(bool){
        require(msg.sender == owner);
        for(uint i = 0; i <= usersAddress.length; i++){
            if(usersAddress[i] == add){
                return true;
            }
        }
        return false;
    }
    function pushAddr(address en_addr) public {
        require(msg.sender == owner);
        usersAddress.push(en_addr);
    }
    function createUser (string memory login, string memory password, uint Id) public {
      require(msg.sender == owner);
      User tmp = new User( login, password, Id);
      pushAddr(address(tmp));
      Id = usersAddress.pushAddr(address(login, password)) ;
      new User(Id, login, password);
    }

}
