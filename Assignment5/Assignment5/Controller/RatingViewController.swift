//
//  RatingViewController.swift
//  Assignment5
//
//  Created by wanmengyi on 3/2/22.
//

import UIKit
import SwiftyJSON
import SwiftSpinner
import Alamofire

class RatingViewController: UIViewController {
    
    @IBOutlet weak var txtRatingSymbol: UITextField!
    
    @IBOutlet weak var lblRating: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func getRating(_ sender: Any) {
        
        let symbol = txtRatingSymbol.text!
        
        let url = "\(ratingURL)\(symbol)?apikey=\(apiKey)"
        
        print(url)
        
        SwiftSpinner.show("Getting Rating for \(symbol)")
        
        AF.request(url).responseJSON { response in
            SwiftSpinner.hide(nil)
            if response.error != nil {
                print(response.error!)
                return
            }
            
            let ratings = JSON(response.data!).array
            
            guard let rating = ratings!.first else{return}
                
            print(rating)
            let rate = Rating()
            rate.symbol = rating["symbol"].stringValue
            rate.date = rating["date"].stringValue
            rate.rating = rating["rating"].stringValue
            rate.ratingScore = rating["ratingScore"].intValue
            rate.ratingRecommendation = rating["ratingRecommendation"].stringValue
            rate.ratingDetailsDCFScore = rating["ratingDetailsDCFScore"].intValue
            rate.ratingDetailsDCFRecommendation = rating["ratingDetailsDCFRecommendation"].stringValue
            rate.ratingDetailsROEScore = rating["ratingDetailsROEScore"].intValue
            rate.ratingDetailsROERecommendation = rating["ratingDetailsROERecommendation"].stringValue
            rate.ratingDetailsROAScore = rating["ratingDetailsROAScore"].intValue
            rate.ratingDetailsROARecommendation = rating["ratingDetailsROARecommendation"].stringValue
            rate.ratingDetailsDEScore = rating["ratingDetailsDEScore"].intValue
            rate.ratingDetailsDERecommendation = rating["ratingDetailsDERecommendation"].stringValue
            rate.ratingDetailsPEScore = rating["ratingDetailsPEScore"].intValue
            rate.ratingDetailsPERecommendation = rating["ratingDetailsPERecommendation"].stringValue
            rate.ratingDetailsPBScore = rating["ratingDetailsPBScore"].intValue
            rate.ratingDetailsPBRecommendation = rating["ratingDetailsPBRecommendation"].stringValue
            
            self.lblRating.text = "\(rate.symbol) : \(rate.rating)"
        }
    }
}
