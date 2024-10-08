// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Script, console} from "forge-std/Script.sol";
import {QAccProjectNFT} from "../src/QAccProjectNFT.sol";

contract QAccProjectNFTScript is Script {
    QAccProjectNFT public nft;

    function setUp() public {}

    function run() public {
        vm.startBroadcast();

        address deployer = tx.origin;

        nft = new QAccProjectNFT("QAccProjectNFT", "QAPNFT", deployer, "BaseURI");

        vm.stopBroadcast();
    }
}
