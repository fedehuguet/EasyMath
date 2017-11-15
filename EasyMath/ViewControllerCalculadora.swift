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
    
    @IBOutlet weak var lblValorX: UILabel!
    @IBOutlet weak var lblDerivada: UILabel!
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
        
        let screenSize = UIScreen.main.bounds
        let screenWidth = screenSize.width
        let screenHeight = screenSize.height
        
        //Tamaño btn Cuadrada
        btnCuadrada.frame = CGRect(x: screenWidth/2, y: screenHeight*0.75, width: screenWidth/2, height: screenHeight/5.42)
        
        //Tamaño boton Coseno
        btnCoseno.frame = CGRect(x: 0, y: screenHeight*0.75, width: screenWidth/2, height: screenHeight/5.42)
        print(screenHeight)
        
        //Tamaño boton Seno
        btnSeno.frame = CGRect(x: 0, y: screenHeight*0.57, width: screenWidth/2, height: screenHeight/5.42)
        
        //Tamaño boton Poli
        btnPoli.frame = CGRect(x: screenWidth/2, y: screenHeight*0.57, width: screenWidth/2, height: screenHeight/5.42)
        
        btnCalcular.isHidden = true
        txtX.isHidden = true
        lblValorX.isHidden = true
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func borrarDatos() {
        txtPol1.text = ""
        txtPol2.text = ""
        txtPol3.text = ""
        txtPol4.text = ""
        txtX.text = ""
        lblRespuesta.text = "0"
        lblDerivada.text = ""
        
        txtEcuacionPoli.frame.origin = CGPoint(x: 16, y: 216)
    }
    @IBAction func CalcSeno(_ sender: UIButton) {
        borrarDatos()
        btnCalcular.isHidden = false
        modificaEcuacion(strLbl: "        sin (        x)", bHide: true)
        txtPol3.isHidden = false
        bPoli = false
        bSeno = true
        bCos = false
        bCuadrada = false
        txtX.isHidden = false
        lblValorX.isHidden = false
        
    }
    @IBAction func CalcPoli(_ sender: UIButton) {
        borrarDatos()
        btnCalcular.isHidden = false
        modificaEcuacion(strLbl: "x  +       x  +       x  +", bHide: false)
        
        bPoli = true
        bSeno = false
        bCos = false
        bCuadrada = false
        txtX.isHidden = false
        lblValorX.isHidden = false
        
    }
    @IBAction func CalcCuadrada(_ sender: UIButton) {
        borrarDatos()
        btnCalcular.isHidden = false
        modificaEcuacion(strLbl: "x", bHide: true)
        txtPol2.isHidden = false
        lblPotencia2.isHidden = false
        txtEcuacionPoli.frame.origin = CGPoint(x: 6, y: 216)
        bPoli = false
        bSeno = false
        bCos = false
        bCuadrada = true
        txtX.isHidden = false
        lblValorX.isHidden = false
        
    }

    @IBAction func CalcCos(_ sender: Any) {
        borrarDatos()
        btnCalcular.isHidden = false
        modificaEcuacion(strLbl: "        cos (        x)", bHide: true)
        txtPol3.isHidden = false
        
        bPoli = false
        bSeno = false
        bCos = true
        bCuadrada = false
        txtX.isHidden = false
        lblValorX.isHidden = false
    }
    
    func verificaCalc() -> Bool {
        let intTf1 = Int(txtPol1.text!)
        let intTf2 = Int(txtPol2.text!)
        let intTf3 = Int(txtPol3.text!)
        let intTf4 = Int(txtPol4.text!)
        let intTfX = Int(txtX.text!)
        
        if(bCuadrada)
        {
            if intTf2 == nil || intTfX == nil {
                return false
            }
        }
        else if(bPoli)
        {
            if intTf1 == nil || intTf2 == nil || intTf3 == nil || intTf4 == nil || intTfX == nil {
                return false
            }
        }
        else if (bSeno)
        {
            if intTf3 == nil || intTfX == nil {
                return false
            }
        }
        else
        {
            //Coseno
            if intTf3 == nil || intTfX == nil {
                return false
            }
        }
        
        return true
    }
    
    @IBAction func calcularValor(_ sender: UIButton) {
        //Alert si estan vacios
        if verificaCalc() {
            if(bCuadrada)
            {
                let numX = Int(txtX.text!)
                let intDer = Int(txtPol2.text!)! * 2 * numX!
                lblRespuesta.text = String(intDer)
                lblDerivada.text = "Derivada: "+String(Int(txtPol2.text!)!*2)+"x"
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
                let str1 = String(Int(txtPol1.text!)!*3)
                let str2 = String(Int(txtPol2.text!)!*2)
                lblDerivada.text = "Derivada:   "+str1+" x^(2)  +  "+str2+"x  +  "+txtPol3.text!
                
            }
            else if (bSeno)
            {
                let intValor = cos(Double(txtPol3.text!)! * Double(txtX.text!)!) * Double(txtPol3.text!)!
                lblRespuesta.text = String(intValor)
                var strValor : String
                if(txtPol3.text == "1"){
                    strValor = ""
                }
                else {
                    strValor = txtPol3.text!
                }
                lblDerivada.text = "Derivada:   "+strValor+"cos("+strValor+"x)"
            }
            else
            {
                //Coseno
                let intValor = sin(Double(txtPol3.text!)! * Double(txtX.text!)!) * Double(txtPol3.text!)!
                lblRespuesta.text = String(intValor * -1)
                var strValor : String
                let strX : String
                
                if(txtPol3.text == "1"){
                    strValor = "-"
                    strX = ""
                }
                else if(Int(txtPol3.text!)! < 0){
                    strValor = txtPol3.text!
                    strX = txtPol3.text!
                }
                else{
                    strValor = "-"+txtPol3.text!
                    strX = txtPol3.text!
                }
                lblDerivada.text = "Derivada:   "+strValor+"sen("+strX+"x)"
                
            }
        }
        else {
            let alertaNaN = UIAlertController(title: "Error", message: "Debes llenar todos los espacios con numeros", preferredStyle: .alert)
            
            alertaNaN.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
            
            present(alertaNaN,animated: true, completion: nil)
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
