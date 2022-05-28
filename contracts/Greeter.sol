//SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.0;

contract Greeter {
    event MExecued(
        uint256 Param1,
        uint256 Param2,
        uint256 Param3,
        address Param4,
        uint256 Param5,
        uint256 Param6
    );

    // The original function M
    function M(
        uint256 Param1,
        uint256 Param2,
        uint256 Param3,
        address Param4,
        uint256 Param5,
        uint256 Param6
    ) public {
        require(Param1 > 0 && Param1 < 10**4, "Param1 Error");
        require(Param2 > 0 && Param2 < 10**4, "Param2 Error");
        require(Param3 > 10**4 && Param3 < 2 * 10**4, "Param3 Error");
        require(Param4 != address(0), "Param4 is zero");
        require(Param5 > 0 && Param5 < 10**4, "Param5 Error");
        require(Param6 > 10**4 && Param1 < 2 * 10**4, "Param6 Error");

        emit MExecued(Param1, Param2, Param3, Param4, Param5, Param6);
    }

    // Function overloading
    function M() public {
        uint256 Param1Default = 1 * 10**3;
        uint256 Param2Default = 2 * 10**3;
        uint256 Param3Default = 3 * 10**3 + 1 * 10**4;
        address Param4Default = msg.sender;
        uint256 Param5Default = 5 * 10**3;
        uint256 Param6Default = 6 * 10**3 + 1 * 10**4;
        
        emit MExecued(
            Param1Default,
            Param2Default,
            Param3Default,
            Param4Default,
            Param5Default,
            Param6Default
        );
    }
}
