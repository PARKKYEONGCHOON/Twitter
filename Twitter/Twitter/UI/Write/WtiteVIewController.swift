//
//  WtiteVIewController.swift
//  Twitter
//
//  Created by 박경춘 on 2023/04/03.
//

import UIKit
import SnapKit

final class WriteViewController: UIViewController {
    
    private lazy var presenter = WritePresenter(viewController: self)
    
    private lazy var leftBarButtonItem: UIBarButtonItem = {
        let barButtonIttem = UIBarButtonItem(
            title: "닫기",
            style: .plain,
            target: self,
            action: #selector(didTapLeftBarButton)
        )
        
        return barButtonIttem
    }()
    
    private lazy var rightBarButtonItem: UIBarButtonItem = {
        let barButtonIttem = UIBarButtonItem(
            title: "트윗",
            style: .plain,
            target: self,
            action: #selector(didTapRightBarButton)
        )
        barButtonIttem.isEnabled = false
        
        return barButtonIttem
    }()
    
    private lazy var textView: UITextView = {
        let textView = UITextView()
        textView.delegate = self
        textView.textColor = .secondaryLabel
        textView.font = .systemFont(ofSize: 16.0, weight: .medium)
        textView.text = "무슨 일이 일어나고 있나요?"
        
        return textView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        presenter.viewDidLoad()
    }
    
    
}

extension WriteViewController: WriteProtocol {
    
    func setupView() {
        view.backgroundColor = .systemBackground
        
        navigationItem.leftBarButtonItem = leftBarButtonItem
        
        navigationItem.rightBarButtonItem = rightBarButtonItem
        
        view.addSubview(textView)
        
        let superViewMargin: CGFloat = 16.0
        
        textView.snp.makeConstraints{
            $0.top.equalTo(view.safeAreaLayoutGuide.snp.top).inset(superViewMargin)
            $0.leading.equalToSuperview().inset(superViewMargin)
            $0.trailing.equalToSuperview().inset(superViewMargin)
            $0.height.equalTo(160.0)
        }
        
    }
    
    func dismiss() {
        dismiss(animated: true)
    }
    
    
    
}

private extension WriteViewController {
    
    @objc func didTapLeftBarButton() {
        
        presenter.didTapLeftBarButton()
        
        
    }
    
    @objc func didTapRightBarButton() {
        
        presenter.didTapRightBarButton(text: textView.text)
        
    }
    
}

extension WriteViewController: UITextViewDelegate {
    func textViewDidBeginEditing(_ textView: UITextView) {
        guard textView.textColor == .secondaryLabel else { return }
        
        textView.text = nil
        textView.textColor = .label
    }
    
    func textViewDidChange(_ textView: UITextView) {
        guard textView.textColor != .secondaryLabel else { return }
        
        rightBarButtonItem.isEnabled = !textView.text.isEmpty
    }
}

