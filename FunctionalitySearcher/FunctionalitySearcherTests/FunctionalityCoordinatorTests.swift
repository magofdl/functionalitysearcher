import XCTest
import SwiftUI
@testable import FunctionalitySearcher
import UIKit

final class FunctionalityCoordinatorTests: XCTestCase {
    
    var navigationController: UINavigationController!
    var factory: ConcreteFunctionalityFactory!
    var coordinator: FunctionalityCoordinator!
    var context: AppContext!
    
    override func setUp() {
        super.setUp()
        navigationController = UINavigationController()
        factory = ConcreteFunctionalityFactory()
        coordinator = FunctionalityCoordinator(
            navigationController: navigationController,
            functionalityFactory: factory
        )
        context = AppContext(
            userId: "COORDINATOR-TEST-USER",
            timestamp: Date(),
            region: "US",
            contractCount: 3,
            userEmail: "coordinator@test.com",
            userRole: "user"
        )
    }
    
    override func tearDown() {
        coordinator = nil
        factory = nil
        navigationController = nil
        context = nil
        super.tearDown()
    }
    
    func testFunctionalityCoordinatorInitialization() {
        XCTAssertNotNil(coordinator)
        XCTAssertNotNil(navigationController)
    }
    
    func testShowFunctionalityPushesViewController() {
        let functionality = Functionality(
            id: "TEST_001",
            code: "BILL_001",
            name: "Test",
            path: "/test",
            category: "Test",
            description: "Test",
            keywords: [],
            uiType: .uikit
        )
        
        coordinator.showFunctionality(functionality)
        
        XCTAssertEqual(navigationController.viewControllers.count, 1)
        XCTAssertTrue(navigationController.viewControllers.first is UIKitFunctionality1)
    }
    
    func testShowFunctionalityWithSwiftUI() {
        let functionality = Functionality(
            id: "TEST_002",
            code: "BILL_002",
            name: "Test",
            path: "/test",
            category: "Test",
            description: "Test",
            keywords: [],
            uiType: .swiftui
        )
        
        coordinator.showFunctionality(functionality)
        
        XCTAssertEqual(navigationController.viewControllers.count, 1)
        XCTAssertTrue(navigationController.viewControllers.first is UIHostingController<SwiftUIFunctionality1>)
    }
    
    func testMultipleFunctionalities() {
        let functionalities = [
            Functionality(
                id: "TEST_001",
                code: "BILL_001",
                name: "Test 1",
                path: "/test/1",
                category: "Test",
                description: "Test",
                keywords: [],
                uiType: .uikit
            ),
            Functionality(
                id: "TEST_002",
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
            coordinator.showFunctionality(functionality)
        }
        
        RunLoop.current.run(until: Date(timeIntervalSinceNow: 0.1))
        
        XCTAssertEqual(navigationController.viewControllers.count, 2)
    }
}
