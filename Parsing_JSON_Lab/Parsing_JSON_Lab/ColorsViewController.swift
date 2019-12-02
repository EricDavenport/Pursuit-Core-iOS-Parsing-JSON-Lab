//
//  ViewController.swift
//  Parsing_JSON_Lab
//
//  Created by Eric Davenport on 11/25/19.
//  Copyright © 2019 Eric Davenport. All rights reserved.
//

import UIKit

class ColorsViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var crayons = [CrayonBox]() {
        didSet {
            tableView.reloadData()
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        
    }
    
    func loadData() {
        crayons = Colors256.getColors()
    }


}

extension ColorsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "crayonCell", for: indexPath)
        
        let currentColor = crayons[indexPath.row]
        
        cell.textLabel!.text = currentColor.name
        cell.detailTextLabel!.text = currentColor.hexString
        //cell.backgroundColor = UIColor(displayP3Red: currentColor.rgb["r"] / 255 , green: 0, blue: 0, alpha: 1.0)
          return cell
        }
    

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return crayons.count
    }
}
