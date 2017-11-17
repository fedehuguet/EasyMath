//
//  ViewControllerTrigoN2.swift
//  EasyMath
//
//  Created by Federico Miguel Huguet Mack on 11/14/17.
//  Copyright © 2017 Federico Miguel Huguet Mack. All rights reserved.
//

import UIKit
import AVFoundation

class ViewControllerTrigoN2: UIViewController {
    var player: AVAudioPlayer?
    var arrEquations: [String] = ["cos", "sin"]
    @IBOutlet weak var exp: UILabel!
    @IBOutlet weak var equation: UILabel!
    
    //User
    @IBOutlet weak var ucoef1: UITextField!
    @IBOutlet weak var ux1: UITextField!
    @IBOutlet weak var uexp1: UITextField!
    @IBOutlet weak var uequat: UITextField!
    @IBOutlet weak var usign: UITextField!
    @IBOutlet weak var ux2: UITextField!
    @IBOutlet weak var uexp2: UITextField!
    @IBOutlet weak var uequat2: UITextField!
    
    //Correct
    @IBOutlet weak var ccoef1: UILabel!
    @IBOutlet weak var cx1: UILabel!
    @IBOutlet weak var cexp1: UILabel!
    @IBOutlet weak var cequat1: UILabel!
    @IBOutlet weak var cxeq: UILabel!
    @IBOutlet weak var csign: UILabel!
    @IBOutlet weak var cx2: UILabel!
    @IBOutlet weak var cexp2: UILabel!
    @IBOutlet weak var cequat2: UILabel!
    @IBOutlet weak var cxequat2: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        generateRand(true)
        self.hideKeyboardWhenTappedAround()
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func generateRand(_ sender: Any) {
        resetVals()
        exp.text = String(Int(arc4random_uniform(8)+1))
        equation.text = arrEquations[Int(arc4random_uniform(2))]
    }
    
    @IBAction func reviewAns(_ sender: Any) {
        if ucoef1.text == "" || ux1.text == "" || uexp1.text == "" || uequat.text == "" || usign.text == "" || ux2.text == "" || uexp2.text == "" || uequat2.text == "" {
            let alert = UIAlertController(title: "Error", message: "Llena completamente los campos", preferredStyle: UIAlertControllerStyle.alert)
            alert.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
        else {
            if equation.text == "sin" {
                if (ucoef1.text == exp.text && ux1.text == "x" && Int(uexp1.text!)! == Int(exp.text!)!-1 && usign.text == "+" && uequat.text == "sinx" && ux2.text == "x" && uexp2.text == exp.text && uequat2.text == "cosx") {
                    playSound()
                    //            let alert = UIAlertController(title: "Felicidades", message: "Respuesta correcta", preferredStyle: UIAlertControllerStyle.alert)
                    //            alert.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.default, handler: nil))
                    //            self.present(alert, animated: true, completion: nil)
                }
                else {
                    let refreshAlert = UIAlertController(title: "Respuesta incorrecta", message: "¿Deseas ver la respuesta?", preferredStyle: UIAlertControllerStyle.alert)
                    
                    refreshAlert.addAction(UIAlertAction(title: "Si", style: .default, handler: { (action: UIAlertAction!) in
                        self.ccoef1.text = self.exp.text
                        self.cexp1.text = String(Int(self.exp.text!)!-1)
                        self.cequat1.text = "sin"
                        self.csign.text = "+"
                        self.cexp2.text = self.exp.text
                        self.cequat2.text = "cos"
                        self.showVals()
                    }))
                    
                    refreshAlert.addAction(UIAlertAction(title: "No, seguire intentando", style: .cancel, handler: nil))
                    present(refreshAlert, animated: true, completion: nil)
                }
            }
            else {
                if (ucoef1.text == exp.text && ux1.text == "x" && Int(uexp1.text!)! == Int(exp.text!)!-1 && usign.text == "-" && uequat.text == "cosx" && ux2.text == "x" && uexp2.text == exp.text && uequat2.text == "sinx") {
                    playSound()
                    //            let alert = UIAlertController(title: "Felicidades", message: "Respuesta correcta", preferredStyle: UIAlertControllerStyle.alert)
                    //            alert.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.default, handler: nil))
                    //            self.present(alert, animated: true, completion: nil)
                }
                else {
                    let refreshAlert = UIAlertController(title: "Respuesta incorrecta", message: "¿Deseas ver la respuesta?", preferredStyle: UIAlertControllerStyle.alert)
                    
                    refreshAlert.addAction(UIAlertAction(title: "Si", style: .default, handler: { (action: UIAlertAction!) in
                        self.ccoef1.text = self.exp.text
                        self.cexp1.text = String(Int(self.exp.text!)!-1)
                        self.cequat1.text = "cos"
                        self.csign.text = "-"
                        self.cexp2.text = self.exp.text
                        self.cequat2.text = "sin"
                        self.showVals()
                    }))
                    
                    refreshAlert.addAction(UIAlertAction(title: "No, seguire intentando", style: .cancel, handler: nil))
                    present(refreshAlert, animated: true, completion: nil)
                }
                
            }
        }
    }
    func resetVals(){
        ccoef1.isHidden = true
        cx1.isHidden = true
        cexp1.isHidden = true
        cequat1.isHidden = true
        cxeq.isHidden = true
        csign.isHidden = true
        cx2.isHidden = true
        cexp2.isHidden = true
        cequat2.isHidden = true
        cxequat2.isHidden = true
        ucoef1.text = ""
        ux1.text = ""
        uexp1.text = ""
        uequat.text = ""
        usign.text = ""
        ux2.text = ""
        uexp2.text = ""
        uequat2.text = ""
    }
    func showVals(){
        ccoef1.isHidden = false
        cx1.isHidden = false
        cexp1.isHidden = false
        cequat1.isHidden = false
        cxeq.isHidden = false
        csign.isHidden = false
        cx2.isHidden = false
        cexp2.isHidden = false
        cequat2.isHidden = false
        cxequat2.isHidden = false
    }
    
    func playSound() {
        guard let url = Bundle.main.url(forResource: "winSound", withExtension: "mp3") else { return }
        
        do {
            try AVAudioSession.sharedInstance().setCategory(AVAudioSessionCategoryPlayback)
            try AVAudioSession.sharedInstance().setActive(true)
            
            player = try AVAudioPlayer(contentsOf: url, fileTypeHint: AVFileType.mp3.rawValue)
            
            guard let player = player else { return }
            
            player.play()
            
        } catch let error {
            print(error.localizedDescription)
        }
    }
    @IBAction func showInfo(_ sender: Any) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "info") as! ViewControllerInfo
        vc.backgroundIm = #imageLiteral(resourceName: "trigoejen2")
        self.navigationController?.pushViewController(vc, animated: true)
    }
}

