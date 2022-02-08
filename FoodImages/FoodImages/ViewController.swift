//
//  ViewController.swift
//  FoodImages
//
//  Created by wanmengyi on 2/6/22.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    let images = ["Food1", "Food2","Food3", "Food4","Food5", "Food6","Food7", "Food8","Food9", "Food10"]
    let foodNames = ["Hot Pot","Dim Sum","Pancake","Pho","Poke","BBQ","Salads","Croissant","Dumplings","Burger",]

    
    @IBOutlet weak var tblView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tblView.delegate = self
        tblView.dataSource = self
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return images.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! TableViewCell
        
        cell.imgViewCell.image = UIImage(named: images[indexPath.row])
        cell.lblCell.text = foodNames[indexPath.row]

        
        return cell
    }


}

