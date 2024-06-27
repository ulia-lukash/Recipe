//
//  TabBarController.swift
//  Recipe
//
//  Created by Uliana Lukash on 27.06.2024.
//

import Foundation
import UIKit

final class TabBarController: UITabBarController {
    private let homeScreen = UITabBarItem(title: nil, image: UIImage(systemName: "house.fill"), tag: 0)
    private let discover = UITabBarItem(title: nil, image: UIImage(systemName: "safari.fill"), tag: 1)
    private let createNew = UITabBarItem(title: nil, image: UIImage(systemName: "plus.circle.fill"), tag: 2)
    private let myRecipes = UITabBarItem(title: nil, image: UIImage(systemName: "list.clipboard.fill"), tag: 3)
    private let profile = UITabBarItem(title: nil, image: UIImage(systemName: "person.fill"), tag: 4)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let homeScreenController = createHomeScreenController()
        let discoverController = createDiscoverController()
        let createNewController = createCreateNewController()
        let myRecipesController = createMyRecipesController()
        let profileController = createProfileController()
        
        viewControllers = [homeScreenController, discoverController, createNewController, myRecipesController, profileController]
        
        view.backgroundColor = .white
        view.tintColor = .primary
    }
    
    init() {
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
            super.init(coder: aDecoder)
    }
    
    private func createProfileController() -> UINavigationController {
        let rootController = ProfileViewController()
        let viewController = UINavigationController(rootViewController: rootController)
        viewController.tabBarItem = profile
        return viewController
    }
    
    private func createMyRecipesController() -> UINavigationController {
        let rootController = MyRecipesViewController()
        let viewController = UINavigationController(rootViewController: rootController)
        viewController.tabBarItem = myRecipes
        return viewController
    }
    
    private func createCreateNewController() -> UINavigationController {
        let rootController = CreateNewViewController()
        let viewController = UINavigationController(rootViewController: rootController)
        viewController.tabBarItem = createNew
        return viewController
    }
    
    private func createDiscoverController() -> UINavigationController {
        let rootController = DiscoverViewController()
        let viewController = UINavigationController(rootViewController: rootController)
        viewController.tabBarItem = discover
        return viewController
    }
    private func createHomeScreenController() -> UINavigationController {
        let rootController = HomeScreenViewController()
        let viewController = UINavigationController(rootViewController: rootController)
        viewController.tabBarItem = homeScreen
        return viewController
    }
}
