//
//  ViewController.swift
//  TableViewXibFile
//
//  Created by wanmengyi on 2/15/22.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var name : String?
    
    
    let images = ["Food1", "Food2","Food3", "Food4","Food5", "Food6","Food7", "Food8","Food9", "Food10"]
    let imageLabel = ["Hot Pot","Dim Sum","Pancake","Pho","Poke","BBQ","Salads","Croissant","Dumplings","Burger"]
    
    @IBOutlet weak var tblView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return images.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = Bundle.main.loadNibNamed("TableViewCell", owner: self, options: nil)?.first as! TableViewCell
    
        cell.imgView.image = UIImage(named: images[indexPath.row])
        cell.lblImage.text = imageLabel[indexPath.row]
        
        return cell
    }
}

