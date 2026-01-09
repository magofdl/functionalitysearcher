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
    
    func testInvoiceHistoryViewInitialization() {
        var dismissCalled = false
        
        let view = InvoiceHistoryView(
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
    
    func testTrackReturnViewInitialization() {
        let view = TrackReturnView(
            functionality: functionality,
            userId: context.userId,
            timestamp: context.timestamp,
            onDismiss: {}
        )
        
        XCTAssertEqual(view.functionality.code, functionality.code)
        XCTAssertEqual(view.userId, context.userId)
        XCTAssertEqual(view.timestamp, context.timestamp)
    }
    
    func testRenewCertificateViewInitialization() {
        let view = RenewCertificateView(
            functionality: functionality,
            userId: context.userId,
            region: context.region,
            onDismiss: {}
        )
        
        XCTAssertEqual(view.functionality.code, functionality.code)
        XCTAssertEqual(view.userId, context.userId)
        XCTAssertEqual(view.region, context.region)
    }
    
    func testChangePasswordViewInitialization() {
        let view = ChangePasswordView(
            functionality: functionality,
            userId: context.userId,
            userEmail: context.userEmail,
            onDismiss: {}
        )
        
        XCTAssertEqual(view.functionality.code, functionality.code)
        XCTAssertEqual(view.userId, context.userId)
        XCTAssertEqual(view.userEmail, context.userEmail)
    }
    
    func testProductDetailsViewInitialization() {
        let view = ProductDetailsView(
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
        
        let view = ChangePasswordView(
            functionality: functionality,
            userId: contextWithNil.userId,
            userEmail: contextWithNil.userEmail,
            onDismiss: {}
        )
        
        XCTAssertNil(view.userEmail)
    }
    
    func testExportInvoicesViewInitialization() {
        let view = ExportInvoicesView(
            functionality: functionality,
            userId: context.userId,
            region: context.region,
            onDismiss: {}
        )
        
        XCTAssertEqual(view.functionality.code, functionality.code)
        XCTAssertEqual(view.userId, context.userId)
        XCTAssertEqual(view.region, context.region)
    }
    
    func testReturnHistoryViewInitialization() {
        let view = ReturnHistoryView(
            functionality: functionality,
            userId: context.userId,
            onDismiss: {}
        )
        
        XCTAssertEqual(view.functionality.code, functionality.code)
        XCTAssertEqual(view.userId, context.userId)
    }
    
    func testActiveCertificatesViewInitialization() {
        let view = ActiveCertificatesView(
            functionality: functionality,
            userId: context.userId,
            contractCount: context.contractCount,
            onDismiss: {}
        )
        
        XCTAssertEqual(view.functionality.code, functionality.code)
        XCTAssertEqual(view.userId, context.userId)
        XCTAssertEqual(view.contractCount, context.contractCount)
    }
    
    func testNotificationSettingsViewInitialization() {
        let view = NotificationSettingsView(
            functionality: functionality,
            userId: context.userId,
            userRole: context.userRole,
            onDismiss: {}
        )
        
        XCTAssertEqual(view.functionality.code, functionality.code)
        XCTAssertEqual(view.userId, context.userId)
        XCTAssertEqual(view.userRole, context.userRole)
    }
}
