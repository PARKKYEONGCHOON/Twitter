//
//  FeedPresenter.swift
//  Twitter
//
//  Created by 박경춘 on 2023/04/02.
//


import UIKit

protocol FeedProtocol: AnyObject {
    func setupView()
    func reloadTableView()
    func moveToTwittViewController(with Twitt: Twitt)
    func moveToWriteController()
}

final class FeedPresenter: NSObject {
    
    private weak var viewControoler: FeedProtocol?
    private let userDefaultsManager: UserDefaultsManagerProtocol
    
    private var twiits: [Twitt] = []
    
    
    init(viewControoler: FeedProtocol?, userDefaultsManager: UserDefaultsManagerProtocol = UserDefaultsManager()) {
        self.viewControoler = viewControoler
        self.userDefaultsManager = userDefaultsManager
    }
    
    func viewDidLoad() {
        viewControoler?.setupView()
    }
    
    func viewWillAppear() {
        twiits = userDefaultsManager.getTwitt()
        viewControoler?.reloadTableView()
    }
    
    func didTapWriteButton() {
        viewControoler?.moveToWriteController()
    }
}

extension FeedPresenter: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print("\(twiits.count)")
        return twiits.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: FeedTableViewCell.identifirer, for: indexPath) as? FeedTableViewCell
        
        let twitt = twiits[indexPath.row]
        print(twitt)
        cell?.setup(twitt: twitt)
        
        return cell ?? UITableViewCell()
    }
    
}

extension FeedPresenter: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let twitt = twiits[indexPath.row]
        viewControoler?.moveToTwittViewController(with: twitt)
        
    }
    
}
