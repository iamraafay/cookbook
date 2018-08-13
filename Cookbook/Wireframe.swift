//
//  Wireframe.swift
//  Cookbook
//
//  Created by Mohammad Abdurraafay on 12/08/18.
//  Copyright © 2018 Mohammad Abdurraafay. All rights reserved.
//

import Foundation
import UIKit

protocol RootInstallations {
    func installRooViewController()
}

protocol Presentation {
    var tabBarController: UITabBarController { get }
    var featuredViewController: UIViewController { get }
    var moreViewController: UIViewController { get }
}

class Wireframe {
    let window: UIWindow?
    
    init(_ window: UIWindow?) {
        self.window = window
    }
}

extension Wireframe: RootInstallations {
    func installRooViewController() {
        window?.rootViewController = tabBarController
    }
}

extension Wireframe: Presentation {
    var tabBarController: UITabBarController {
        let tabBarController = UITabBarController(nibName: nil, bundle: nil)
        tabBarController.viewControllers = [featuredViewController, moreViewController]
        
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
}
