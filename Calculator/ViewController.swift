//
//  ViewController.swift
//  Calculator
//
//  Created by MacBook Pro on 29/09/23.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var calcButton: [UIButton]!
    
    @IBOutlet weak var lbResult: UILabel!
    
    var first = "";
    var second = "";
    var simbol = "";
    var result = "";
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        for button in calcButton{
            button.layer.cornerRadius = button.frame.size.height/2;
//            button.titleLabel?.font = UIFont.systemFont(ofSize: 2400.0, weight: .bold)
        }
    }
    
    @IBAction func btnNumber(_ sender: UIButton) {
        if simbol == ""{
            first += String(sender.tag);
            lbResult.text = first;
        }
    }
    
    @IBAction func btnAC(_ sender: UIButton) {
        first = "";
        second = "";
        simbol = "";
        result = "";
    }
}

