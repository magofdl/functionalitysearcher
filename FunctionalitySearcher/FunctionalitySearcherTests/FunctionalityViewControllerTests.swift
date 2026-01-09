import XCTest
@testable import FunctionalitySearcher
import UIKit

final class FunctionalityViewControllerTests: XCTestCase {
    
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
            uiType: .uikit
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
    
    func testDownloadInvoiceViewControllerInitialization() {
        var dismissCalled = false
        
        let viewController = DownloadInvoiceViewController(
            functionality: functionality,
            userId: context.userId,
            onDismiss: { dismissCalled = true }
        )
        
        XCTAssertEqual(viewController.functionality.code, functionality.code)
        XCTAssertNotNil(viewController.onDismiss)
        
        viewController.onDismiss?()
        XCTAssertTrue(dismissCalled)
    }
    
    func testInitiateReturnViewControllerInitialization() {
        let viewController = InitiateReturnViewController(
            functionality: functionality,
            userId: context.userId,
            timestamp: context.timestamp,
            onDismiss: {}
        )
        
        XCTAssertEqual(viewController.functionality.code, functionality.code)
    }
    
    func testGetCertificateViewControllerInitialization() {
        let viewController = GetCertificateViewController(
            functionality: functionality,
            userId: context.userId,
            region: context.region,
            onDismiss: {}
        )
        
        XCTAssertEqual(viewController.functionality.code, functionality.code)
    }
    
    func testEditProfileViewControllerInitialization() {
        let viewController = EditProfileViewController(
            functionality: functionality,
            userId: context.userId,
            userEmail: context.userEmail,
            onDismiss: {}
        )
        
        XCTAssertEqual(viewController.functionality.code, functionality.code)
    }
    
    func testSearchProductsViewControllerInitialization() {
        let viewController = SearchProductsViewController(
            functionality: functionality,
            userId: context.userId,
            contractCount: context.contractCount,
            onDismiss: {}
        )
        
        XCTAssertEqual(viewController.functionality.code, functionality.code)
    }
    
    func testBaseFunctionalityViewControllerProperties() {
        let viewController = DownloadInvoiceViewController(
            functionality: functionality,
            userId: context.userId,
            onDismiss: {}
        )
        
        XCTAssertEqual(viewController.functionality.id, functionality.id)
        XCTAssertEqual(viewController.functionality.name, functionality.name)
        XCTAssertEqual(viewController.functionality.category, functionality.category)
    }
    
    func testBaseFunctionalityViewControllerOnDismiss() {
        var dismissCount = 0
        
        let viewController = DownloadInvoiceViewController(
            functionality: functionality,
            userId: context.userId,
            onDismiss: { dismissCount += 1 }
        )
        
        XCTAssertEqual(dismissCount, 0)
        viewController.onDismiss?()
        XCTAssertEqual(dismissCount, 1)
        viewController.onDismiss?()
        XCTAssertEqual(dismissCount, 2)
    }
    
    func testViewOrdersViewControllerInitialization() {
        let viewController = ViewOrdersViewController(
            functionality: functionality,
            userId: context.userId,
            timestamp: context.timestamp,
            onDismiss: {}
        )
        
        XCTAssertEqual(viewController.functionality.code, functionality.code)
    }
    
    func testMonthlyBillingViewControllerInitialization() {
        let viewController = MonthlyBillingViewController(
            functionality: functionality,
            userId: context.userId,
            region: context.region,
            onDismiss: {}
        )
        
        XCTAssertEqual(viewController.functionality.code, functionality.code)
    }
    
    func testReturnStatusViewControllerInitialization() {
        let viewController = ReturnStatusViewController(
            functionality: functionality,
            userId: context.userId,
            onDismiss: {}
        )
        
        XCTAssertEqual(viewController.functionality.code, functionality.code)
    }
    
    func testDownloadCertificateViewControllerInitialization() {
        let viewController = DownloadCertificateViewController(
            functionality: functionality,
            userId: context.userId,
            contractCount: context.contractCount,
            onDismiss: {}
        )
        
        XCTAssertEqual(viewController.functionality.code, functionality.code)
    }
    
    func testViewPersonalInfoViewControllerInitialization() {
        let viewController = ViewPersonalInfoViewController(
            functionality: functionality,
            userId: context.userId,
            userRole: context.userRole,
            onDismiss: {}
        )
        
        XCTAssertEqual(viewController.functionality.code, functionality.code)
    }
}
