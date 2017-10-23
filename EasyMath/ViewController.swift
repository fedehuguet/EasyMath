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
        let imgPasosPrimera: UIImage
        let imgPasosSegunda: UIImage
        let imgPasosTercera: UIImage
    }
    //por mientras son 2 luego random
    var intProblema = 0;
    var imagePasos : UIImage!
    @IBOutlet weak var segDerivada: UISegmentedControl!
    @IBOutlet weak var imagenProblema: UIImageView!
    var imageList = [Problemas]()
    
    @IBOutlet weak var btnMostrar: UIButton!
    @IBOutlet weak var imagenSolucion: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        segDerivada.setTitle("Tercera", forSegmentAt: 2)
        
        imageList.append(Problemas(strID: "Poli", imgProblema: #imageLiteral(resourceName: "Problema2"), arrSolPrimera: #imageLiteral(resourceName: "Sol2x+5"), arrSolSegunda: #imageLiteral(resourceName: "Sol2x+10"), arrSolTercera: #imageLiteral(resourceName: "Solucion10"), imgPasosPrimera: #imageLiteral(resourceName: "Pasos2x+5"), imgPasosSegunda: #imageLiteral(resourceName: "Pasos2x+10"), imgPasosTercera: #imageLiteral(resourceName: "Pasos10")))
        
        imageList.append(Problemas(strID: "trigonometrica", imgProblema: #imageLiteral(resourceName: "imgSinX2"), arrSolPrimera: #imageLiteral(resourceName: "SenSol1"), arrSolSegunda: #imageLiteral(resourceName: "SenSol2"), arrSolTercera: #imageLiteral(resourceName: "SenSol3"), imgPasosPrimera: #imageLiteral(resourceName: "Pasos1"), imgPasosSegunda: #imageLiteral(resourceName: "Pasos2"), imgPasosTercera: #imageLiteral(resourceName: "Pasos3")))
        
        for index in 0...2 {
            segDerivada.setEnabled(false, forSegmentAt: index)
        }
        btnMostrar.isEnabled = false
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func GenerarEcuacion(_ sender: UIButton) {
        
        if(intProblema==0){
            intProblema = 1;
        }
        else
        {
            intProblema = 0;
        }

        imagenProblema.image = imageList[intProblema].imgProblema
        
        for index in 0...2 {
            segDerivada.setEnabled(true, forSegmentAt: index)
        }
        
        btnMostrar.isEnabled = true
        if(segDerivada.selectedSegmentIndex == 2){
            imagenSolucion.image = imageList[intProblema].arrSolTercera
        }
        else if(segDerivada.selectedSegmentIndex == 1){
            imagenSolucion.image = imageList[intProblema].arrSolSegunda
        }
        else
        {
            imagenSolucion.image = imageList[intProblema].arrSolPrimera
            
        }
    }
    @IBAction func CambiaDerivada(_ sender: Any) {
        if(segDerivada.selectedSegmentIndex == 0){
            imagenSolucion.image = imageList[intProblema].arrSolPrimera
        }
        else if(segDerivada.selectedSegmentIndex == 1){
            imagenSolucion.image = imageList[intProblema].arrSolSegunda
        }
        else
        {
            imagenSolucion.image = imageList[intProblema].arrSolTercera
            
        }
        
    }
    
    @IBAction func MostrarPasos(_ sender: Any) {

        if(segDerivada.selectedSegmentIndex == 0){
        imagePasos = imageList[intProblema].imgPasosPrimera
        }
        else if(segDerivada.selectedSegmentIndex == 1){
            imagePasos = imageList[intProblema].imgPasosSegunda
        }
        else
        {
            imagePasos = imageList[intProblema].imgPasosTercera
        }
    }
    
    @IBAction func unwindPasos (unwindSegue: UIStoryboardSegue) {
        
    }
        
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let viewDes = segue.destination as! ViewControllerPasos
        
        viewDes.imagePasos = imagePasos
    }
    

}

