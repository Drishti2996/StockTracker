//
//  ViewController.swift
//  StockManager
//
//  Created by Drishti Sharma on 23/01/21.
//  Copyright © 2021 Drishti Sharma. All rights reserved.
//

import UIKit
import LightweightCharts

class StockChartViewController: UIViewController {
    var interactor: StockChartBusinessLogic?
    var router: StockChartRouterLogic?
    
    var charts: LightweightCharts!
    var series: BarSeries!
    
    lazy var splashScreen: SplashScreenView = {
        let view = SplashScreenView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var searchBar: UISearchBar = {
        let search = UISearchBar()
        search.translatesAutoresizingMaskIntoConstraints = false
        return search
    }()
    
    var addToWatchListButton: UIButton = {
        let button = UIButton()
        button.setTitle("Add To WatchList", for: .normal)
        button.backgroundColor = .systemPink
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    var stockName: String?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        searchBar.delegate = self
        showSplashScreenView()
        interactor?.fetchHistory(searchText: nil)
    }
    
    //MARK: - to setup loader view
    func showSplashScreenView() {
        view.addSubview(splashScreen)
        NSLayoutConstraint.activate([
            splashScreen.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            splashScreen.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            splashScreen.topAnchor.constraint(equalTo: view.topAnchor),
            splashScreen.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
    //MARK: - to setup UI of chart view
    func setUpView(data: [BarData]) {
        navigationController?.navigationItem.title = "Stock Chart"
        charts = LightweightCharts()
        charts.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(searchBar)
        view.addSubview(charts)
        view.addSubview(addToWatchListButton)
        addToWatchListButton.addTarget(self, action: #selector(addToWatchListEvent), for: .touchUpInside)

        NSLayoutConstraint.activate([
            searchBar.topAnchor.constraint(equalTo: view.topAnchor, constant: 100),
            searchBar.bottomAnchor.constraint(equalTo: charts.topAnchor, constant: -32),
            searchBar.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            searchBar.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16)
        ])
        
        NSLayoutConstraint.activate([
            charts.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            charts.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            charts.bottomAnchor.constraint(equalTo: addToWatchListButton.topAnchor, constant: -16)
        ])
        
        NSLayoutConstraint.activate([
            addToWatchListButton.heightAnchor.constraint(equalToConstant: 50),
            addToWatchListButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -32),
            addToWatchListButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            addToWatchListButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16)
        ])
        series = charts.addBarSeries(options: nil)
        series.setData(data: data)
    }
 
    // MARK: - route to WatchList with stock name to be added
    @objc func addToWatchListEvent() {
        router?.routeToWatchList(stockName: stockName)
    }
}

extension StockChartViewController: StockChartDisplayLogic, UITextFieldDelegate {
    // MARK: - to setup chart data fetched from API
    func showChart(historyData: [BarData]) {
        DispatchQueue.main.async {
            self.splashScreen.isHidden = true
            self.setUpView(data: historyData)
        }
    }
    
    // MARK: - show error screen
    func showErrorScreen() {
        print("errorScreen")
    }
}

extension StockChartViewController: UISearchBarDelegate {
    // MARK: - to fetch history of stock when stock searched
    func searchBarSearchButtonClicked(searchBar: UISearchBar) {
        stockName = searchBar.text
        interactor?.fetchHistory(searchText: searchBar.text)
    }
    
    //MARK:- to dismiss keyboard
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return false
    }
}

