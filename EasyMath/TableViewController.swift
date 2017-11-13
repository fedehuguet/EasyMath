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
        let backgroundImage = UIImage(named: "back")
        let imageView = UIImageView(image: backgroundImage)
        self.tableView.backgroundView = imageView
        //tableView.backgroundView = UIImageView(image: UIImage(named: "back"))
        
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
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return CGFloat(integerLiteral: 140)
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 1
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)
        cell.backgroundColor = UIColor(white: 1, alpha: 0.7)
        return cell
    }
}
