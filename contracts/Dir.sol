pragma solidity ^0.4.4;

contract Mortal{
  string Name;
  address public owner;
  uint Ethr;

  function Mortal(){
    Name="No name";
    owner=msg.sender;
    Ethr=10;
  }
  function kill(){
    suicide(owner);
  }

}

contract Dir is Mortal{

  struct People{
    bytes32 FName;
    bytes32 LName;
    uint age;
  }
  People[] public people;

  function GetNames(bytes32 fName,bytes32 lName,uint age) returns (bool state){
    People memory NewPerson;
     NewPerson.FName=fName;
     NewPerson.LName=lName;
     NewPerson.age=age;
     people.push(NewPerson);

     return true;
  }
  function ShNames() constant returns (bytes32[],bytes32[],uint[]){
    uint length=people.length;
    bytes32[] memory fnames= new bytes32[](length);
    bytes32[] memory lnames=new bytes32[](length);
    uint[] memory ages=new uint[](length);

    for(uint i=0;i<length;i++){
      fnames[i]=people[i].FName;
      lnames[i]=people[i].LName;
      ages[i]=people[i].age;
    }

    return(fnames,lnames,ages);



  }




}
