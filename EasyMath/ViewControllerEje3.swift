//
//  ViewControllerEje3.swift
//  EasyMath
//
//  Created by Federico Miguel Huguet Mack on 11/15/17.
//  Copyright © 2017 Federico Miguel Huguet Mack. All rights reserved.
//

import UIKit
import AVFoundation

class ViewControllerEje3: UIViewController {
    var player: AVAudioPlayer?
    var arrEquations: [String] = ["cos", "sin"]
    @IBOutlet weak var coef: UILabel!
    
    //User
    @IBOutlet weak var ucoef1: UITextField!
    @IBOutlet weak var uln: UITextField!
    
    //Correct
    @IBOutlet weak var ccoef1: UILabel!
    @IBOutlet weak var cln: UILabel!
    @IBOutlet weak var cx: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        generateRand(true)
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func generateRand(_ sender: Any) {
        resetVals()
        coef.text = String(Int(arc4random_uniform(8)+1))
    }
    
    @IBAction func reviewAns(_ sender: Any) {
        if coef.text == ucoef1.text && coef.text == uln.text {
            playSound()
        }
        else {
            ccoef1.text = coef.text
            cln.text = "ln (" + coef.text! + " )"
            showVals()
        }
    }
    func resetVals(){
        ccoef1.isHidden = true
        cln.isHidden = true
        cx.isHidden = true
        ucoef1.text = ""
        ucoef1.text = ""
        uln.text = ""
    }
    func showVals(){
        ccoef1.isHidden = false
        cln.isHidden = false
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
        vc.backgroundIm = #imageLiteral(resourceName: "expeje")
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
