pragma solidity >=0.7.0 <0.8.0;

contract DeadMansSwitch {
    address payable owner;
    address payable ownersInheriter = address(0x0);
    uint256 lastAliveBlock;
    mapping(address => uint256) balances;
    
    constructor() {
        owner = msg.sender;
        lastAliveBlock = block.number;
        balances[owner] = 10000000000;    
    }
    
    function get_balance(address addr) public view returns(uint256){
        return balances[addr];
    }
    
    function transfer_balance(address sender, address receiver, uint256 amount) public payable{
        balances[sender] -= amount;
        balances[receiver] += amount;
    }
    
    function set_inheriter(address payable inheriter) public {
        require(msg.sender==owner, "You are not authorised to set the inheriter");
        ownersInheriter = inheriter;
    }
    
    function still_alive() public{
        require(msg.sender==owner, "You are not authorised report owner's status");
        lastAliveBlock = block.number;
    }
    
    function transfer_assets() public payable {
        require(ownersInheriter!=address(0x0), "Inheriter Not Set By the owner. Can't perform transfer");
        require((block.number-lastAliveBlock)>1, "Owner still alive. Can't perform transfer.");
        transfer_balance(owner, ownersInheriter, balances[owner]);
        owner = ownersInheriter;
        lastAliveBlock = block.number;
    }
    
}
