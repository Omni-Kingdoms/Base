// SPDX-License-Identifier: MIT

pragma solidity ^0.8.2;

import "@openzeppelin/contracts/access/Ownable.sol";
import "./Redstone-PriceAware.sol";

contract PriceAwareOwnable is PriceAware, Ownable {
    address private trustedSigner;

    function authorizeSigner(address _trustedSigner) internal onlyOwner {
        require(_trustedSigner != address(0));
        trustedSigner = _trustedSigner;

        emit TrustedSignerChanged(trustedSigner);
    }

    function isSignerAuthorized(address _receviedSigner) internal view virtual override returns (bool) {
        return _receviedSigner == trustedSigner;
    }

    /* ========== EVENTS ========== */

    /**
     * @dev emitted after the owner updates trusted signer
     * @param newSigner the address of the new signer
     *
     */
    event TrustedSignerChanged(address indexed newSigner);
}
