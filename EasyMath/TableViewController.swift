//
//  TableViewController.swift
//  EasyMath
//
//  Created by Andrés Tamez on 10/21/17.
//  Copyright © 2017 Federico Miguel Huguet Mack. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.backgroundView = UIImageView(image: UIImage(named: "back"))
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        /*let strLbl = tableView.cellForRow(at:  tableView.indexPathForSelectedRow!)?.textLabel?.text
        let vistaInicial  = segue.destination as! ViewController
        vistaInicial.strLbl = strLbl*/
        
    }
//    override func tableView(tableView: UITableView, willDisplayCell cell: UITableViewCell, forRowAtIndexPath indexPath: NSIndexPath) {
//        cell.backgroundColor = UIColor(white: 1, alpha: 0.5)
//    }
}
