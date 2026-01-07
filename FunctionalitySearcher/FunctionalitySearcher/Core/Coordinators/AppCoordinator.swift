import UIKit
import SwiftUI

class AppCoordinator {
    private let window: UIWindow
    private let tabBarController: UITabBarController
    private let searchService: SearchServiceProtocol
    private let functionalityFactory: FunctionalityFactoryProtocol
    
    // Tab Coordinators
    private var homeCoordinator: HomeCoordinator?
    private var searchCoordinator: SearchCoordinator?
    private var profileCoordinator: ProfileCoordinator?
    private var billingCoordinator: BillingCoordinator?
    
    init(window: UIWindow) {
        self.window = window
        self.searchService = MockSearchService()
        self.tabBarController = UITabBarController()
        
        // Configure data resolvers for functionalities that need external data
        let dataResolvers: [String: FunctionalityDataResolver] = [
            "PROF_011": UserSubscriptionViewDataResolver(),
            "PROF_010": UserAccountDetailsViewControllerDataResolver()
        ]
        
        self.functionalityFactory = ConcreteFunctionalityFactory(dataResolvers: dataResolvers)
    }
    
    func start() {
        // Create NavigationControllers for each tab
        let homeNavigationController = UINavigationController()
        let searchNavigationController = UINavigationController()
        let profileNavigationController = UINavigationController()
        let billingNavigationController = UINavigationController()
        
        // Create and configure coordinators
        homeCoordinator = HomeCoordinator(
            navigationController: homeNavigationController,
            functionalityFactory: functionalityFactory,
            tabBarController: tabBarController
        )
        homeCoordinator?.start()
        
        searchCoordinator = SearchCoordinator(
            navigationController: searchNavigationController,
            functionalityFactory: functionalityFactory,
            searchService: searchService
        )
        searchCoordinator?.start()
        
        profileCoordinator = ProfileCoordinator(
            navigationController: profileNavigationController,
            functionalityFactory: functionalityFactory
        )
        profileCoordinator?.start()
        
        billingCoordinator = BillingCoordinator(
            navigationController: billingNavigationController,
            functionalityFactory: functionalityFactory
        )
        billingCoordinator?.start()
        
        // Configure tab bar items
        homeNavigationController.tabBarItem = UITabBarItem(
            title: "Home",
            image: UIImage(systemName: "house.fill"),
            tag: 0
        )
        
        searchNavigationController.tabBarItem = UITabBarItem(
            title: "Search",
            image: UIImage(systemName: "magnifyingglass"),
            tag: 1
        )
        
        profileNavigationController.tabBarItem = UITabBarItem(
            title: "Profile",
            image: UIImage(systemName: "person.fill"),
            tag: 2
        )
        
        billingNavigationController.tabBarItem = UITabBarItem(
            title: "Billing",
            image: UIImage(systemName: "dollarsign.circle.fill"),
            tag: 3
        )
        
        // Set view controllers for tab bar
        tabBarController.setViewControllers(
            [
                homeNavigationController,
                searchNavigationController,
                profileNavigationController,
                billingNavigationController
            ],
            animated: false
        )
        
        // Configure tab bar appearance
        configureTabBarAppearance()
        
        window.rootViewController = tabBarController
        window.makeKeyAndVisible()
    }
    
    private func configureTabBarAppearance() {
        let tabBarAppearance = UITabBarAppearance()
        tabBarAppearance.configureWithOpaqueBackground()
        
        // Use theme color for tab bar (will be updated when theme changes)
        let theme = ThemeManager.shared.currentTheme
        tabBarAppearance.backgroundColor = UIColor(theme.colorPalette.surface)
        
        tabBarController.tabBar.standardAppearance = tabBarAppearance
        tabBarController.tabBar.scrollEdgeAppearance = tabBarAppearance
        tabBarController.tabBar.tintColor = UIColor(theme.colorPalette.primary)
    }
}
