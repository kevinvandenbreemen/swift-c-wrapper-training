import XCTest
@testable import swift_c_wrappin

final class swift_c_wrappinTests: XCTestCase {
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        SwiftKevin().printGreeting()
    }

    static var allTests = [
        ("testExample", testExample),
    ]
}
