//
//  SendStockDelegate.swift
//  StockPriceMidterm
//
//  Created by wanmengyi on 4/10/22.
//

import Foundation

protocol SendStockDelegate {
    func sendStockData(_ stockModel : StockModel)
}
