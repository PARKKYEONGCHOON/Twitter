//
//  WritePresenter.swift
//  Twitter
//
//  Created by 박경춘 on 2023/04/03.
//

import Foundation

protocol WriteProtocol: AnyObject {
    func setupView()
    func dismiss()
}

final class WritePresenter {
    
    
    private weak var viewController: WriteProtocol?
    private let userDefaulsManager: UserDefaultsManagerProtocol
    
    init(viewController: WriteProtocol,
         userDefaulsManager: UserDefaultsManagerProtocol = UserDefaultsManager()) {
        self.viewController = viewController
        self.userDefaulsManager = userDefaulsManager
    }
    
    func viewDidLoad() {
        viewController?.setupView()
    }
    
    func didTapLeftBarButton() {
        
        viewController?.dismiss()
        
    }
    
    func didTapRightBarButton(text: String) {
        let twitt = Twitt(user: User.shared, contents: text)
        userDefaulsManager.setTwitt(twitt)
        viewController?.dismiss()
    }
}
