//
//  TwittViewController.swift
//  Twitter
//
//  Created by 박경춘 on 2023/04/03.
//

import UIKit
import SnapKit


final class TwittViewController: UIViewController {
    
    private var presenter: TwittPresenter!
    
    private lazy var profileImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = .lightGray
        imageView.layer.cornerRadius = 30.0
        
        return imageView
    }()
    
    private lazy var userNameLabel: UILabel = {
       let label = UILabel()
        label.font = .systemFont(ofSize: 15.0, weight: .medium)
        
        return label
    }()
    
    private lazy var userAccountLabel: UILabel = {
       let label = UILabel()
        label.font = .systemFont(ofSize: 13.0, weight: .bold)
        label.textColor = .secondaryLabel
        
        return label
        
    }()
    
    private lazy var contentsLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 16.0, weight: .medium)
        label.numberOfLines = 0
        
        return label
    }()
    
    private lazy var isLikeButton: UIButton = {
       let button = UIButton()
        button.setImage(Icon.like.image, for: .normal)
        button.tintColor = .secondaryLabel
        
        return button
    }()
    
    private lazy var shareButton: UIButton = {
       let button = UIButton()
        button.setImage(Icon.share.image, for: .normal)
        button.tintColor = .secondaryLabel
        
        return button
    }()
    
    init(twitt: Twitt) {
        super.init(nibName: nil, bundle: nil)
        
        presenter = TwittPresenter(viewController: self, twitt: twitt)
        view.backgroundColor = .systemBackground
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        presenter.viewDidLoad()
    }
}

extension TwittViewController: TwittProtocol {
    
    func setViews(twitt: Twitt) {
        
        userNameLabel.text = twitt.user.name
        userAccountLabel.text = "@\(twitt.user.account)"
        contentsLabel.text = twitt.contents
        
    }
    
    func setupView() {
        
        let userInfoStackView = UIStackView(arrangedSubviews: [userNameLabel,userAccountLabel])
        
        userInfoStackView.axis = .vertical
        userInfoStackView.distribution = .equalSpacing
        userInfoStackView.spacing = 4.0
        
        let buttonStackView = UIStackView(arrangedSubviews: [isLikeButton,shareButton])
        buttonStackView.axis = .horizontal
        buttonStackView.distribution = .fillEqually
        
        [profileImageView, userInfoStackView, contentsLabel, buttonStackView].forEach { view.addSubview($0) }
        
        let superViewMargin: CGFloat = 16.0
        
        profileImageView.snp.makeConstraints {
            $0.leading.equalToSuperview().inset(superViewMargin)
            $0.top.equalTo(view.safeAreaLayoutGuide).inset(superViewMargin)
            $0.width.equalTo(60)
            $0.height.equalTo(60)
        }
        
        userInfoStackView.snp.makeConstraints {
            $0.leading.equalTo(profileImageView.snp.trailing).offset(8.0)
            $0.trailing.equalToSuperview().inset(superViewMargin)
            $0.centerY.equalTo(profileImageView.snp.centerY)
        }
        
        contentsLabel.snp.makeConstraints {
            $0.leading.equalTo(profileImageView.snp.leading)
            $0.trailing.equalTo(userInfoStackView.snp.trailing)
            $0.top.equalTo(profileImageView.snp.bottom).offset(8.0)
        }
        
        buttonStackView.snp.makeConstraints {
            $0.leading.equalTo(profileImageView.snp.leading)
            $0.trailing.equalTo(userInfoStackView.snp.trailing)
            $0.top.equalTo(contentsLabel.snp.bottom).offset(superViewMargin)
        }
        
    }
    
}
