import XCTest
import SwiftUI
@testable import FunctionalitySearcher
import UIKit

final class ConcreteFunctionalityFactoryTests: XCTestCase {
    
    var factory: ConcreteFunctionalityFactory!
    var context: AppContext!
    
    override func setUp() {
        super.setUp()
        factory = ConcreteFunctionalityFactory()
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
        factory = nil
        context = nil
        super.tearDown()
    }
    
    func testCreateViewControllerForBILL001() {
        let functionality = createMockFunctionality(code: "BILL_001", uiType: .uikit)
        var dismissCalled = false
        
        let viewController = factory.createViewController(
            for: functionality,
            context: context,
            onDismiss: { dismissCalled = true }
        )
        
        XCTAssertNotNil(viewController)
        XCTAssertTrue(viewController is UIKitFunctionality1)
        XCTAssertFalse(dismissCalled)
    }
    
    func testCreateViewControllerForBILL002() {
        let functionality = createMockFunctionality(code: "BILL_002", uiType: .swiftui)
        
        let viewController = factory.createViewController(
            for: functionality,
            context: context,
            onDismiss: {}
        )
        
        XCTAssertNotNil(viewController)
        XCTAssertTrue(viewController is UIHostingController<SwiftUIFunctionality1>)
    }
    
    func testCreateViewControllerForRET001() {
        let functionality = createMockFunctionality(code: "RET_001", uiType: .uikit)
        
        let viewController = factory.createViewController(
            for: functionality,
            context: context,
            onDismiss: {}
        )
        
        XCTAssertNotNil(viewController)
        XCTAssertTrue(viewController is UIKitFunctionality2)
    }
    
    func testCreateViewControllerForCERT001() {
        let functionality = createMockFunctionality(code: "CERT_001", uiType: .uikit)
        
        let viewController = factory.createViewController(
            for: functionality,
            context: context,
            onDismiss: {}
        )
        
        XCTAssertNotNil(viewController)
        XCTAssertTrue(viewController is UIKitFunctionality3)
    }
    
    func testCreateViewControllerForPROF001() {
        let functionality = createMockFunctionality(code: "PROF_001", uiType: .uikit)
        
        let viewController = factory.createViewController(
            for: functionality,
            context: context,
            onDismiss: {}
        )
        
        XCTAssertNotNil(viewController)
        XCTAssertTrue(viewController is UIKitFunctionality4)
    }
    
    func testCreateViewControllerForPROD001() {
        let functionality = createMockFunctionality(code: "PROD_001", uiType: .uikit)
        
        let viewController = factory.createViewController(
            for: functionality,
            context: context,
            onDismiss: {}
        )
        
        XCTAssertNotNil(viewController)
        XCTAssertTrue(viewController is UIKitFunctionality5)
    }
    
    func testCreateViewControllerForUnknownCode() {
        let functionality = createMockFunctionality(code: "UNKNOWN_001", uiType: .uikit)
        
        let viewController = factory.createViewController(
            for: functionality,
            context: context,
            onDismiss: {}
        )
        
        XCTAssertNotNil(viewController)
        XCTAssertTrue(viewController is UIKitFunctionalityTemplate)
    }
    
    func testCreateViewControllerForUnknownCodeSwiftUI() {
        let functionality = createMockFunctionality(code: "UNKNOWN_002", uiType: .swiftui)
        
        let viewController = factory.createViewController(
            for: functionality,
            context: context,
            onDismiss: {}
        )
        
        XCTAssertNotNil(viewController)
        XCTAssertTrue(viewController is UIHostingController<SwiftUIFunctionalityTemplate>)
    }
    
    func testOnDismissCallback() {
        let functionality = createMockFunctionality(code: "BILL_001", uiType: .uikit)
        var dismissCalled = false
        
        let viewController = factory.createViewController(
            for: functionality,
            context: context,
            onDismiss: { dismissCalled = true }
        ) as? UIKitFunctionality1
        
        XCTAssertNotNil(viewController)
        viewController?.onDismiss?()
        XCTAssertTrue(dismissCalled)
    }
    
    func testContextPassedToUIKitFunctionality1() {
        let functionality = createMockFunctionality(code: "BILL_001", uiType: .uikit)
        
        let viewController = factory.createViewController(
            for: functionality,
            context: context,
            onDismiss: {}
        ) as? UIKitFunctionality1
        
        XCTAssertNotNil(viewController)
        XCTAssertEqual(viewController?.functionality.code, "BILL_001")
    }
    
    func testContextPassedToSwiftUIFunctionality1() {
        let functionality = createMockFunctionality(code: "BILL_002", uiType: .swiftui)
        
        let viewController = factory.createViewController(
            for: functionality,
            context: context,
            onDismiss: {}
        ) as? UIHostingController<SwiftUIFunctionality1>
        
        XCTAssertNotNil(viewController)
        XCTAssertEqual(viewController?.rootView.functionality.code, "BILL_002")
        XCTAssertEqual(viewController?.rootView.userId, context.userId)
    }
    
    private func createMockFunctionality(code: String, uiType: UIType) -> Functionality {
        Functionality(
            id: code,
            code: code,
            name: "Test Functionality",
            path: "/test/\(code)",
            category: "Test",
            description: "Test description",
            keywords: ["test"],
            uiType: uiType
        )
    }
}
