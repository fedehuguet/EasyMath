//
//  TableViewController.swift
//  EasyMath
//
//  Created by Andrés Tamez on 10/21/17.
//  Copyright © 2017 Federico Miguel Huguet Mack. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {

    var arrContent : NSArray!
    override func viewDidLoad() {
        super.viewDidLoad()
        let backgroundImage = UIImage(named: "back")
        let imageView = UIImageView(image: backgroundImage)
        self.tableView.backgroundView = imageView
        //let path = Bundle.main.path(forResource: "Property List", ofType: "plist")
        //arrContent = NSArray(contentsOfFile: path!)
        
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
    @IBAction func unwindEjercicios (unwindSegue: UIStoryboardSegue) {
        
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return CGFloat(integerLiteral: 140)
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return arrContent.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let tableViewCell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath) as! TableViewCell
        tableViewCell.backgroundColor = UIColor(white: 1, alpha: 0.7)
//        let content = (arrContent[indexPath.row] as! NSDictionary)
//        tableViewCell.lbTitle.text = content["header"] as? String
//        tableViewCell.lbLevel.text = content["level"] as? String
//        tableViewCell.imgGraph.image = UIImage(named: (content["graph"] as? String)!)
        return tableViewCell
    }
}
