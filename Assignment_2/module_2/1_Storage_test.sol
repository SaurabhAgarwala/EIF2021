pragma solidity >=0.4.22 <0.8.0;
import "remix_tests.sol"; // this import is automatically injected by Remix.
import "remix_accounts.sol";
import "../contracts/1_Storage.sol";


contract MyTest {
    Storage foo;

    // beforeEach works before running each test
    function beforeEach() public {
        foo = new Storage();
    }

    /// Test if initial value is equal to the default value i.e. 0
    function initialValueShouldBe0() public returns (bool) {
        return Assert.equal(foo.retrieve(), 0, "initial value is not correct");
    }

    /// Test if value is set as expected
    function valueIsSet200() public returns (bool) {
        foo.store(200);
        return Assert.equal(foo.retrieve(), 200, "value is not 200");
    }
}