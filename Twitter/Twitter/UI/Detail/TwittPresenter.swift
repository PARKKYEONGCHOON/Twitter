//
//  TwittPresenter.swift
//  Twitter
//
//  Created by 박경춘 on 2023/04/03.
//

import Foundation

protocol TwittProtocol: AnyObject {
    func setViews(twitt: Twitt)
    func setupView()
}

final class TwittPresenter: NSObject {
    
    private weak var viewController: TwittProtocol?
    private let twitt: Twitt
    
    init(viewController: TwittProtocol, twitt: Twitt) {
        self.viewController = viewController
        self.twitt = twitt
    }
    
    func viewDidLoad() {
        viewController?.setViews(twitt: twitt)
        viewController?.setupView()
    }
    
}
