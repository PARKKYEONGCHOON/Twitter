//
//  FeedTableViewCell.swift
//  Twitter
//
//  Created by 박경춘 on 2023/04/02.
//

import UIKit
import SnapKit




final class FeedTableViewCell: UITableViewCell {
    static let identifirer = "FeedTableViewCell"
    
    private lazy var profileImageView: UIImageView = {
       let imageView = UIImageView()
        imageView.backgroundColor = .lightGray
        imageView.layer.cornerRadius = 21.0
        
        return imageView
    }()
    
    
    private lazy var writterNameLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 15.0, weight: .bold)
        
        return label
    }()
    
    private lazy var writterAccountLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 14.0, weight: .medium)
        label.textColor = .secondaryLabel
        
        return label
    }()
    
    private lazy var writterContentsLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 15.0, weight: .medium)
        label.numberOfLines = 0
        
        return label
    }()
    
    private lazy var likeButton: UIButton = {
        let button = UIButton()
        button.setImage(Icon.like.image, for: .normal)
        button.tintColor = .secondaryLabel
        
        return button
    }()
    
    private lazy var commentButton: UIButton = {
        let button = UIButton()
        button.setImage(Icon.message.image, for: .normal)
        button.tintColor = .secondaryLabel
        
        return button
    }()
    
    private lazy var shareButton: UIButton = {
        let button = UIButton()
        button.setImage(Icon.share.image, for: .normal)
        button.tintColor = .secondaryLabel
        
        return button
    }()
    
    func setup(twitt: Twitt) {
        
        self.selectionStyle = .none
        
        setupLayout()
        
        writterNameLabel.text = twitt.user.name
        writterAccountLabel.text = "@\(twitt.user.account)"
        writterContentsLabel.text = twitt.contents
        
    }
    
}

private extension FeedTableViewCell {
    
    func setupLayout() {
        
        let buttonStackView = UIStackView(arrangedSubviews: [likeButton,commentButton,shareButton])
        buttonStackView.axis = .horizontal
        buttonStackView.distribution = .fillEqually
        
        [
            profileImageView,
            writterNameLabel,
            writterAccountLabel,
            writterContentsLabel,
            buttonStackView
        ].forEach {
            self.addSubview($0)
        }
        
        let superViewMargin: CGFloat = 16.0
        
        profileImageView.snp.makeConstraints {
            $0.leading.equalToSuperview().inset(superViewMargin)
            $0.top.equalToSuperview().inset(superViewMargin)
            $0.width.equalTo(40.0)
            $0.height.equalTo(40.0)
        }
        
        writterNameLabel.snp.makeConstraints {
            $0.leading.equalTo(profileImageView.snp.trailing).offset(superViewMargin)
            $0.top.equalTo(profileImageView.snp.top)
        }
        
        writterAccountLabel.snp.makeConstraints {
            $0.leading.equalTo(writterNameLabel.snp.trailing).offset(2.0)
            $0.bottom.equalTo(writterNameLabel.snp.bottom)
        }
        
        writterContentsLabel.snp.makeConstraints {
            $0.leading.equalTo(writterNameLabel.snp.leading)
            $0.top.equalTo(writterNameLabel.snp.bottom).offset(4.0)
            $0.trailing.equalToSuperview().inset(16.0)
        }
        
        buttonStackView.snp.makeConstraints {
            $0.leading.equalTo(writterNameLabel.snp.leading)
            $0.trailing.equalTo(writterContentsLabel.snp.trailing)
            $0.top.equalTo(writterContentsLabel.snp.bottom).offset(12.0)
            $0.bottom.equalToSuperview().inset(superViewMargin)
        
        }
        
        
    }
}
