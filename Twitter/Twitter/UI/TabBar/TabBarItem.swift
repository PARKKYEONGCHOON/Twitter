//
//  TabBarItem.swift
//  Twitter
//
//  Created by 박경춘 on 2023/04/02.
//

import UIKit

enum TabBarItem: CaseIterable {
    
    case feed
    case profile
    
    var title : String {
        switch self {
        case .feed:
            return "Feed"
        
        case .profile:
            return "Profile"
        }
    }
    
    var icon: (default: UIImage?, selected: UIImage?) {
        
        switch self {
        case .feed:
            return (UIImage(systemName: "list.bullet"), UIImage(systemName: "list.bullet"))
        case .profile:
            return (UIImage(systemName: "person"), UIImage(systemName: "person.fill"))
        }
        
    }
    
    var viewController: UIViewController {
        switch self {
        case .feed:
            return UINavigationController(rootViewController: FeedViewController())
        case .profile:
            return UINavigationController(rootViewController: ProfileViewController())
        }
    }
    
}
