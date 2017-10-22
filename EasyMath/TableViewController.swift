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

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
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
}
