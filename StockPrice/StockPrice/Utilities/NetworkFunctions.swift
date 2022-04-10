//
//  NetworkFunctions.swift
//  StockPrice
//
//  Created by wanmengyi on 4/10/22.
//

import Foundation
import PromiseKit
import Alamofire
import SwiftyJSON

func getPriceURL(_ symbol : String) -> String{
    let url = "\(priceURL)\(symbol)?apikey=\(apiKey)"
    return url
}

func getStockPrice(_ url : String) -> Promise<StockQuoteModel>{
    
    return Promise<StockQuoteModel> { seal -> Void in
        
        AF.request(url).responseJSON { response in
        
            if response.error != nil {
                seal.reject(response.error!)
            }
            
            let stockQuoteModel = StockQuoteModel("", "")
            //get data here
            let stockQuoteArray = JSON(response.data!).arrayValue
            
            guard let stockQuote = stockQuoteArray.first else {return seal.fulfill(stockQuoteModel)}
            
            stockQuoteModel.companyName = stockQuote["companyName"].stringValue
            stockQuoteModel.symbol = stockQuote["symbol"].stringValue
            stockQuoteModel.price = Double(stockQuote["price"].floatValue)
            stockQuoteModel.dayHigh = Double(stockQuote["dayHigh"].floatValue)
            stockQuoteModel.dayLow = Double(stockQuote["dayLow"].floatValue)
            
            seal.fulfill(stockQuoteModel)

        }
    }
}
