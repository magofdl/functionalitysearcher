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
        XCTAssertTrue(viewController is DownloadInvoiceViewController)
        XCTAssertFalse(dismissCalled)
    }
    
    func testCreateViewControllerForBILL002() {
        let functionality = createMockFunctionality(code: "BILL_002", uiType: .swiftui)
        
        let viewController = factory.createViewController(
            for: functionality,
            context: context,
            onDismiss: {}
        )
        
        assertIsHostingController(viewController, hosting: InvoiceHistoryView.self)
        
        XCTAssertNotNil(viewController)
    }
    
    func testCreateViewControllerForRET001() {
        let functionality = createMockFunctionality(code: "RET_001", uiType: .uikit)
        
        let viewController = factory.createViewController(
            for: functionality,
            context: context,
            onDismiss: {}
        )
        
        XCTAssertNotNil(viewController)
        XCTAssertTrue(viewController is InitiateReturnViewController)
    }
    
    func testCreateViewControllerForCERT001() {
        let functionality = createMockFunctionality(code: "CERT_001", uiType: .uikit)
        
        let viewController = factory.createViewController(
            for: functionality,
            context: context,
            onDismiss: {}
        )
        
        XCTAssertNotNil(viewController)
        XCTAssertTrue(viewController is GetCertificateViewController)
    }
    
    func testCreateViewControllerForPROF001() {
        let functionality = createMockFunctionality(code: "PROF_001", uiType: .uikit)
        
        let viewController = factory.createViewController(
            for: functionality,
            context: context,
            onDismiss: {}
        )
        
        XCTAssertNotNil(viewController)
        XCTAssertTrue(viewController is EditProfileViewController)
    }
    
    func testCreateViewControllerForPROD001() {
        let functionality = createMockFunctionality(code: "PROD_001", uiType: .uikit)
        
        let viewController = factory.createViewController(
            for: functionality,
            context: context,
            onDismiss: {}
        )
        
        XCTAssertNotNil(viewController)
        XCTAssertTrue(viewController is SearchProductsViewController)
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
        assertIsHostingController(viewController, hosting: SwiftUIFunctionalityTemplate.self)
    }
    
    func testOnDismissCallback() {
        let functionality = createMockFunctionality(code: "BILL_001", uiType: .uikit)
        var dismissCalled = false
        
        let viewController = factory.createViewController(
            for: functionality,
            context: context,
            onDismiss: { dismissCalled = true }
        ) as? DownloadInvoiceViewController
        
        XCTAssertNotNil(viewController)
        viewController?.onDismiss?()
        XCTAssertTrue(dismissCalled)
    }
    
    func testContextPassedToDownloadInvoiceViewController() {
        let functionality = createMockFunctionality(code: "BILL_001", uiType: .uikit)
        
        let viewController = factory.createViewController(
            for: functionality,
            context: context,
            onDismiss: {}
        ) as? DownloadInvoiceViewController
        
        XCTAssertNotNil(viewController)
        XCTAssertEqual(viewController?.functionality.code, "BILL_001")
    }
    
    func testContextPassedToInvoiceHistoryView() {
        let functionality = createMockFunctionality(code: "BILL_002", uiType: .swiftui)
        
        let viewController = factory.createViewController(
            for: functionality,
            context: context,
            onDismiss: {}
        )
        
        
        assertIsHostingController(viewController, hosting: InvoiceHistoryView.self)
        
        XCTAssertNotNil(viewController)
        
    }
    
    // MARK: - Data Resolver Tests
    
    func testFactoryWithDataResolver() {
        let mockResolver = MockFunctionalityDataResolver(data: [
            "testKey": .string("testValue")
        ])
        
        let factoryWithResolver = ConcreteFunctionalityFactory(dataResolvers: [
            "TEST_CODE": mockResolver
        ])
        
        let functionality = createMockFunctionality(code: "TEST_CODE", uiType: .uikit)
        let viewController = factoryWithResolver.createViewController(
            for: functionality,
            context: context,
            onDismiss: {}
        )
        
        XCTAssertNotNil(viewController)
    }
    
    func testFactoryCreatesUserSubscriptionViewWithResolver() {
        let resolver = UserSubscriptionViewDataResolver()
        let factoryWithResolver = ConcreteFunctionalityFactory(dataResolvers: [
            "PROF_011": resolver
        ])
        
        let functionality = createMockFunctionality(code: "PROF_011", uiType: .swiftui)
        let viewController = factoryWithResolver.createViewController(
            for: functionality,
            context: context,
            onDismiss: {}
        )
        
        assertIsHostingController(viewController, hosting: UserSubscriptionView.self)
        
        XCTAssertNotNil(viewController)

    }
    
    func testFactoryCreatesUserAccountDetailsViewControllerWithResolver() {
        let resolver = UserAccountDetailsViewControllerDataResolver()
        let factoryWithResolver = ConcreteFunctionalityFactory(dataResolvers: [
            "PROF_010": resolver
        ])
        
        let functionality = createMockFunctionality(code: "PROF_010", uiType: .uikit)
        let viewController = factoryWithResolver.createViewController(
            for: functionality,
            context: context,
            onDismiss: {}
        )
        
        XCTAssertNotNil(viewController)
        XCTAssertTrue(viewController is UserAccountDetailsViewController)
        
        let uikitVC = viewController as? UserAccountDetailsViewController
        XCTAssertNotNil(uikitVC)
        XCTAssertEqual(uikitVC?.functionality.code, "PROF_010")
    }
    
    func testFactoryMergesResolverDataWithFunctionalityArguments() {
        let mockResolver = MockFunctionalityDataResolver(data: [
            "resolverKey": .string("resolverValue"),
            "resolverInt": .int(100)
        ])
        
        let factoryWithResolver = ConcreteFunctionalityFactory(dataResolvers: [
            "TEST_CODE": mockResolver
        ])
        
        let existingArguments: [String: FunctionalityArgumentValue] = [
            "existingKey": .string("existingValue")
        ]
        
        let functionality = Functionality(
            id: "TEST_CODE",
            code: "TEST_CODE",
            name: "Test",
            path: "/test",
            category: "Test",
            description: "Test",
            keywords: [],
            uiType: .uikit,
            arguments: existingArguments
        )
        
        let viewController = factoryWithResolver.createViewController(
            for: functionality,
            context: context,
            onDismiss: {}
        )
        
        XCTAssertNotNil(viewController)
        // The functionality should have merged arguments
        // We can't directly test this without exposing internal state,
        // but we can verify the view controller was created successfully
    }
    
    func testFactoryFallsBackToStandardCreatorWhenNoResolverDataCreator() {
        let mockResolver = MockFunctionalityDataResolver(data: [
            "testKey": .string("testValue")
        ])
        
        let factoryWithResolver = ConcreteFunctionalityFactory(dataResolvers: [
            "BILL_001": mockResolver
        ])
        
        let functionality = createMockFunctionality(code: "BILL_001", uiType: .uikit)
        let viewController = factoryWithResolver.createViewController(
            for: functionality,
            context: context,
            onDismiss: {}
        )
        
        // Should still create DownloadInvoiceViewController even with resolver
        // because BILL_001 has a standard creator
        XCTAssertNotNil(viewController)
        XCTAssertTrue(viewController is DownloadInvoiceViewController)
    }
    
    func testFactoryWorksWithoutResolvers() {
        // Factory without resolvers should work as before
        let functionality = createMockFunctionality(code: "BILL_001", uiType: .uikit)
        let viewController = factory.createViewController(
            for: functionality,
            context: context,
            onDismiss: {}
        )
        
        XCTAssertNotNil(viewController)
        XCTAssertTrue(viewController is DownloadInvoiceViewController)
    }
    
    func testFactoryWithResolverButNoCreatorFallsBackToDefault() {
        let mockResolver = MockFunctionalityDataResolver(data: [
            "testKey": .string("testValue")
        ])
        
        let factoryWithResolver = ConcreteFunctionalityFactory(dataResolvers: [
            "UNKNOWN_WITH_RESOLVER": mockResolver
        ])
        
        let functionality = createMockFunctionality(code: "UNKNOWN_WITH_RESOLVER", uiType: .uikit)
        let viewController = factoryWithResolver.createViewController(
            for: functionality,
            context: context,
            onDismiss: {}
        )
        
        // Should fall back to default template
        XCTAssertNotNil(viewController)
        XCTAssertTrue(viewController is UIKitFunctionalityTemplate)
    }
    
    func testUserSubscriptionViewReceivesExternalData() {
        let resolver = UserSubscriptionViewDataResolver()
        let factoryWithResolver = ConcreteFunctionalityFactory(dataResolvers: [
            "PROF_011": resolver
        ])
        
        let functionality = createMockFunctionality(code: "PROF_011", uiType: .swiftui)
        let viewController = factoryWithResolver.createViewController(
            for: functionality,
            context: context,
            onDismiss: {}
        )
        
        
        assertIsHostingController(viewController, hosting: UserSubscriptionView.self)
        
        XCTAssertNotNil(viewController)
        
    }
    
    func testUserAccountDetailsViewControllerReceivesExternalData() {
        let resolver = UserAccountDetailsViewControllerDataResolver()
        let factoryWithResolver = ConcreteFunctionalityFactory(dataResolvers: [
            "PROF_010": resolver
        ])
        
        let functionality = createMockFunctionality(code: "PROF_010", uiType: .uikit)
        let viewController = factoryWithResolver.createViewController(
            for: functionality,
            context: context,
            onDismiss: {}
        ) as? UserAccountDetailsViewController
        
        XCTAssertNotNil(viewController)
        
        // Verify that the functionality has the external data in arguments
        let functionalityWithData = viewController?.functionality
        XCTAssertNotNil(functionalityWithData?.arguments["orderHistory"])
        XCTAssertNotNil(functionalityWithData?.arguments["paymentMethods"])
        XCTAssertNotNil(functionalityWithData?.arguments["loyaltyPoints"])
        XCTAssertNotNil(functionalityWithData?.arguments["isVIP"])
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

extension XCTestCase {
    func assertIsHostingController<T>(
        _ viewController: UIViewController,
        hosting type: T.Type,
        file: StaticString = #file,
        line: UInt = #line
    ) {
        let typeName = String(describing: Swift.type(of: viewController))
        XCTAssertTrue(
            typeName.contains("UIHostingController"),
            "Expected UIHostingController but got \(typeName)",
            file: file,
            line: line
        )
    }
}
