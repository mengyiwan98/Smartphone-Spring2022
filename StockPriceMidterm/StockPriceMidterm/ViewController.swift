//
//  ViewController.swift
//  StockPriceMidterm
//
//  Created by wanmengyi on 4/10/22.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, SendStockDelegate {

    
    @IBOutlet weak var lblCompanyName: UILabel!
    @IBOutlet weak var lblSymbol: UILabel!
    @IBOutlet weak var lblPrice: UILabel!
    @IBOutlet weak var lblHigh: UILabel!
    @IBOutlet weak var lblLow: UILabel!
    
    @IBOutlet weak var tblView: UITableView!
    
    var stocks : [StockModel] = [StockModel]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initStocks()
        getAAPLPrice()
        // Do any additional setup after loading the view.
    }
    
    func getAAPLPrice() {
        let url = getCompanyQuoteURL("AAPL")
        
        getCompanyData(url).done { stockmodel in
            self.sendStockData(stockmodel)
        }
        .catch { error in
            print(error.localizedDescription)
            
        }
    }
    
    func initStocks() {
        
        let AMZN = StockModel("Amazon", "AMZN")
        let FB = StockModel("Facebook", "FB")
        let MSFT = StockModel("Microsoft", "MSFT")
        let GOOG = StockModel("Google", "GOOG")
        let AAPL = StockModel("Apple", "AAPL")
        
        stocks.append(AMZN)
        stocks.append(FB)
        stocks.append(MSFT)
        stocks.append(GOOG)
        stocks.append(AAPL)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        stocks.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = Bundle.main.loadNibNamed("StockTableViewCell", owner: self, options: nil)?.first as! StockTableViewCell
        
        let stockModel = stocks[indexPath.row]
        cell.lblSymbol.text = stockModel.symbol
        cell.lblCompanyName.text = stockModel.companyName
        cell.symbol = stockModel.symbol
        cell.companyName = stockModel.companyName
        cell.sendStockDelegate = self
                
        return cell
    }
    
    func sendStockData(_ stockModel: StockModel) {
        
        lblCompanyName.text = "Company: \(stockModel.companyName)"
        lblSymbol.text = "Symbol: \(stockModel.symbol)"
        lblPrice.text = "Price: \(stockModel.price)"
        lblHigh.text = "Day High: \(stockModel.dayHigh)"
        lblLow.text = "Day Low: \(stockModel.dayLow)"
    }

}

