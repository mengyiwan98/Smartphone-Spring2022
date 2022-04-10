//
//  StockQuoteModel.swift
//  StockPrice
//
//  Created by wanmengyi on 4/10/22.
//

import Foundation

class StockQuoteModel {
    
    init(_ companyName : String, _ symbol : String) {
        self.companyName = companyName
        self.symbol = symbol
    }
    
    var companyName = ""
    var symbol = ""
    var price: Double = 0.0
    var dayHigh: Double = 0.0
    var dayLow: Double = 0.0
    
}
