//
//  ViewControllerRevisar.swift
//  EasyMath
//
//  Created by Federico Miguel Huguet Mack on 10/22/17.
//  Copyright © 2017 Federico Miguel Huguet Mack. All rights reserved.
//

import UIKit
import AVFoundation

class ViewControllerRevisar: UIViewController {
    var player: AVAudioPlayer?
    //Original
    @IBOutlet weak var coef1: UILabel!
    @IBOutlet weak var exp1: UILabel!
    @IBOutlet weak var coef2: UILabel!
    @IBOutlet weak var exp2: UILabel!
    @IBOutlet weak var coef3: UILabel!
    @IBOutlet weak var exp3: UILabel!
    @IBOutlet weak var coef4: UILabel!
    
    //User answer
    @IBOutlet weak var ucoef1: UITextField!
    @IBOutlet weak var uexp1: UITextField!
    @IBOutlet weak var ucoef2: UITextField!
    @IBOutlet weak var uexp2: UITextField!
    @IBOutlet weak var ucoef3: UITextField!
    @IBOutlet weak var uexp3: UITextField!
    @IBOutlet weak var ucoef4: UITextField!
    
    //Correct answer
    @IBOutlet weak var ccoef1: UILabel!
    @IBOutlet weak var cexp1: UILabel!
    @IBOutlet weak var ccoef2: UILabel!
    @IBOutlet weak var cexp2: UILabel!
    @IBOutlet weak var ccoef3: UILabel!
    @IBOutlet weak var cexp3: UILabel!
    @IBOutlet weak var ccoef4: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        generateRand(true)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func generateRand(_ sender: Any) {
        resetVals()
        coef1.text = String(Int(arc4random_uniform(8)+1))
        exp1.text = String(Int(arc4random_uniform(8)+1))
        coef2.text = String(Int(arc4random_uniform(8)+1))
        exp2.text = String(Int(arc4random_uniform(8)+1))
        coef3.text = String(Int(arc4random_uniform(8)+1))
        exp3.text = String(Int(arc4random_uniform(8)+1))
        coef4.text = String(Int(arc4random_uniform(8)+1))
    }
    
    @IBAction func reviewAns(_ sender: Any) {
        let c1 = Int(coef1.text!)! * Int(exp1.text!)!
        let c2 = Int(coef2.text!)! * Int(exp2.text!)!
        let c3 = Int(coef3.text!)! * Int(exp3.text!)!
        
        if(String(c1)==(ucoef1.text!) && String(c2)==(ucoef2.text!) && String(c3)==(ucoef3.text!) &&
            Int(exp1.text!)!-1 == Int(uexp1.text!)! && Int(exp2.text!)!-1 == Int(uexp2.text!)! &&
            Int(exp3.text!)!-1 == Int(uexp3.text!)! && (ucoef4.text!)=="0"
            ){
            print("entro")
            playSound()
            print("salio")
        }
        else {
            ccoef1.text = String(c1)
            ccoef2.text = String(c2)
            ccoef3.text = String(c3)
            cexp1.text = String(Int(exp1.text!)!-1)
            cexp2.text = String(Int(exp2.text!)!-1)
            cexp3.text = String(Int(exp3.text!)!-1)
            ccoef4.text = "0"
            showVals()
        }
    }
    
    func resetVals(){
        ccoef1.isHidden = true
        cexp1.isHidden = true
        ccoef2.isHidden = true
        cexp2.isHidden = true
        ccoef3.isHidden = true
        cexp3.isHidden = true
        ccoef4.isHidden = true
        ucoef1.text = ""
        uexp1.text = ""
        ucoef2.text = ""
        uexp2.text = ""
        ucoef3.text = ""
        uexp3.text = ""
        ucoef4.text = ""
    }
    func showVals(){
        ccoef1.isHidden = false
        cexp1.isHidden = false
        ccoef2.isHidden = false
        cexp2.isHidden = false
        ccoef3.isHidden = false
        cexp3.isHidden = false
        ccoef4.isHidden = false
    }

    func playSound() {
        guard let url = Bundle.main.url(forResource: "winSound", withExtension: "mp3") else { return }
        
        do {
            try AVAudioSession.sharedInstance().setCategory(AVAudioSessionCategoryPlayback)
            try AVAudioSession.sharedInstance().setActive(true)
            
            
            
            /* The following line is required for the player to work on iOS 11. Change the file type accordingly*/
            player = try AVAudioPlayer(contentsOf: url, fileTypeHint: AVFileType.mp3.rawValue)
            
            /* iOS 10 and earlier require the following line:
             player = try AVAudioPlayer(contentsOf: url, fileTypeHint: AVFileTypeMPEGLayer3) */
            
            guard let player = player else { return }
            
            player.play()
            
        } catch let error {
            print(error.localizedDescription)
        }
    }

}
