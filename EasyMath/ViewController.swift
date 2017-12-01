//
//  ViewController.swift
//  EasyMath
//
//  Created by Federico Miguel Huguet Mack on 10/19/17.
//  Copyright © 2017 Federico Miguel Huguet Mack. All rights reserved.
//

import UIKit

class ViewController: UIViewController, ProtocoloConfig {
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
    struct Problemas {
        let strID : String
        let imgProblema : UIImage
        let arrSolPrimera : UIImage
        let arrSolSegunda : UIImage
        let arrSolTercera : UIImage
        let imgPasosPrimera: UIImage
        let imgPasosSegunda: UIImage
        let imgPasosTercera: UIImage
    }
    var delegado : ProtocoloConfig!
    var bLog : Bool!
    var bPoli : Bool!
    var bExp : Bool!
    var bTrig : Bool!
    
    @IBOutlet weak var tabDerivadas: UITabBarItem!
    //por mientras son 2 luego random
    var intProblema = 0;
    var imagePasos : UIImage!
    @IBOutlet weak var segDerivada: UISegmentedControl!
    @IBOutlet weak var imagenProblema: UIImageView!
    var imageList = [Problemas]()
    var lstFiltroEcuaciones = [Problemas]()
    @IBOutlet weak var btnMostrar: UIButton!
    @IBOutlet weak var imagenSolucion: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        segDerivada.setTitle("Tercera", forSegmentAt: 2)
        
        imageList.append(Problemas(strID: "Poli", imgProblema: #imageLiteral(resourceName: "Problema2"), arrSolPrimera: #imageLiteral(resourceName: "Sol2x+5"), arrSolSegunda: #imageLiteral(resourceName: "Sol2x+10"), arrSolTercera: #imageLiteral(resourceName: "Solucion10"), imgPasosPrimera: #imageLiteral(resourceName: "Pasos2x+5"), imgPasosSegunda: #imageLiteral(resourceName: "Pasos2x+10"), imgPasosTercera: #imageLiteral(resourceName: "Pasos10")))
        
        imageList.append(Problemas(strID: "Trig", imgProblema: #imageLiteral(resourceName: "imgSinX2"), arrSolPrimera: #imageLiteral(resourceName: "SenSol1"), arrSolSegunda: #imageLiteral(resourceName: "SenSol2"), arrSolTercera: #imageLiteral(resourceName: "SenSol3"), imgPasosPrimera: #imageLiteral(resourceName: "Pasos1"), imgPasosSegunda: #imageLiteral(resourceName: "Pasos2"), imgPasosTercera: #imageLiteral(resourceName: "Pasos3")))
        
        imageList.append(Problemas(strID: "Log", imgProblema: #imageLiteral(resourceName: "log3X") , arrSolPrimera: #imageLiteral(resourceName: "R_Log3X"), arrSolSegunda: #imageLiteral(resourceName: "R2_Log3X"), arrSolTercera: #imageLiteral(resourceName: "R3_Log3X"), imgPasosPrimera: #imageLiteral(resourceName: "P_Log3X"), imgPasosSegunda: #imageLiteral(resourceName: "P2_Log3X"), imgPasosTercera: #imageLiteral(resourceName: "P3_Log3X")))
        
        agregarLista(id: "Exp", imgPro: #imageLiteral(resourceName: "2ex"), d1: #imageLiteral(resourceName: "R_2ex"), d2: #imageLiteral(resourceName: "R_2ex"), d3: #imageLiteral(resourceName: "R_2ex"), p1: #imageLiteral(resourceName: "P_2ex"), p2: #imageLiteral(resourceName: "P_2ex"), p3: #imageLiteral(resourceName: "P_2ex"))
        
        agregarLista(id: "Poli", imgPro: #imageLiteral(resourceName: "341"), d1: #imageLiteral(resourceName: "R_341"), d2: #imageLiteral(resourceName: "R2_341"), d3: #imageLiteral(resourceName: "R3_341"), p1: #imageLiteral(resourceName: "P_341"), p2: #imageLiteral(resourceName: "P3_341"), p3: #imageLiteral(resourceName: "P3_341"))
        
        agregarLista(id: "Trig", imgPro: #imageLiteral(resourceName: "cos3x2"), d1: #imageLiteral(resourceName: "R_cos3x2"), d2: #imageLiteral(resourceName: "R2_cos3x2"), d3: #imageLiteral(resourceName: "R3_3x2"), p1: #imageLiteral(resourceName: "P_cos3x2"), p2: #imageLiteral(resourceName: "P2_3x2"), p3: #imageLiteral(resourceName: "P3_3x2"))
        
        agregarLista(id: "Poli", imgPro: #imageLiteral(resourceName: "X_14x+3xyz"), d1: #imageLiteral(resourceName: " R_14x3xyz"), d2: #imageLiteral(resourceName: "R2_14x3xyz"), d3: #imageLiteral(resourceName: "R3_14x3xyz"), p1: #imageLiteral(resourceName: "P_14x3xyz"), p2: #imageLiteral(resourceName: "P2_14x3xyz"), p3: #imageLiteral(resourceName: "P3_14x3xyz"))
        
        agregarLista(id: "Log", imgPro: #imageLiteral(resourceName: "log4x+2"), d1: #imageLiteral(resourceName: " R_log4x+2"), d2: #imageLiteral(resourceName: "R2_log4x+2"), d3: #imageLiteral(resourceName: "R3_log4x+2"), p1: #imageLiteral(resourceName: "P_log4x+2"), p2: #imageLiteral(resourceName: "P2_log4x+2"), p3: #imageLiteral(resourceName: "P3_log4x+2"))
        
        agregarLista(id: "Trig", imgPro: #imageLiteral(resourceName: "tanX"), d1: #imageLiteral(resourceName: "R_tanX"), d2: #imageLiteral(resourceName: "R2_tanX"), d3: #imageLiteral(resourceName: "TanXNueva"), p1: #imageLiteral(resourceName: "P_tanX"), p2: #imageLiteral(resourceName: "P2_tanX"), p3: #imageLiteral(resourceName: "P3_tanX"))
        
        agregarLista(id: "Exp", imgPro: #imageLiteral(resourceName: " ex5^x"), d1: #imageLiteral(resourceName: "R_ex5^x"), d2: #imageLiteral(resourceName: "R2_ex5^x"), d3: #imageLiteral(resourceName: "R3_ex5^x"), p1: #imageLiteral(resourceName: "P_ex5^x"), p2: #imageLiteral(resourceName: "P2_ex5^x"), p3: #imageLiteral(resourceName: "P3_ex5^x"))
        
        agregarLista(id: "Poli", imgPro: #imageLiteral(resourceName: " div1:22"), d1: #imageLiteral(resourceName: "R_ div1:22"), d2: #imageLiteral(resourceName: "R2_ex5^x"), d3: #imageLiteral(resourceName: "R3_ div1:22"), p1: #imageLiteral(resourceName: "P_ div1:22"), p2: #imageLiteral(resourceName: "P2_ div1:22"), p3: #imageLiteral(resourceName: "P3_ div1:22"))
        
        agregarLista(id: "Trig", imgPro: #imageLiteral(resourceName: "cosx^2"), d1: #imageLiteral(resourceName: "R_cos^2"), d2: #imageLiteral(resourceName: "R1_cos^2"), d3: #imageLiteral(resourceName: "P2_cos^2"), p1:#imageLiteral(resourceName: "P_cos^2"), p2: #imageLiteral(resourceName: "P1_cos^2"), p3: #imageLiteral(resourceName: "P3_cos^2"))
        
        agregarLista(id: "Trig", imgPro: #imageLiteral(resourceName: "tan2x"), d1: #imageLiteral(resourceName: "R_tan2x"), d2: #imageLiteral(resourceName: "R2_tan2x"), d3: #imageLiteral(resourceName: "R3_tan2x"), p1: #imageLiteral(resourceName: "P_tan2x"), p2: #imageLiteral(resourceName: "P2_tan2x"), p3: #imageLiteral(resourceName: "P3_tan2x"))
        
        agregarLista(id: "Exp", imgPro: #imageLiteral(resourceName: "exp2x"), d1: #imageLiteral(resourceName: "R_exp2x"), d2: #imageLiteral(resourceName: "R2_exp2x"), d3: #imageLiteral(resourceName: "R3_exp2x"), p1: #imageLiteral(resourceName: "P_exp2x") , p2: #imageLiteral(resourceName: "P2_exp2x"), p3: #imageLiteral(resourceName: "P3_exp2x"))
        
        agregarLista(id: "Log", imgPro: #imageLiteral(resourceName: "ln2x3x"), d1: #imageLiteral(resourceName: "R_ln2x3x"), d2: #imageLiteral(resourceName: "R2_ln2x3x"), d3: #imageLiteral(resourceName: "R3_ln2x3x"), p1: #imageLiteral(resourceName: "P_ln2x3x"), p2: #imageLiteral(resourceName: "P2_ln2x3x"), p3: #imageLiteral(resourceName: "P3_ln2x3x"))
        
        agregarLista(id: "Poli", imgPro: #imageLiteral(resourceName: "2xx+3x"), d1: #imageLiteral(resourceName: "R_2xx+3x"), d2: #imageLiteral(resourceName: "R2_2xx+3x"), d3: #imageLiteral(resourceName: "R3_2xx+3x"), p1: #imageLiteral(resourceName: "P_2xx+3x"), p2: #imageLiteral(resourceName: "P2_2xx+3x"), p3: #imageLiteral(resourceName: "P3_2xx+3x"))
        
        agregarLista(id: "Trig", imgPro: #imageLiteral(resourceName: "sin2x3y"), d1: #imageLiteral(resourceName: "R_sin2x3y"), d2: #imageLiteral(resourceName: "R2_sin2x3y"), d3: #imageLiteral(resourceName: "R3_sin2x3y"), p1: #imageLiteral(resourceName: "P_sin2x3y"), p2: #imageLiteral(resourceName: "P2_sin2x3y"), p3: #imageLiteral(resourceName: "P3_sin2x3y"))
        
        agregarLista(id: "Log", imgPro: #imageLiteral(resourceName: "ln2x"), d1: #imageLiteral(resourceName: "R_ln2x"), d2: #imageLiteral(resourceName: "R2_ln2x"), d3: #imageLiteral(resourceName: "R3_ln2x"), p1: #imageLiteral(resourceName: "P_ln2x"), p2: #imageLiteral(resourceName: "P2_ln2x"), p3: #imageLiteral(resourceName: "P3_ln2x"))
        
        agregarLista(id: "Poli", imgPro: #imageLiteral(resourceName: "pol12x"), d1: #imageLiteral(resourceName: "R_pol12x"), d2: #imageLiteral(resourceName: "R2_pol12x"), d3: #imageLiteral(resourceName: "R3_pol12x"), p1: #imageLiteral(resourceName: "P_pol12x"), p2: #imageLiteral(resourceName: "P2_pol12x"), p3: #imageLiteral(resourceName: "P3_pol12x"))
        
        agregarLista(id: "Trig", imgPro: #imageLiteral(resourceName: "cosxy"), d1: #imageLiteral(resourceName: "R_cosxy"), d2: #imageLiteral(resourceName: "R2_cosxy"), d3: #imageLiteral(resourceName: "R3_cosxy"), p1: #imageLiteral(resourceName: "P_cosxy"), p2: #imageLiteral(resourceName: "P2_cosxy"), p3: #imageLiteral(resourceName: "P3_cosxy"))
        
        for index in 0...2 {
            segDerivada.setEnabled(false, forSegmentAt: index)
        }
        btnMostrar.isEnabled = false
        
        bLog = true
        bExp = true
        bTrig = true
        bPoli = true
        self.title = "Ecuaciones"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func agregarLista(id: String, imgPro: UIImage, d1: UIImage, d2: UIImage, d3: UIImage, p1: UIImage, p2: UIImage, p3: UIImage){
        
        imageList.append(Problemas(strID: id, imgProblema: imgPro , arrSolPrimera: d1, arrSolSegunda: d2, arrSolTercera: d3, imgPasosPrimera: p1, imgPasosSegunda: p2, imgPasosTercera: p3))
    }
    
    func filtrarLista() {
        for (_, element) in imageList.enumerated() {
            if bLog && element.strID == "Log" {
                lstFiltroEcuaciones.append(element)
            }
            else if bPoli && element.strID == "Poli" {
                lstFiltroEcuaciones.append(element)
            }
            else if bExp && element.strID == "Exp" {
                lstFiltroEcuaciones.append(element)
            }
            else if bTrig && element.strID == "Trig" {
                lstFiltroEcuaciones.append(element)
            }
        }
    }
    @IBAction func GenerarEcuacion(_ sender: UIButton) {
        segDerivada.selectedSegmentIndex = 0
        lstFiltroEcuaciones.removeAll()
        btnMostrar.isEnabled = true
        
        filtrarLista()
        var intRandom = Int(arc4random_uniform(UInt32(lstFiltroEcuaciones.count)))
        if intRandom == intProblema && intRandom < lstFiltroEcuaciones.count - 1 {
            intRandom = intRandom + 1
        }
        else if intRandom == intProblema && intRandom == lstFiltroEcuaciones.count - 1 {
            intRandom = intRandom - 1
        }
        else {
            intProblema = intRandom
        }
        
        imagenProblema.image = lstFiltroEcuaciones[intProblema].imgProblema
        
        for index in 0...2 {
            segDerivada.setEnabled(true, forSegmentAt: index)
        }
        
        if(segDerivada.selectedSegmentIndex == 2){
            imagenSolucion.image = lstFiltroEcuaciones[intProblema].arrSolTercera
        }
        else if(segDerivada.selectedSegmentIndex == 1){
            imagenSolucion.image = lstFiltroEcuaciones[intProblema].arrSolSegunda
        }
        else
        {
            imagenSolucion.image = lstFiltroEcuaciones[intProblema].arrSolPrimera
            
        }
    }
    @IBAction func CambiaDerivada(_ sender: Any) {
        if(segDerivada.selectedSegmentIndex == 0){
            imagenSolucion.image = lstFiltroEcuaciones[intProblema].arrSolPrimera
        }
        else if(segDerivada.selectedSegmentIndex == 1){
            imagenSolucion.image = lstFiltroEcuaciones[intProblema].arrSolSegunda
        }
        else
        {
            imagenSolucion.image = lstFiltroEcuaciones[intProblema].arrSolTercera
            
        }
        
    }
    
    @IBAction func MostrarPasos(_ sender: Any) {
        
        if(segDerivada.selectedSegmentIndex == 0){
            imagePasos = lstFiltroEcuaciones[intProblema].imgPasosPrimera
        }
        else if(segDerivada.selectedSegmentIndex == 1){
            imagePasos = lstFiltroEcuaciones[intProblema].imgPasosSegunda
        }
        else
        {
            imagePasos = lstFiltroEcuaciones[intProblema].imgPasosTercera
        }
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "Pasos" {
            let viewDes = segue.destination as! ViewControllerPasos
            viewDes.imagePasos = imagePasos
        }
        else {
            let viewCon = segue.destination as! ViewControllerConfig
            viewCon.bPoli = self.bPoli
            viewCon.bLog = self.bLog
            viewCon.bTrig = self.bTrig
            viewCon.bExp = self.bExp
            viewCon.delegado = self
        }
    }
    
    func setConfig(b1:Bool,b2:Bool,b3:Bool,b4:Bool) {
        bPoli = b1
        bLog = b2
        bTrig = b3
        bExp = b4
    }
    
    
}
