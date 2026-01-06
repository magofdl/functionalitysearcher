import XCTest
@testable import FunctionalitySearcher
import SwiftUI

final class SwiftUIFunctionalityTests: XCTestCase {
    
    var functionality: Functionality!
    var context: AppContext!
    
    override func setUp() {
        super.setUp()
        functionality = Functionality(
            id: "TEST_001",
            code: "TEST_001",
            name: "Test Functionality",
            path: "/test/001",
            category: "Test",
            description: "Test description",
            keywords: ["test"],
            uiType: .swiftui
        )
        context = AppContext(
            userId: "TEST-USER-123",
            timestamp: Date(),
            region: "US",
            contractCount: 5,
            userEmail: "test@example.com",
            userRole: "admin"
        )
    }
    
    override func tearDown() {
        functionality = nil
        context = nil
        super.tearDown()
    }
    
    func testSwiftUIFunctionality1Initialization() {
        var dismissCalled = false
        
        let view = SwiftUIFunctionality1(
            functionality: functionality,
            userId: context.userId,
            onDismiss: { dismissCalled = true }
        )
        
        XCTAssertEqual(view.functionality.code, functionality.code)
        XCTAssertEqual(view.userId, context.userId)
        XCTAssertNotNil(view.onDismiss)
        
        view.onDismiss?()
        XCTAssertTrue(dismissCalled)
    }
    
    func testSwiftUIFunctionality2Initialization() {
        let view = SwiftUIFunctionality2(
            functionality: functionality,
            userId: context.userId,
            timestamp: context.timestamp,
            onDismiss: {}
        )
        
        XCTAssertEqual(view.functionality.code, functionality.code)
        XCTAssertEqual(view.userId, context.userId)
        XCTAssertEqual(view.timestamp, context.timestamp)
    }
    
    func testSwiftUIFunctionality3Initialization() {
        let view = SwiftUIFunctionality3(
            functionality: functionality,
            userId: context.userId,
            region: context.region,
            onDismiss: {}
        )
        
        XCTAssertEqual(view.functionality.code, functionality.code)
        XCTAssertEqual(view.userId, context.userId)
        XCTAssertEqual(view.region, context.region)
    }
    
    func testSwiftUIFunctionality4Initialization() {
        let view = SwiftUIFunctionality4(
            functionality: functionality,
            userId: context.userId,
            userEmail: context.userEmail,
            onDismiss: {}
        )
        
        XCTAssertEqual(view.functionality.code, functionality.code)
        XCTAssertEqual(view.userId, context.userId)
        XCTAssertEqual(view.userEmail, context.userEmail)
    }
    
    func testSwiftUIFunctionality5Initialization() {
        let view = SwiftUIFunctionality5(
            functionality: functionality,
            userId: context.userId,
            contractCount: context.contractCount,
            onDismiss: {}
        )
        
        XCTAssertEqual(view.functionality.code, functionality.code)
        XCTAssertEqual(view.userId, context.userId)
        XCTAssertEqual(view.contractCount, context.contractCount)
    }
    
    func testSwiftUIFunctionalityWithNilOptionalValues() {
        let contextWithNil = AppContext(
            userId: "TEST-USER",
            timestamp: Date(),
            region: "US",
            contractCount: 1,
            userEmail: nil,
            userRole: nil
        )
        
        let view4 = SwiftUIFunctionality4(
            functionality: functionality,
            userId: contextWithNil.userId,
            userEmail: contextWithNil.userEmail,
            onDismiss: {}
        )
        
        XCTAssertNil(view4.userEmail)
        
        let view10 = SwiftUIFunctionality10(
            functionality: functionality,
            userId: contextWithNil.userId,
            userRole: contextWithNil.userRole,
            onDismiss: {}
        )
        
        XCTAssertNil(view10.userRole)
    }
}
