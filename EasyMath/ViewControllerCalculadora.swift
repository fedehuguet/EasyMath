//
//  ViewControllerCalculadora.swift
//  EasyMath
//
//  Created by Andrés Tamez on 11/13/17.
//  Copyright © 2017 Federico Miguel Huguet Mack. All rights reserved.
//

import UIKit

class ViewControllerCalculadora: UIViewController {

    @IBOutlet weak var btnCuadrada: UIButton!
    @IBOutlet weak var btnPoli: UIButton!
    @IBOutlet weak var btnSeno: UIButton!
    @IBOutlet weak var btnCoseno: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let borderAlpha : CGFloat = 0.7
        btnSeno.layer.borderWidth = 2.0
        btnSeno.layer.borderColor = UIColor(white: 2.0, alpha: borderAlpha).cgColor
        
        btnPoli.layer.borderWidth = 2.0
        btnPoli.layer.borderColor = UIColor(white: 2.0, alpha: borderAlpha).cgColor
        
        btnCuadrada.layer.borderWidth = 2.0
        btnCuadrada.layer.borderColor = UIColor(white: 2.0, alpha: borderAlpha).cgColor
        
        btnCoseno.layer.borderWidth = 2.0
        btnCoseno.layer.borderColor = UIColor(white: 2.0, alpha: borderAlpha).cgColor
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    
    //Funciones de derivadas
    func derivativeOf(fn: (Double)->Double, atX x: Double) -> Double {
        let h = 0.0000001
        return (fn(x + h) - fn(x))/h
    }
    
    func x_squared(x: Double) -> Double {
        return x * x
    }
    
    func makeThirdOrderPolynomial(A a: Double, B b: Double, C c: Double, D d: Double) -> ((Double) -> Double) {
        return { x in ((a * x + b) * x + c) * x + d }
    }

}
