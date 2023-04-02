//
//  ProfilePresenter.swift
//  Twitter
//
//  Created by 박경춘 on 2023/04/03.
//

import UIKit
import SnapKit

protocol ProfileProtocol: AnyObject {
    func setupView()
    func setView(with name: String, account: String)
    func endEditing()
    func showToast()
}

final class ProfilePresenter{
    
    private weak var viewController: ProfileViewController?
    
    private var user: User {
        get { User.shared }
        set { User.shared = newValue }
    }
    
    
    init(viewController: ProfileViewController) {
        self.viewController = viewController
    }
    
    func viewDidLoad() {
        viewController?.setupView()
        viewController?.setView(with: user.name, account: user.account)
    }
    
    func didTapSaveButton(name: String?, account: String?) {
        
        if name == nil || name == "" || account == "" || account == "nil" {
            
            viewController?.showToast()
            
            return
        }
        
        if let name = name {
            user.name = name
        }
        
        if let account = account {
            user.account = account
        }
        
        viewController?.endEditing()
        
        viewController?.setView(with: user.name, account: user.account)
        
    }
    
}
