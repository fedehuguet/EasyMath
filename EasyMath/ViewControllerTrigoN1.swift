//
//  ViewControllerTrigoN1.swift
//  EasyMath
//
//  Created by Federico Miguel Huguet Mack on 11/13/17.
//  Copyright © 2017 Federico Miguel Huguet Mack. All rights reserved.
//

import UIKit
import AVFoundation

class ViewControllerTrigoN1: UIViewController {
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
    var player: AVAudioPlayer?
    var alertController: UIAlertController?
    var alertTimer: Timer?
    var remainingTime = 0
    var arrEquations: [String] = ["cos", "sin"]
    @IBOutlet weak var equation: UILabel!
    @IBOutlet weak var coef: UILabel!
    @IBOutlet weak var x: UILabel!
    
    //user
    @IBOutlet weak var usign: UITextField!
    @IBOutlet weak var ucoefeq: UITextField!
    @IBOutlet weak var uequation: UITextField!
    @IBOutlet weak var ucoef: UITextField!
    @IBOutlet weak var ux: UITextField!
    
    //correct
    @IBOutlet weak var csign: UILabel!
    @IBOutlet weak var ccoefeq: UILabel!
    @IBOutlet weak var cequation: UILabel!
    @IBOutlet weak var ccoef: UILabel!
    @IBOutlet weak var cx: UILabel!
    
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
        equation.text = arrEquations[Int(arc4random_uniform(2))]
        coef.text = String(Int(arc4random_uniform(8)+1))
    }
    
    @IBAction func reviewAns(_ sender: Any) {
        if usign.text == "" || ucoefeq.text == "" || uequation.text == "" || ucoef.text == "" || ux.text == "" {
            let alert = UIAlertController(title: "Error", message: "Llena completamente los campos", preferredStyle: UIAlertControllerStyle.alert)
            alert.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
        else {
            if equation.text == "sin" {
                if (usign.text == "+" && ucoefeq.text == coef.text && uequation.text == "cos" && ucoef.text == coef.text) {
                    playSound()
                    self.alertController = UIAlertController(title: "Felicidades", message: "Respuesta correcta", preferredStyle: .alert)
                    
                    let cancelAction = UIAlertAction(title: "Ok", style: .cancel) { (action) in
                        self.alertController=nil;
                        self.alertTimer?.invalidate()
                        self.alertTimer=nil
                    }
                    
                    self.alertController!.addAction(cancelAction)
                    
                    self.alertTimer = Timer.scheduledTimer(timeInterval: 2.0, target: self, selector: #selector(ViewControllerPolyN1.countDown), userInfo: nil, repeats: true)
                    
                    self.present(self.alertController!, animated: true, completion: nil)
                }
                else {
                    let refreshAlert = UIAlertController(title: "Respuesta incorrecta", message: "¿Deseas ver la respuesta?", preferredStyle: UIAlertControllerStyle.alert)
                    
                    refreshAlert.addAction(UIAlertAction(title: "Si", style: .default, handler: { (action: UIAlertAction!) in
                        self.csign.text = "+"
                        self.ccoefeq.text = self.coef.text
                        self.cequation.text = "cos"
                        self.ccoef.text = self.coef.text
                        self.showVals()
                    }))
                    
                    refreshAlert.addAction(UIAlertAction(title: "No, seguire intentando", style: .cancel, handler: nil))
                    present(refreshAlert, animated: true, completion: nil)
                }
            }
            else {
                if (usign.text == "-" && ucoefeq.text == coef.text && uequation.text == "sin" && ucoef.text == coef.text) {
                    playSound()
                    //            let alert = UIAlertController(title: "Felicidades", message: "Respuesta correcta", preferredStyle: UIAlertControllerStyle.alert)
                    //            alert.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.default, handler: nil))
                    //            self.present(alert, animated: true, completion: nil)
                }
                else {
                    let refreshAlert = UIAlertController(title: "Respuesta incorrecta", message: "¿Deseas ver la respuesta?", preferredStyle: UIAlertControllerStyle.alert)
                    
                    refreshAlert.addAction(UIAlertAction(title: "Si", style: .default, handler: { (action: UIAlertAction!) in
                        self.csign.text = "-"
                        self.ccoefeq.text = self.coef.text
                        self.cequation.text = "sin"
                        self.ccoef.text = self.coef.text
                        self.showVals()
                    }))
                    
                    refreshAlert.addAction(UIAlertAction(title: "No, seguire intentando", style: .cancel, handler: nil))
                    present(refreshAlert, animated: true, completion: nil)
                }
                
            }
        }
    }
    @objc func countDown() {
        
        self.remainingTime -= 1
        if (self.remainingTime < 0) {
            self.alertTimer?.invalidate()
            self.alertTimer = nil
            self.alertController!.dismiss(animated: true, completion: {
                self.alertController = nil
            })
        }
    }
    func resetVals(){
        csign.isHidden = true
        ccoefeq.isHidden = true
        cequation.isHidden = true
        ccoef.isHidden = true
        cx.isHidden = true
        usign.text = ""
        uequation.text = ""
        ucoef.text = ""
        ux.text = ""
    }
    func showVals(){
        csign.isHidden = false
        ccoefeq.isHidden = false
        cequation.isHidden = false
        ccoef.isHidden = false
        cx.isHidden = false
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
        vc.backgroundIm = #imageLiteral(resourceName: "trigoejen1")
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
