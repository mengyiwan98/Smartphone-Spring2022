//
//  CustomTableViewCell.swift
//  StockPrice
//
//  Created by wanmengyi on 4/10/22.
//

import UIKit

class CustomTableViewCell: UITableViewCell {

    @IBOutlet weak var lblCompanyName: UILabel!

    @IBOutlet weak var lblSymbol: UILabel!
    
    var sendStockDelegate : SendStockDelegate?
    
    var companyName = ""
    var symbol = ""
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    @IBAction func getPriceAction(_ sender: Any) {
        
        let stockPriceURL = getPriceURL(symbol)
                
        getStockPrice(stockPriceURL).done { stockQuoteModel in
            stockQuoteModel.companyName = self.companyName
            self.sendStockDelegate?.sendStockData(stockQuoteModel)
        }
        .catch { error in
            print(error.localizedDescription)
        }

    }
}
