//
//  FeedViewController.swift
//  Twitter
//
//  Created by 박경춘 on 2023/04/02.
//

import UIKit
import SnapKit
import Floaty

final class FeedViewController: UIViewController {
    
    private lazy var presenter = FeedPresenter(viewControoler: self)
    
    private lazy var writeButton: Floaty = {
        let floaty = Floaty(size: 50.0)
        floaty.handleFirstItemDirectly = true
        floaty.addItem(title: "") { [weak self] _ in
            
            self?.presenter.didTapWriteButton()
            
        }
        
        floaty.buttonImage = Icon.write.image?.withTintColor(.white, renderingMode: .alwaysOriginal)
        
        return floaty
    }()
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.delegate = presenter
        tableView.dataSource = presenter
        tableView.register(FeedTableViewCell.self, forCellReuseIdentifier: FeedTableViewCell.identifirer)
        
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        presenter.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        presenter.viewWillAppear()
    }
    
}


extension FeedViewController: FeedProtocol {
    
    func setupView() {
        navigationItem.title = "Feed"
        
        [tableView, writeButton].forEach{ view.addSubview($0)}
        
        //view.addSubview(tableView)
        
        tableView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
        writeButton.paddingY = 100.0
        
        
        
    }
    
    func reloadTableView(){
        tableView.reloadData()
    }
    
    func moveToTwittViewController(with twitt: Twitt) {
        let twittViewController = TwittViewController(twitt: twitt)
        
        navigationController?.pushViewController(twittViewController, animated: true)
    }
    
    func moveToWriteController() {
        
        let writeViewController = UINavigationController(rootViewController: WriteViewController())
        
        writeViewController.modalPresentationStyle = .fullScreen
        
        present(writeViewController, animated: true)
    }
    
}
