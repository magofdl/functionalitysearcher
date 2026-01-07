import XCTest
import SwiftUI
@testable import FunctionalitySearcher
import UIKit

final class FunctionalityIntegrationTests: XCTestCase {
    
    var factory: ConcreteFunctionalityFactory!
    var context: AppContext!
    
    override func setUp() {
        super.setUp()
        factory = ConcreteFunctionalityFactory()
        context = AppContext(
            userId: "INTEGRATION-TEST-USER",
            timestamp: Date(),
            region: "US",
            contractCount: 7,
            userEmail: "integration@test.com",
            userRole: "tester"
        )
    }
    
    override func tearDown() {
        factory = nil
        context = nil
        super.tearDown()
    }
    
    func testFullFlowDownloadInvoiceViewController() {
        let functionality = Functionality(
            id: "BILL_001",
            code: "BILL_001",
            name: "Download invoice",
            path: "/billing/1",
            category: "Billing",
            description: "Download invoice functionality",
            keywords: ["billing", "invoice"],
            uiType: .uikit
        )
        
        var dismissCalled = false
        let viewController = factory.createViewController(
            for: functionality,
            context: context,
            onDismiss: { dismissCalled = true }
        ) as? DownloadInvoiceViewController
        
        XCTAssertNotNil(viewController)
        XCTAssertEqual(viewController?.functionality.code, "BILL_001")
        XCTAssertNotNil(viewController?.onDismiss)
        
        viewController?.onDismiss?()
        XCTAssertTrue(dismissCalled)
    }
    
    func testFullFlowInvoiceHistoryView() {
        let functionality = Functionality(
            id: "BILL_002",
            code: "BILL_002",
            name: "View invoice history",
            path: "/billing/2",
            category: "Billing",
            description: "View invoice history functionality",
            keywords: ["billing", "invoice"],
            uiType: .swiftui
        )
        
        let viewController = factory.createViewController(
            for: functionality,
            context: context,
            onDismiss: {}
        ) as? UIHostingController<InvoiceHistoryView>
        
        XCTAssertNotNil(viewController)
        XCTAssertEqual(viewController?.rootView.functionality.code, "BILL_002")
        XCTAssertEqual(viewController?.rootView.userId, context.userId)
    }
    
    func testContextValuesPassedToInitiateReturnViewController() {
        let functionality = Functionality(
            id: "RET_001",
            code: "RET_001",
            name: "Initiate return",
            path: "/returns/1",
            category: "Returns",
            description: "Initiate return functionality",
            keywords: ["return"],
            uiType: .uikit
        )
        
        let viewController = factory.createViewController(
            for: functionality,
            context: context,
            onDismiss: {}
        ) as? InitiateReturnViewController
        
        XCTAssertNotNil(viewController)
        XCTAssertEqual(viewController?.functionality.code, "RET_001")
    }
    
    func testContextValuesPassedToTrackReturnView() {
        let functionality = Functionality(
            id: "RET_002",
            code: "RET_002",
            name: "Track return",
            path: "/returns/2",
            category: "Returns",
            description: "Track return functionality",
            keywords: ["return"],
            uiType: .swiftui
        )
        
        let viewController = factory.createViewController(
            for: functionality,
            context: context,
            onDismiss: {}
        ) as? UIHostingController<TrackReturnView>
        
        XCTAssertNotNil(viewController)
        XCTAssertEqual(viewController?.rootView.userId, context.userId)
    }
    
    func testMultipleFunctionalitiesWithSameContext() {
        let functionalities = [
            Functionality(
                id: "BILL_001",
                code: "BILL_001",
                name: "Test 1",
                path: "/test/1",
                category: "Test",
                description: "Test",
                keywords: [],
                uiType: .uikit
            ),
            Functionality(
                id: "BILL_002",
                code: "BILL_002",
                name: "Test 2",
                path: "/test/2",
                category: "Test",
                description: "Test",
                keywords: [],
                uiType: .swiftui
            )
        ]
        
        for functionality in functionalities {
            let viewController = factory.createViewController(
                for: functionality,
                context: context,
                onDismiss: {}
            )
            
            XCTAssertNotNil(viewController)
        }
    }
    
    func testFunctionalityWithDifferentContexts() {
        let functionality = Functionality(
            id: "BILL_001",
            code: "BILL_001",
            name: "Test",
            path: "/test",
            category: "Test",
            description: "Test",
            keywords: [],
            uiType: .uikit
        )
        
        let context1 = AppContext(
            userId: "USER-1",
            timestamp: Date(),
            region: "US",
            contractCount: 1,
            userEmail: nil,
            userRole: nil
        )
        
        let context2 = AppContext(
            userId: "USER-2",
            timestamp: Date(),
            region: "MX",
            contractCount: 2,
            userEmail: nil,
            userRole: nil
        )
        
        let viewController1 = factory.createViewController(
            for: functionality,
            context: context1,
            onDismiss: {}
        ) as? DownloadInvoiceViewController
        
        let viewController2 = factory.createViewController(
            for: functionality,
            context: context2,
            onDismiss: {}
        ) as? DownloadInvoiceViewController
        
        XCTAssertNotNil(viewController1)
        XCTAssertNotNil(viewController2)
        XCTAssertEqual(viewController1?.functionality.code, viewController2?.functionality.code)
    }
}
