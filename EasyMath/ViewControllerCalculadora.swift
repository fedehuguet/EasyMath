//
//  ViewControllerCalculadora.swift
//  EasyMath
//
//  Created by Andrés Tamez on 11/13/17.
//  Copyright © 2017 Federico Miguel Huguet Mack. All rights reserved.
//

import UIKit

class ViewControllerCalculadora: UIViewController {

    var bPoli = false
    var bSeno = false
    var bCos = false
    var bCuadrada = false
    
    @IBOutlet weak var lblPotencia2: UILabel!
    @IBOutlet weak var lblPotencia3: UILabel!
    @IBOutlet weak var txtEcuacionPoli: UILabel!
    @IBOutlet weak var txtPol4: UITextField!
    @IBOutlet weak var txtPol3: UITextField!
    @IBOutlet weak var txtPol2: UITextField!
    @IBOutlet weak var txtPol1: UITextField!
    @IBOutlet weak var lblRespuesta: UILabel!
    @IBOutlet weak var btnCuadrada: UIButton!
    @IBOutlet weak var btnPoli: UIButton!
    @IBOutlet weak var btnSeno: UIButton!
    @IBOutlet weak var btnCoseno: UIButton!
    @IBOutlet weak var txtX: UITextField!
    
    @IBOutlet weak var btnCalcular: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        modificaEcuacion(strLbl: "Escoje una ecuación", bHide: true)
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
    
    @IBAction func CalcSeno(_ sender: UIButton) {
        let label = UILabel(frame: CGRect(x: 0, y: 0, width: 200, height: 21))
        label.center = CGPoint(x: 160, y: 285)
        label.textAlignment = .center
        label.text = "x"
        self.view.addSubview(label)
    }
    @IBAction func CalcPoli(_ sender: UIButton) {
        /*let a = Double(txtPol1.text!)
        let b = Double(txtPol2.text!)
        let c = Double(txtPol3.text!)
        let d = Double(txtPol4.text!)
        let f4 = makeThirdOrderPolynomial(A: a!, B: b!, C: c!, D: d!)
        let d4 = Int(derivativeOf(fn: f4, atX: Double(txtX.text!)!))
        lblRespuesta.text = String(d4)*/
        modificaEcuacion(strLbl: "x  +       x  +       x  +", bHide: false)
        txtEcuacionPoli.frame.origin = CGPoint(x: 16, y: 216)
        
        bPoli = true
        bSeno = false
        bCos = false
        bCuadrada = false
        
    }
    @IBAction func CalcCuadrada(_ sender: UIButton) {
        modificaEcuacion(strLbl: "x", bHide: true)
        txtPol2.isHidden = false
        lblPotencia2.isHidden = false
        txtEcuacionPoli.frame.origin = CGPoint(x: 6, y: 216)
        bPoli = false
        bSeno = false
        bCos = false
        bCuadrada = true
    }
    
    
    @IBAction func calcularValor(_ sender: UIButton) {
        if(bCuadrada)
        {
            let numX = Int(txtX.text!)
            /*derivativeOf(fn: x_squared, atX: numX!)
            let intDer = Int(derivativeOf(fn: x_squared, atX: numX!))
            */
            let intDer = Int(txtPol2.text!)! * 2 * numX!
            lblRespuesta.text = String(intDer)
        }
        else if(bPoli)
        {
            let a = Double(txtPol1.text!)
            let b = Double(txtPol2.text!)
            let c = Double(txtPol3.text!)
            let d = Double(txtPol4.text!)
            let f4 = makeThirdOrderPolynomial(A: a!, B: b!, C: c!, D: d!)
            let d4 = Int(derivativeOf(fn: f4, atX: Double(txtX.text!)!))
            lblRespuesta.text = String(d4)
        }
    }
    
    func modificaEcuacion(strLbl: String, bHide: Bool)
    {
        txtPol1.isHidden = bHide
        txtPol3.isHidden = bHide
        txtPol4.isHidden = bHide
        lblPotencia3.isHidden = bHide
        txtPol2.isHidden = bHide
        lblPotencia2.isHidden = bHide
        txtEcuacionPoli.text = strLbl
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
