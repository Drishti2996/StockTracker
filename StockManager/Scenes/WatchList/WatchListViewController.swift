//
//  ViewController.swift
//
//  Created by Drishti Sharma on 23/01/21.
//  Copyright © 2021 Drishti Sharma. All rights reserved.
//

import UIKit

class WatchListViewController: UIViewController {
    var interactor: WatchListBusinessLogic?
    var router: WatchListRouterLogic?
    var stockName: String
    
    lazy var tableView: UITableView = {
       let table = UITableView()
        table.translatesAutoresizingMaskIntoConstraints = false
        return table
    }()
    
    init(stockName: String) {
        self.stockName = stockName
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        
        setUpDataSource()
    }
    
    func setupTableView() {
        view.addSubview(tableView)
        NSLayoutConstraint.activate([
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
    func setUpDataSource() {
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        
    }
}

extension WatchListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
      return 5
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
      let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
      return cell
    }
}
