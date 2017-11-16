//
//  ViewController.swift
//  EasyMath
//
//  Created by Federico Miguel Huguet Mack on 10/19/17.
//  Copyright © 2017 Federico Miguel Huguet Mack. All rights reserved.
//

import UIKit

class ViewController: UIViewController, ProtocoloConfig {
    
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
        for (index, element) in imageList.enumerated() {
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
        intProblema = Int(arc4random_uniform(UInt32(lstFiltroEcuaciones.count)))
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
