import XCTest
import SwiftUI
@testable import FunctionalitySearcher
import UIKit

final class TabCoordinatorTests: XCTestCase {
    
    var navigationController: UINavigationController!
    var factory: ConcreteFunctionalityFactory!
    var tabBarController: UITabBarController!
    var context: AppContext!
    
    override func setUp() {
        super.setUp()
        navigationController = UINavigationController()
        let window = UIWindow(frame: UIScreen.main.bounds)
        window.rootViewController = navigationController
        window.makeKeyAndVisible()
        factory = ConcreteFunctionalityFactory()
        tabBarController = UITabBarController()
        context = AppContext(
            userId: "TAB-COORDINATOR-TEST-USER",
            timestamp: Date(),
            region: "US",
            contractCount: 3,
            userEmail: "tabcoordinator@test.com",
            userRole: "user"
        )
    }
    
    override func tearDown() {
        tabBarController = nil
        navigationController = nil
        factory = nil
        context = nil
        super.tearDown()
    }
    
    // MARK: - HomeCoordinator Tests
    
    func testHomeCoordinatorInitialization() {
        let coordinator = HomeCoordinator(
            navigationController: navigationController,
            functionalityFactory: factory,
            tabBarController: tabBarController
        )
        
        XCTAssertNotNil(coordinator)
        XCTAssertEqual(coordinator.navigationController, navigationController)
    }
    
    func testHomeCoordinatorStart() {
        let coordinator = HomeCoordinator(
            navigationController: navigationController,
            functionalityFactory: factory,
            tabBarController: tabBarController
        )
        
        coordinator.start()
        
        let viewController = navigationController.viewControllers.first
        
        XCTAssertEqual(navigationController.viewControllers.count, 1)
        
        XCTAssertNotNil(viewController)
        assertIsHostingController(viewController!, hosting: HomeView.self)
    }
    
    func testHomeCoordinatorShowFunctionality() {
        let coordinator = HomeCoordinator(
            navigationController: navigationController,
            functionalityFactory: factory,
            tabBarController: tabBarController
        )
        
        coordinator.start()
        
        let functionality = Functionality(
            id: "BILL_001",
            code: "BILL_001",
            name: "Download invoice",
            path: "/billing/1",
            category: "Billing",
            description: "Test",
            keywords: [],
            uiType: .uikit
        )
        
        coordinator.showFunctionality(functionality)
        
        // Wait for modal presentation
        RunLoop.current.run(until: Date(timeIntervalSinceNow: 0.1))
        
        // The functionality should be presented modally
        XCTAssertNotNil(navigationController.presentedViewController)
        XCTAssertTrue(navigationController.presentedViewController is UINavigationController)
    }
    
    // MARK: - SearchCoordinator Tests
    
    func testSearchCoordinatorInitialization() {
        let searchService = MockSearchService()
        let coordinator = SearchCoordinator(
            navigationController: navigationController,
            functionalityFactory: factory,
            searchService: searchService
        )
        
        XCTAssertNotNil(coordinator)
        XCTAssertEqual(coordinator.navigationController, navigationController)
    }
    
    func testSearchCoordinatorStart() {
        let searchService = MockSearchService()
        let coordinator = SearchCoordinator(
            navigationController: navigationController,
            functionalityFactory: factory,
            searchService: searchService
        )
        
        coordinator.start()
        
        
        let viewController = navigationController.viewControllers.first
        
        XCTAssertEqual(navigationController.viewControllers.count, 1)
        
        XCTAssertNotNil(viewController)
        assertIsHostingController(viewController!, hosting: SearchView.self)
    }
    
    func testSearchCoordinatorShowFunctionality() {
        let searchService = MockSearchService()
        let coordinator = SearchCoordinator(
            navigationController: navigationController,
            functionalityFactory: factory,
            searchService: searchService
        )
        
        coordinator.start()
        
        let functionality = Functionality(
            id: "BILL_002",
            code: "BILL_002",
            name: "View invoice history",
            path: "/billing/2",
            category: "Billing",
            description: "Test",
            keywords: [],
            uiType: .swiftui
        )
        
        coordinator.showFunctionality(functionality)
        
        // Wait for modal presentation
        RunLoop.current.run(until: Date(timeIntervalSinceNow: 0.1))
        
        // The functionality should be presented modally
        XCTAssertNotNil(navigationController.presentedViewController)
        XCTAssertTrue(navigationController.presentedViewController is UINavigationController)
    }
    
    // MARK: - ProfileCoordinator Tests
    
    func testProfileCoordinatorInitialization() {
        let coordinator = ProfileCoordinator(
            navigationController: navigationController,
            functionalityFactory: factory
        )
        
        XCTAssertNotNil(coordinator)
        XCTAssertEqual(coordinator.navigationController, navigationController)
    }
    
    func testProfileCoordinatorStart() {
        let coordinator = ProfileCoordinator(
            navigationController: navigationController,
            functionalityFactory: factory
        )
        
        coordinator.start()
        
        let viewController = navigationController.viewControllers.first
        
        XCTAssertEqual(navigationController.viewControllers.count, 1)
        
        XCTAssertNotNil(viewController)
        assertIsHostingController(viewController!, hosting: ProfileView.self)
    }
    
    func testProfileCoordinatorShowFunctionality() {
        let coordinator = ProfileCoordinator(
            navigationController: navigationController,
            functionalityFactory: factory
        )
        
        coordinator.start()
        
        let functionality = Functionality(
            id: "PROF_001",
            code: "PROF_001",
            name: "Edit profile",
            path: "/profile/1",
            category: "Profile",
            description: "Test",
            keywords: [],
            uiType: .uikit
        )
        
        coordinator.showFunctionality(functionality)
        
        // Wait for modal presentation
        RunLoop.current.run(until: Date(timeIntervalSinceNow: 0.1))
        
        // The functionality should be presented modally
        XCTAssertNotNil(navigationController.presentedViewController)
        XCTAssertTrue(navigationController.presentedViewController is UINavigationController)
    }
    
    // MARK: - BillingCoordinator Tests
    
    func testBillingCoordinatorInitialization() {
        let coordinator = BillingCoordinator(
            navigationController: navigationController,
            functionalityFactory: factory
        )
        
        XCTAssertNotNil(coordinator)
        XCTAssertEqual(coordinator.navigationController, navigationController)
    }
    
    func testBillingCoordinatorStart() {
        let coordinator = BillingCoordinator(
            navigationController: navigationController,
            functionalityFactory: factory
        )
        
        coordinator.start()
        let viewController = navigationController.viewControllers.first
        
        XCTAssertEqual(navigationController.viewControllers.count, 1)
        
        XCTAssertNotNil(viewController)
        assertIsHostingController(viewController!, hosting: BillingView.self)
    }
    
    func testBillingCoordinatorShowFunctionality() {
        let coordinator = BillingCoordinator(
            navigationController: navigationController,
            functionalityFactory: factory
        )
        
        coordinator.start()
        
        let functionality = Functionality(
            id: "BILL_001",
            code: "BILL_001",
            name: "Download invoice",
            path: "/billing/1",
            category: "Billing",
            description: "Test",
            keywords: [],
            uiType: .uikit
        )
        
        coordinator.showFunctionality(functionality)
        
        // Wait for modal presentation
        RunLoop.current.run(until: Date(timeIntervalSinceNow: 0.1))
        
        // The functionality should be presented modally
        XCTAssertNotNil(navigationController.presentedViewController)
        XCTAssertTrue(navigationController.presentedViewController is UINavigationController)
    }
    
    // MARK: - TabCoordinator Protocol Tests
    
    func testTabCoordinatorProtocolConformance() {
        let searchService = MockSearchService()
        let homeCoordinator = HomeCoordinator(
            navigationController: navigationController,
            functionalityFactory: factory,
            tabBarController: tabBarController
        )
        
        XCTAssertTrue(homeCoordinator is TabCoordinator)
        XCTAssertNotNil((homeCoordinator as TabCoordinator).navigationController)
        XCTAssertNotNil((homeCoordinator as TabCoordinator).functionalityFactory)
    }
    
    func testAllTabsHaveLargeTitleEnabled() {
        let searchService = MockSearchService()
        
        let homeCoordinator = HomeCoordinator(
            navigationController: navigationController,
            functionalityFactory: factory,
            tabBarController: tabBarController
        )
        homeCoordinator.start()
        XCTAssertTrue(navigationController.navigationBar.prefersLargeTitles)
        
        let searchCoordinator = SearchCoordinator(
            navigationController: UINavigationController(),
            functionalityFactory: factory,
            searchService: searchService
        )
        searchCoordinator.start()
        XCTAssertTrue(searchCoordinator.navigationController.navigationBar.prefersLargeTitles)
        
        let profileCoordinator = ProfileCoordinator(
            navigationController: UINavigationController(),
            functionalityFactory: factory
        )
        profileCoordinator.start()
        XCTAssertTrue(profileCoordinator.navigationController.navigationBar.prefersLargeTitles)
        
        let billingCoordinator = BillingCoordinator(
            navigationController: UINavigationController(),
            functionalityFactory: factory
        )
        billingCoordinator.start()
        XCTAssertTrue(billingCoordinator.navigationController.navigationBar.prefersLargeTitles)
    }
}
