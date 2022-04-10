//
//  TableViewCode.swift
//  StockPrice
//
//  Created by wanmengyi on 4/10/22.
//

import Foundation

import UIKit

extension ViewController : UITableViewDelegate, UITableViewDataSource{
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let rows = stockModel?.count else { return 0 }
        return rows
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
        let cell = Bundle.main.loadNibNamed("CustomTableViewCell", owner: self, options: nil)?.first as! CustomTableViewCell
        
        guard let stockPriceModel = stockModel?[indexPath.row] else {return cell}

        cell.lblSymbol.text = stockPriceModel.symbol
        cell.lblCompanyName.text = stockPriceModel.companyName
        cell.companyName = stockPriceModel.companyName
        cell.symbol = stockPriceModel.symbol
        cell.sendStockDelegate = self
        
        return cell
    }
}
    
