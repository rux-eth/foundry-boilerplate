// SPDX-License-Identifier: UNLICENSED
pragma solidity >=0.8.4 <0.9.0;

import {Script} from "@forge-std/Script.sol";
import "@forge-std/console.sol";
import {GnosisSafe} from "@safe-contracts/GnosisSafe.sol";
import {Enum} from "@safe-contracts/common/Enum.sol";
import {GnosisSafeProxyFactory} from "@safe-contracts/proxies/GnosisSafeProxyFactory.sol";
import {GnosisSafeProxy} from "@safe-contracts/proxies/GnosisSafeProxy.sol";

// import {IERC20} from "openzeppelin-contracts/contracts/token/ERC20/IERC20.sol";
contract Deploy is Script {
    address MULTISIG_PROXY_ADDRESS = 0x5c44Fa66892cE4A1fdD0D25dC311F5682878F4b5;
    address MULTISIG_SINGLETON_ADDRESS =
        0xd9Db270c1B5E3Bd161E8c8503c55cEABeE709552;
    address GNOSIS_SAFE_PROXY_FACTORY_ADDRESS =
        0xa6B71E26C5e0845f74c812102Ca7114b6a896AB2;

    GnosisSafeProxyFactory proxyFactory =
        GnosisSafeProxyFactory(GNOSIS_SAFE_PROXY_FACTORY_ADDRESS);
    string[] commands = ["pwd"];

    function main() public {
        string
            memory rawTxDataStr = "0x6a761202000000000000000000000000d4d04e19ac3480721a0bd6f5c0bcf04b3938f2680000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000014000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000003c0000000000000000000000000000000000000000000000000000000000000024400774360000000000000000000000000000000000000000000000000000000000000002000000000000000000000000000000000000000000000000000000000000001ff608060405234801561001057600080fd5b506101fe806100206000396000f3fe608060405234801561001057600080fd5b506004361061002b5760003560e01c8063a81ce84714610030575b600080fd5b61004a600480360381019061004591906100d3565b610060565b6040516100579190610141565b60405180910390f35b60008367ffffffffffffffff1660028461007a919061018b565b67ffffffffffffffff161190509392505050565b600080fd5b600067ffffffffffffffff82169050919050565b6100b081610093565b81146100bb57600080fd5b50565b6000813590506100cd816100a7565b92915050565b6000806000606084860312156100ec576100eb61008e565b5b60006100fa868287016100be565b935050602061010b868287016100be565b925050604061011c868287016100be565b9150509250925092565b60008115159050919050565b61013b81610126565b82525050565b60006020820190506101566000830184610132565b92915050565b7f4e487b7100000000000000000000000000000000000000000000000000000000600052601160045260246000fd5b600061019682610093565b91506101a183610093565b92508282026101af81610093565b91508082146101c1576101c061015c565b5b509291505056fea26469706673582212203bb862c7a5c163a57f7f8c8c00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000082ff43474834c57fe5b1eada136d35a06398eade6b7cacb7f373335d0b28031d054f4d7c297b43a5785e407ae39345b78ee31213f3bd88d953a67fa9ce7fe580ff1b4a12f0257cd964da230ef7901675b901469abd1af7ec0f6922227912fd5039a15c04388cefff2d34bd4bc91c89d92bab357dc3b0f569e8e77c2c9507025c4e5d1b000000000000000000000000000000000000000000000000000000000000";
        bytes memory rawTxData = vm.parseBytes(rawTxDataStr);
        vm.startBroadcast();
        (bool success, bytes memory returnData) = call(rawTxData);
        vm.stopBroadcast();
        console.log("call success: %s", success);
    }

    function staticCall(bytes memory data)
        public
        view
        returns (bool success, bytes memory returnData)
    {
        (success, returnData) = MULTISIG_PROXY_ADDRESS.staticcall(data);
    }

    function call(bytes memory data)
        public
        returns (bool success, bytes memory returnData)
    {
        (success, returnData) = MULTISIG_PROXY_ADDRESS.call(data);
    }

    function run() external {
        main();
    }
}
