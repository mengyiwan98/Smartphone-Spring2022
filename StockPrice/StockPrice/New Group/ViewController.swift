//
//  ViewController.swift
//  StockPrice
//
//  Created by wanmengyi on 4/10/22.
//

import UIKit

class ViewController: UIViewController, SendStockDelegate {

    let companies = ["facebook", "AAPL", "GOOG", "MSFT", "AMZN"]
    
    var stockModel: [StockQuoteModel]?

    @IBOutlet weak var lblCompanyName: UILabel!
    
    @IBOutlet weak var lblDayLow: UILabel!
    @IBOutlet weak var lblDayHigh: UILabel!
    @IBOutlet weak var lblPrice: UILabel!
    @IBOutlet weak var lblSymbol: UILabel!
    @IBOutlet weak var tblView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        stockModel = initializeStocks()
        // Do any additional setup after loading the view.
    }

    func initializeStocks() -> [StockQuoteModel]{
            let facebook = StockQuoteModel("Facebook", "FB");
            let apple = StockQuoteModel("Apple","AAPL");
            let google = StockQuoteModel("Alphabet","GOOG");
            let microsoft = StockQuoteModel("Mircrosoft Corporation","MSFT");
            let amazon = StockQuoteModel("Amazon","AMZN");

            var modelArr = [StockQuoteModel]()
            
            modelArr.append(facebook)
            modelArr.append(apple)
            modelArr.append(google)
            modelArr.append(microsoft)
            modelArr.append(amazon)

            return modelArr
        }
    
        
        func sendStockData(_ stockQuoteModel: StockQuoteModel) {
                lblCompanyName.text = stockQuoteModel.companyName
                lblSymbol.text = stockQuoteModel.symbol
                lblPrice.text = "$ \(stockQuoteModel.price)"
                lblDayHigh.text = "$ \(stockQuoteModel.dayHigh)"
                lblDayLow.text = "$ \(stockQuoteModel.dayLow)"
                
    }
}
