// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

import "@openzeppelin/contracts/utils/cryptography/ECDSA.sol";

contract zrSignVerifier {
    using ECDSA for bytes32;

    /**
     * @dev Verifies that the message was signed by the given signer.
     * @param signer The address of the signer.
     * @param signature The signature of the message.
     * @param messageHash The hash of the message.
     * @return bool True if the signature is valid, false otherwise.
     */
    function verifySignature(address signer, bytes memory signature, bytes32 messageHash) public pure returns (bool) {
        // Recover the signer address from the message hash and the signature
        address recoveredSigner = messageHash.toEthSignedMessageHash().recover(signature);
        // Check if the recovered address matches the signer address
        return recoveredSigner == signer;
    }
}
