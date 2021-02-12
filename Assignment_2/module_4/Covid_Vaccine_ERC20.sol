pragma solidity >=0.6.0 <0.7.0;

import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/release-v3.0.0/contracts/token/ERC20/ERC20.sol";


contract CovidVaccineToken is ERC20 {
    constructor(uint256 initialSupply) public ERC20("Covid-19 Vaccine", "CDC") {
        _mint(msg.sender, initialSupply);
    }
}

// contract CovidVaccineERC is ERC20 {
//     event feeGenerated(uint);
//     address baseAddress;
//     uint rate;
//     constructor (string memory name, string memory symbol) ERC20(name, symbol) public {
//         baseAddress = msg.sender;
//         rate = 5; // 5/100 
//         _mint(msg.sender, 10000000);
//     }
//     function transfer(address recipient, uint256 amount) public override returns (bool) {
//         uint fee = (amount * rate) / 100;
//         _transfer(_msgSender(), baseAddress, fee); // send fee
//         emit feeGenerated(fee);
//         super.transfer(recipient, amount);
//         return true;
//     }
// }