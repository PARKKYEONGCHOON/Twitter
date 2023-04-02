//
//  ProfileViewController.swift
//  Twitter
//
//  Created by 박경춘 on 2023/04/03.
//

import UIKit
import SnapKit
import Toast


final class ProfileViewController: UIViewController {
    
    private lazy var presenter = ProfilePresenter(viewController: self)
    
    private lazy var nameTextField: UITextField = {
        let textField = UITextField()
        textField.font = .systemFont(ofSize: 20.0, weight: .medium)
        
        textField.delegate = self
        
        return textField
    }()
    
    private lazy var accountTextField: UITextField = {
        let textField = UITextField()
        textField.font = .systemFont(ofSize: 16.0, weight: .bold)
        
        textField.delegate = self
        
        return textField
    }()
    
    private lazy var saveButton: UIButton = {
       let button = UIButton()
        button.setTitle("저장하기", for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 15.0, weight: .bold)
        button.contentEdgeInsets = UIEdgeInsets(top: 8.0, left: 8.0, bottom: 8.0, right: 8.0)
        button.layer.cornerRadius = 15.0
        button.backgroundColor = .systemBlue
        button.setTitleColor(.white, for: .normal)
        button.addTarget(self, action: #selector(didTapSaveButton), for: .touchUpInside)
        
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        presenter.viewDidLoad()
    }
    
    
}

extension ProfileViewController: ProfileProtocol {
   
    func setupView() {
        
        navigationItem.title = "Profile"
        
        [nameTextField, accountTextField, saveButton].forEach {
            view.addSubview($0)
        }
        
        let superViewMargin: CGFloat = 16.0
        
        nameTextField.snp.makeConstraints {
            $0.leading.equalToSuperview().inset(superViewMargin)
            $0.trailing.equalToSuperview().inset(superViewMargin)
            $0.top.equalTo(view.safeAreaLayoutGuide).inset(superViewMargin)
        }
        
        accountTextField.snp.makeConstraints {
            $0.leading.equalTo(nameTextField.snp.leading)
            $0.trailing.equalTo(nameTextField.snp.trailing)
            $0.top.equalTo(nameTextField.snp.bottom).offset(superViewMargin)
        }
        
        saveButton.snp.makeConstraints {
            $0.leading.equalTo(nameTextField.snp.leading)
            $0.trailing.equalTo(nameTextField.snp.trailing)
            $0.top.equalTo(accountTextField.snp.bottom).offset(32.0)
        }
        
    }
    
    func setView(with name: String, account: String){
        
        nameTextField.text = name
        accountTextField.text = account
        
    }
    
    func endEditing() {
        view.endEditing(true)
    }
    
    func showToast() {
        view.makeToast("변경하고자 하는 내용을 입력해 주세요.")
    }
    
}

private extension ProfileViewController {
    
    @objc func didTapSaveButton() {
        presenter.didTapSaveButton(name: nameTextField.text, account: accountTextField.text)
    }
    
}

extension ProfileViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
