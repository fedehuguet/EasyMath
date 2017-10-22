//
//  ViewControllerRevisar.swift
//  EasyMath
//
//  Created by Federico Miguel Huguet Mack on 10/22/17.
//  Copyright © 2017 Federico Miguel Huguet Mack. All rights reserved.
//

import UIKit

class ViewControllerRevisar: UIViewController {

    @IBOutlet weak var coef1: UILabel!
    @IBOutlet weak var exp1: UILabel!
    @IBOutlet weak var coef2: UILabel!
    @IBOutlet weak var exp2: UILabel!
    @IBOutlet weak var coef3: UILabel!
    @IBOutlet weak var exp3: UILabel!
    @IBOutlet weak var coef4: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func generateRand(_ sender: Any) {
        coef1.text = String(Int(arc4random_uniform(8)+1))
        exp1.text = String(Int(arc4random_uniform(8)+1))
        coef2.text = String(Int(arc4random_uniform(8)+1))
        exp2.text = String(Int(arc4random_uniform(8)+1))
        coef3.text = String(Int(arc4random_uniform(8)+1))
        exp3.text = String(Int(arc4random_uniform(8)+1))
        coef4.text = String(Int(arc4random_uniform(8)+1))
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
