import XCTest
import SwiftUI
@testable import FunctionalitySearcher
import UIKit

final class AppCoordinatorIntegrationTests: XCTestCase {
    
    var window: UIWindow!
    var coordinator: AppCoordinator!
    
    override func setUp() {
        super.setUp()
        window = UIWindow(frame: UIScreen.main.bounds)
        coordinator = AppCoordinator(window: window)
    }
    
    override func tearDown() {
        coordinator = nil
        window = nil
        super.tearDown()
    }
    
    func testAppCoordinatorInitialization() {
        XCTAssertNotNil(coordinator)
        XCTAssertNotNil(window)
    }
    
    func testStartSetsRootViewController() {
        coordinator.start()
        
        XCTAssertNotNil(window.rootViewController)
        XCTAssertTrue(window.rootViewController is UITabBarController)
    }
    
    func testStartCreatesTabBarController() {
        coordinator.start()
        
        let tabBarController = window.rootViewController as? UITabBarController
        XCTAssertNotNil(tabBarController)
        XCTAssertEqual(tabBarController?.viewControllers?.count, 4)
    }
    
    func testStartCreatesHomeTab() {
        coordinator.start()
        
        let tabBarController = window.rootViewController as? UITabBarController
        let homeNavigationController = tabBarController?.viewControllers?[0] as? UINavigationController
        XCTAssertNotNil(homeNavigationController)
        
        let homeViewController = homeNavigationController?.viewControllers.first
        XCTAssertNotNil(homeViewController)
        
        // Check that it's a UIHostingController by checking the class name
        let hostingControllerTypeName = String(describing: type(of: homeViewController!))
        XCTAssertTrue(hostingControllerTypeName.contains("UIHostingController"))
        
        guard let viewController = homeViewController else {
            XCTFail("Expected a view controller")
            return
        }
        
        // Load the view to ensure title is set
        _ = viewController.view
        XCTAssertEqual(viewController.title, "Home")
        XCTAssertEqual(viewController.navigationItem.title, "Home")
    }
    
    func testStartCreatesSearchTab() {
        coordinator.start()
        
        let tabBarController = window.rootViewController as? UITabBarController
        let searchNavigationController = tabBarController?.viewControllers?[1] as? UINavigationController
        XCTAssertNotNil(searchNavigationController)
        
        let searchViewController = searchNavigationController?.viewControllers.first
        XCTAssertNotNil(searchViewController)
        
        // Check that it's a UIHostingController by checking the class name
        let hostingControllerTypeName = String(describing: type(of: searchViewController!))
        XCTAssertTrue(hostingControllerTypeName.contains("UIHostingController"))
        
        guard let viewController = searchViewController else {
            XCTFail("Expected a view controller")
            return
        }
        
        // Load the view to ensure title is set
        _ = viewController.view
        XCTAssertEqual(viewController.title, "Functionality Searcher")
        XCTAssertEqual(viewController.navigationItem.title, "Functionality Searcher")
    }
    
    func testStartCreatesProfileTab() {
        coordinator.start()
        
        let tabBarController = window.rootViewController as? UITabBarController
        let profileNavigationController = tabBarController?.viewControllers?[2] as? UINavigationController
        XCTAssertNotNil(profileNavigationController)
        
        let profileViewController = profileNavigationController?.viewControllers.first
        XCTAssertNotNil(profileViewController)
        
        // Check that it's a UIHostingController by checking the class name
        let hostingControllerTypeName = String(describing: type(of: profileViewController!))
        XCTAssertTrue(hostingControllerTypeName.contains("UIHostingController"))
        
        guard let viewController = profileViewController else {
            XCTFail("Expected a view controller")
            return
        }
        
        // Load the view to ensure title is set
        _ = viewController.view
        XCTAssertEqual(viewController.title, "Profile")
        XCTAssertEqual(viewController.navigationItem.title, "Profile")
    }
    
    func testStartCreatesBillingTab() {
        coordinator.start()
        
        let tabBarController = window.rootViewController as? UITabBarController
        let billingNavigationController = tabBarController?.viewControllers?[3] as? UINavigationController
        XCTAssertNotNil(billingNavigationController)
        
        let billingViewController = billingNavigationController?.viewControllers.first
        XCTAssertNotNil(billingViewController)
        
        // Check that it's a UIHostingController by checking the class name
        let hostingControllerTypeName = String(describing: type(of: billingViewController!))
        XCTAssertTrue(hostingControllerTypeName.contains("UIHostingController"))
        
        guard let viewController = billingViewController else {
            XCTFail("Expected a view controller")
            return
        }
        
        // Load the view to ensure title is set
        _ = viewController.view
        XCTAssertEqual(viewController.title, "Billing")
        XCTAssertEqual(viewController.navigationItem.title, "Billing")
    }
}
