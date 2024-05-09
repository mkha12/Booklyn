//
//  TabBarController.swift
//  Booklyn
//
//  Created by MARIIA on 27.04.24.
//

import UIKit

public final class TabBarViewController: UITabBarController {
    
    override public func viewDidLoad() {
        super.viewDidLoad()
        setupTabBar()
    }
    
    private func setupTabBar() {
        
        let booksVC = BooksViewController()
        booksVC.tabBarItem = UITabBarItem(title: "Выбрать книгу", image: UIImage(named: "books_icon"), selectedImage: UIImage(named: "books_icon"))
        
        let profileVC = ProfileViewController()
        profileVC.tabBarItem = UITabBarItem(title: "Мой список", image: UIImage(named: "profile_icon"), selectedImage: UIImage(named: "profile_icon"))
        
        
        viewControllers = [booksVC, profileVC ]
    }
}
