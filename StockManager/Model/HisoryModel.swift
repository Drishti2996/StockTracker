//
//  HisoryModel.swift
//  StockManager
//
//  Created by Drishti Sharma on 23/01/21.
//  Copyright © 2021 Drishti Sharma. All rights reserved.
//
//MARK: - history model 
struct History: Decodable {
    let prices: [Price]?
}

struct Price: Decodable {
    let date: Double?
    let open: Double?
    let high: Double?
    let low: Double?
    let close: Double?
    let volume: Double?
    let adjclose: Double?
    
}
