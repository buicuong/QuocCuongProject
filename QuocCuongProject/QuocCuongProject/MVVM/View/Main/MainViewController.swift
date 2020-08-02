//
//  MainViewController.swift
//  QuocCuongProject
//
//  Created by Mojave on 8/2/20.
//  Copyright © 2020 Mojave. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {

    
    var tabbar = UITabBarController()
    var homeVC = UINavigationController.init(rootViewController: HomeViewController.init(nibName: "HomeViewController", bundle: nil))
    var settingVC = UINavigationController.init(rootViewController: SettingViewController.init(nibName: "SettingViewController", bundle: nil))
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupView()
    }


    
    func updateTabbarTitle(){
        homeVC.tabBarItem = UITabBarItem.init(title: "Home", image: UIImage.init(named: "home"), selectedImage: UIImage.init(named: "home"))
        settingVC.tabBarItem = UITabBarItem.init(title: "Setting", image: UIImage.init(named: "settings"), selectedImage: UIImage.init(named: "settings"))
    }
    
    func setupView(){
        self.view.addSubview(tabbar.view)
        self.view.setFullLayout(tabbar.view)
        self.addChild(tabbar)
        
        tabbar.viewControllers = [homeVC, settingVC]
        tabbar.tabBar.unselectedItemTintColor = .blue
        tabbar.tabBar.tintColor = .red
        tabbar.tabBar.barTintColor = .gray
        tabbar.tabBar.isTranslucent = false
    
        
        updateTabbarTitle()
        
    }
    
}

public extension UIView {
    
    func setFullLayout(_ view : UIView) {
        self.setFixLayout(view, 0, 0, 0, 0)
    }
    
    func setFixLayout(_ view : UIView, _ top : CGFloat, _ left : CGFloat, _ bottom : CGFloat, _ right : CGFloat) {
        view.translatesAutoresizingMaskIntoConstraints = false
        
        self.addConstraint(NSLayoutConstraint(item: view, attribute: .top, relatedBy: .equal, toItem: self, attribute: .top, multiplier: 1.0, constant: top))
        
        self.addConstraint(NSLayoutConstraint(item: view, attribute: .left, relatedBy: .equal, toItem: self, attribute: .left, multiplier: 1.0, constant: left))
        
        self.addConstraint(NSLayoutConstraint(item: view, attribute: .bottom, relatedBy: .equal, toItem: self, attribute: .bottom, multiplier: 1.0, constant: bottom))
        
        self.addConstraint(NSLayoutConstraint(item: view, attribute: .right, relatedBy: .equal, toItem: self, attribute: .right, multiplier: 1.0, constant: right))
    }
}
