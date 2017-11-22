//
//  ViewControllerPasos.swift
//  EasyMath
//
//  Created by Andrés Tamez on 10/22/17.
//  Copyright © 2017 Federico Miguel Huguet Mack. All rights reserved.
//

import UIKit

class ViewControllerPasos: UIViewController {
    open override var supportedInterfaceOrientations: UIInterfaceOrientationMask{
        get {
            return .portrait
        }
    }
    open override var shouldAutorotate: Bool {
        get {
            return false
        }
    }
    var imagePasos : UIImage!
    @IBOutlet weak var imgPasos: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        imgPasos.image = imagePasos
        self.title = "Paso a paso"
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
