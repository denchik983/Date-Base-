pragma solidity >=0.7.0;
 
contract User {
    string login;
    string password;
    address owner;
    
    constructor(string memory _login, string memory _password){
        login = _login;
        password = _password;
        owner = msg.sender;
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
    
    constructor(){owner = msg.sender;}
    
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
        for(uint i = 0; i < usersAddress.length; i++){
            if(usersAddress[i] == add){
                return true;
            }
        }
        return false;
    }
    
    function createUser (string memory login, string memory password) public payable{
      require(msg.sender == owner);
      User tmp = new User(login, password);
      pushUser(address(tmp));
    }
    
    function getLenght() public view returns(uint) {return usersAddress.length;}

}


contract CreateDatabase{
    address[] private databaseAddress;
    
     function createDatabase() public payable returns(uint) {
         Database BD = new Database (); 
         databaseAddress.push (address(BD));
         return databaseAddress.length -1;
     }
     function getDatabase(uint id) public view returns(address) {
         return databaseAddress [id];
     }

}
