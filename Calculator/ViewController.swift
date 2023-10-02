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
    
    @IBOutlet weak var btnClear: UIButton!
    
    var first = "";
    var second = "";
    var simbol = "";
    var result = "";
    var cekResult = false;
    var afterResult = "";
    var cekPersen = false;
    var cekKoma = false;
    var cekMinus = false;
    
    @IBAction func bagi(_ sender: Any) {
        simbol = "/";
    }
    
    @IBAction func kali(_ sender: Any) {
        simbol = "*";
    }
    
    @IBAction func kurang(_ sender: Any) {
        simbol = "-";
    }
    
    @IBAction func tambah(_ sender: Any) {
        simbol = "+";
    }
    
    @IBAction func hasil(_ sender: Any) {
        result = String(hitung());
        let pisah = result.components(separatedBy: ".")
        if pisah[1] == "0"
        {
            lbResult.text = pisah[0];
        }
        else
        {
            lbResult.text = result;
        }
        afterResult = "";
    }
    
    @IBAction func btnNumber(_ sender: UIButton) {
        if String(sender.tag) == "0" && lbResult.text == "0"{
            
        }
        else{
            if !cekPersen {
                if simbol == ""
                {
                    first += String(sender.tag);
                    lbResult.text = first;
                    btnClear.setTitle(" C", for: .normal)
                }
                else if simbol != "" && !cekResult
                {
                    second += String(sender.tag);
                    lbResult.text = second;
                    btnClear.setTitle(" C", for: .normal)
                }
                else if simbol != "" && cekResult
                {
                    afterResult += String(sender.tag);
                    lbResult.text = afterResult;
                    btnClear.setTitle(" C", for: .normal)
                }
                autoFont();
            }
            else
            {
                if simbol == ""
                {
                    cekPersen = false;
                    first = "";
                    first += String(sender.tag);
                    lbResult.text = first;
                    btnClear.setTitle(" C", for: .normal);
                }
                else if simbol != "" && !cekResult
                {
                    cekPersen = false;
                    second = "";
                    second += String(sender.tag);
                    lbResult.text = second;
                    btnClear.setTitle(" C", for: .normal);
                }
                else if simbol != "" && cekResult
                {
                    cekPersen = false;
                    afterResult = "";
                    afterResult += String(sender.tag);
                    lbResult.text = afterResult;
                    btnClear.setTitle(" C", for: .normal);
                }
            }
        }
    }
    
    @IBAction func persen(_ sender: Any)
    {
        if simbol == ""
        {
            if let firstValue = Double(first) {
                cekPersen = true;
                first = String(firstValue / 100);
                lbResult.text = first;
                autoFont();
                btnClear.setTitle(" C", for: .normal);
            }
        }
        else if simbol != "" && !cekResult
        {
            if let secondValue = Double(second)
            {
                cekPersen = true;
                second = String(secondValue / 100);
                lbResult.text = second;
                autoFont();
                btnClear.setTitle(" C", for: .normal);
            }
        }
        else if simbol != "" && cekResult
        {
            if let afterResultValue = Double(afterResult) 
            {
                cekPersen = true;
                afterResult = String(afterResultValue / 100);
                lbResult.text = afterResult;
                autoFont();
                btnClear.setTitle(" C", for: .normal);
            }
        }
    }
    
    @IBAction func koma(_ sender: Any) {
        
    }
    
    @IBAction func clear(_ sender: Any) {
        if btnClear.titleLabel?.text == "AC"
        {
            first = "";
            second = "";
            simbol = "";
            result = "";
            cekResult = false;
            afterResult = "";
            lbResult.text = "0";
        }
        else
        {
            if simbol == ""
            {
                first = "";
                lbResult.text = "0";
                btnClear.setTitle("AC", for: .normal)
            }
            else if simbol != "" && !cekResult
            {
                second = "";
                lbResult.text = "0";
                btnClear.setTitle("AC", for: .normal)
            }
            else if simbol != "" && cekResult
            {
                afterResult = "";
                lbResult.text = "0";
                btnClear.setTitle("AC", for: .normal)
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        for button in calcButton{
            button.layer.cornerRadius = button.frame.size.height/2;
        }
    }
    
    func hitung() -> Double {
        if simbol == "+"
        {
            if !cekResult {
                cekResult = true;
                return Double(first)! + Double(second)!
            }
            else{
                return Double(result)! + Double(afterResult)!
            }
        }
        else if simbol == "-"
        {
            if !cekResult {
                cekResult = true;
                return Double(first)! - Double(second)!
            }
            else{
                return Double(result)! - Double(afterResult)!
            }
        }
        else if simbol == "*"
        {
            if !cekResult {
                cekResult = true;
                return Double(first)! * Double(second)!
            }
            else{
                return Double(result)! * Double(afterResult)!
            }
        }
        else if simbol == "/"
        {
            if !cekResult {
                cekResult = true;
                return Double(first)! / Double(second)!
            }
            else{
                return Double(result)! / Double(afterResult)!
            }
        }
        return 0;
    }
    
    func autoFont() {
        let textLength = lbResult.text?.count ?? 0
        
        if textLength >= 9
        {
            lbResult.font = UIFont.systemFont(ofSize: 50)
        }
        else if textLength > 7
        {
            lbResult.font = UIFont.systemFont(ofSize: 60)
        }
        else if textLength > 6
        {
            lbResult.font = UIFont.systemFont(ofSize: 70)
        }
        else
        {
            lbResult.font = UIFont.systemFont(ofSize: 80)
        }
    }
}

