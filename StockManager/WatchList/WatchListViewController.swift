//
//  ViewController.swift
//  StockManager
//
//  Created by Drishti Sharma on 23/01/21.
//  Copyright © 2021 Drishti Sharma. All rights reserved.
//

import UIKit
import LightweightCharts


class WatchListViewController: UIViewController, UISearchBarDelegate {
    var interactor: WatchListBusinessLogic?
    var router: WatchListRouterLogic?
    
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
    
    var stackView : UIStackView = {
        let view = UIStackView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.distribution = .fillEqually
        view.axis = .horizontal
        return view
    }()
    
        
    override func viewDidLoad() {
        super.viewDidLoad()
        searchBar.delegate = self
        showSplashScreenView()
        interactor?.fetchHistory(searchText: nil)
    }
    
    func showSplashScreenView() {
        view.addSubview(splashScreen)
        NSLayoutConstraint.activate([
            splashScreen.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            splashScreen.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            splashScreen.topAnchor.constraint(equalTo: view.topAnchor),
            splashScreen.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
    
    func setUpView(data: [BarData]) {
        charts = LightweightCharts()
        charts.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(searchBar)
        view.addSubview(charts)
        
        NSLayoutConstraint.activate([
            searchBar.topAnchor.constraint(equalTo: view.topAnchor, constant: 100),
            searchBar.bottomAnchor.constraint(equalTo: charts.topAnchor, constant: 32),
            searchBar.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            searchBar.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16)
        ])
        
        NSLayoutConstraint.activate([
            charts.heightAnchor.constraint(equalToConstant: 600),
            charts.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            charts.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
        series = charts.addBarSeries(options: nil)
        
        
        let data1 = [
            BarData(time: .string("2018-10-19"), open: 19.309999465942383, high: 19.534000228881836, low: 18.90999984741211, close: 19.040000915527344),
            BarData(time: .string("2018-10-22"), open: 19.339999465952383, high: 19.576000228881836, low: 18.9899984741211, close: 19.055000915527344),
            BarData(time: .string("2018-10-23"), open: 19.356999465942383, high: 19.598000228881836, low: 18.99099984741211, close: 19.066000915527344),
            BarData(time: .string("2018-10-24"), open: 19.387999465942383, high: 19.6540000228881836, low: 19.00999984741211, close: 19.077000915527344),
            BarData(time: .string("2018-10-25"), open: 19.456999465942383, high: 19.678000228881836, low: 19.020099984741211, close: 19.098000915527344)
        ]
        
        series.setData(data: data)
    }
}

extension WatchListViewController: WatchListDisplayLogic {
    func showChart(historyData: [BarData]) {
        print(historyData)
        DispatchQueue.main.async {
            self.splashScreen.isHidden = true
            self.setUpView(data: historyData)
        }
    }
    
    func showErrorScreen() {
        print("errorScreen")
    }
}

extension WatchListViewController {

    func searchBarSearchButtonClicked(searchBar: UISearchBar) {
        interactor?.fetchHistory(searchText: searchBar.text)
    }
}

