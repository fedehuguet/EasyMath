//
//  ViewController.swift
//  EasyMath
//
//  Created by Federico Miguel Huguet Mack on 10/19/17.
//  Copyright © 2017 Federico Miguel Huguet Mack. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    struct Problemas {
        let strID : String
        let imgProblema : UIImage
        let arrSolPrimera : UIImage
        let arrSolSegunda : UIImage
        let arrSolTercera : UIImage
    }
    
    var imageList = [Problemas]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        /*imageList.append(Problemas(strID: "sen^2", imgProblema: #imageLiteral(resourceName: "imgSinX2"), arrSolPrimera: <#T##[UIImage]#>, arrSolSegunda: <#T##[UIImage]#>, arrSolTercera: <#T##[UIImage]#>))*/
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

