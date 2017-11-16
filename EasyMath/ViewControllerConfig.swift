//
//  ViewControllerConfig.swift
//  EasyMath
//
//  Created by Andrés Tamez on 11/14/17.
//  Copyright © 2017 Federico Miguel Huguet Mack. All rights reserved.
//

import UIKit
protocol ProtocoloConfig
{
    func setConfig(b1:Bool,b2:Bool,b3:Bool,b4:Bool) -> Void
}
class ViewControllerConfig: UIViewController {
    
    var delegado : ProtocoloConfig!
    var bLog : Bool!
    var bPoli : Bool!
    var bExp : Bool!
    var bTrig : Bool!
    
    @IBOutlet weak var swPoli: UISwitch!
    
    @IBOutlet weak var swLog: UISwitch!
    
    @IBOutlet weak var swTrig: UISwitch!
    
    @IBOutlet weak var swExp: UISwitch!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        swPoli.isOn = bPoli
        swLog.isOn = bLog
        swTrig.isOn = bTrig
        swExp.isOn = bExp
        self.title = "Configuraciones"
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func cambiaConfig(_ sender: UISwitch) {
        if !swPoli.isOn && !swLog.isOn && !swTrig.isOn && !swExp.isOn {
            swPoli.isOn = true
        }
        delegado.setConfig(b1: swPoli.isOn, b2: swLog.isOn, b3: swTrig.isOn, b4: swExp.isOn)
    }
    
    
    
}

