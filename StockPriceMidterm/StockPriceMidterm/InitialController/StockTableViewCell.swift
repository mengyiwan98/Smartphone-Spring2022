//
//  StockTableViewCell.swift
//  StockPriceMidterm
//
//  Created by wanmengyi on 4/10/22.
//

import UIKit

class StockTableViewCell: UITableViewCell {

    @IBOutlet weak var lblCompanyName: UILabel!
    @IBOutlet weak var lblSymbol: UILabel!
    
    var sendStockDelegate : SendStockDelegate?
    
    var symbol = ""
    var companyName = ""
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    @IBAction func getPriceAction(_ sender: Any) {
        
        let url = getCompanyQuoteURL(symbol)
        
        getCompanyData(url).done { stockmodel in
            self.sendStockDelegate?.sendStockData(stockmodel)
        }
        .catch { error in
            print(error.localizedDescription)
            
        }
    }
    
}
