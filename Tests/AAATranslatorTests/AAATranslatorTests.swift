    import XCTest
    @testable import AAATranslator

    final class AAATranslatorTests: XCTestCase {
        func testExample() {
            print("Text is \(AAATranslator().text)") 
            // This is an example of a functional test case.
            // Use XCTAssert and related functions to verify your tests produce the correct
            // results.
            XCTAssertEqual(AAATranslator().text, "Hello, World!")
        }
    }
