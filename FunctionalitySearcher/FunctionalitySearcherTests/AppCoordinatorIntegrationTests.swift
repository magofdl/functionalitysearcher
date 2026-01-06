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
        XCTAssertTrue(window.rootViewController is UINavigationController)
    }
    
    func testStartCreatesSearchView() {
        coordinator.start()
        
        let navigationController = window.rootViewController as? UINavigationController
        XCTAssertNotNil(navigationController)
        
        let rootViewController = navigationController?.viewControllers.first
        XCTAssertTrue(rootViewController is UIHostingController<SearchView>)
    }
}
