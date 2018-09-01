//
//  Wireframe.swift
//  Cookbook
//
//  Created by Mohammad Abdurraafay on 12/08/18.
//  Copyright © 2018 Mohammad Abdurraafay. All rights reserved.
//

import Foundation
import UIKit

protocol RootInitiations {
    func installRooViewController()
}

protocol Presentation {
    var tabBarController: UITabBarController { get }
    var featuredViewController: UIViewController { get }
    var moreViewController: UIViewController { get }
    
    func navigationController(root viewController: UIViewController) -> UINavigationController
}

protocol Router {
    
}

class Wireframe {
    let window: UIWindow?
    
    init(_ window: UIWindow?) {
        self.window = window
    }
}

extension Wireframe: RootInitiations {
    func installRooViewController() {
        window?.rootViewController = tabBarController
    }
}

extension Wireframe: Presentation {
    
    var tabBarController: UITabBarController {
        let tabBarController = UITabBarController(nibName: nil, bundle: nil)
        let featuredViewControllerNavStack = navigationController(root: featuredViewController)
        let moreViewControllerNavStack = navigationController(root: moreViewController)
        tabBarController.viewControllers = [featuredViewControllerNavStack, moreViewControllerNavStack]
        
        return tabBarController
    }
    
    var featuredViewController: UIViewController {
        let featuredViewController = FeaturedViewController(nibName: nil, bundle: nil)
        featuredViewController.tabBarItem = UITabBarItem(tabBarSystemItem: UITabBarSystemItem.featured, tag: 0)
        
        return featuredViewController
    }
    var moreViewController: UIViewController {
        let moreViewController = MoreViewController(nibName: nil, bundle: nil)
        moreViewController.tabBarItem = UITabBarItem(tabBarSystemItem: UITabBarSystemItem.more, tag: 1)
        
        return moreViewController
    }
    
    func navigationController(root viewController: UIViewController) -> UINavigationController {
        return UINavigationController(rootViewController: viewController)
    }
}
