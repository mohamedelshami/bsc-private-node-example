pragma solidity >=0.4.21 <0.6.0;

contract Precompiles {
    function sha3fips(bytes memory data) public view returns (bytes32) {
        bytes32[1] memory h;
        assembly {
            if iszero(
                staticcall(not(0), 0x66, add(data, 32), mload(data), h, 32)
            ) {
                invalid()
            }
        }
        return h[0];
    }

    function ecrecoverPublicKey(
        bytes32 _hash,
        uint8 _v,
        bytes32 _r,
        bytes32 _s
    ) public view returns (bytes memory) {
        bytes memory pubkey = new bytes(65);

        assembly {
            let input := mload(0x40)
            mstore(input, _hash)
            mstore(add(input, 32), _v)
            mstore(add(input, 64), _r)
            mstore(add(input, 96), _s)

            // NOTE: we can reuse the request memory
            if iszero(staticcall(not(0), 0x67, input, 128, input, 65)) {
                revert(0, 0)
            }
            mstore(add(pubkey, 0x20), mload(input))
            mstore(add(pubkey, 0x40), mload(add(input, 0x20)))
            mstore(add(pubkey, 0x60), mload(add(input, 0x40)))
        }

        return pubkey;
    }
}
