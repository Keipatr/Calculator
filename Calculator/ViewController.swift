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
        cekKoma = false;
        cekMinus = false;
    }
    
    @IBAction func kali(_ sender: Any) {
        simbol = "*";
        cekKoma = false;
        cekMinus = false;
    }
    
    @IBAction func kurang(_ sender: Any) {
        simbol = "-";
        cekKoma = false;
        cekMinus = false;
    }
    
    @IBAction func tambah(_ sender: Any) {
        simbol = "+";
        cekKoma = false;
        cekMinus = false;
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
        autoFont();
    }
    
    @IBAction func btnNumber(_ sender: UIButton) {
        if String(sender.tag) == "0" && lbResult.text == "0"{
            
        }
        else{
            if !cekPersen {
                if simbol == ""
                {
                    if first.prefix(2) == "-0" && !cekKoma
                    {
                        first = "-"
                        first += String(sender.tag);
                    }
                    else if first.prefix(1) == "0" && !cekKoma
                    {
                        first = ""
                        first += String(sender.tag);
                    }
                    else
                    {
                        first += String(sender.tag);

                    }
                    lbResult.text = first;
                    btnClear.setTitle("C", for: .normal)
                }
                else if simbol != "" && !cekResult
                {
                    if second.prefix(2) == "-0" && !cekKoma
                    {
                        second = "-"
                        second += String(sender.tag);
                    }
                    else if second.prefix(1) == "0" && !cekKoma
                    {
                        second = ""
                        second += String(sender.tag);
                    }
                    else
                    {
                        second += String(sender.tag);

                    }
                    lbResult.text = second;
                    btnClear.setTitle("C", for: .normal)
                }
                else if simbol != "" && cekResult
                {
                    if afterResult.prefix(2) == "-0" && !cekKoma
                    {
                        afterResult = "-"
                        afterResult += String(sender.tag);
                    }
                    else if afterResult.prefix(1) == "0" && !cekKoma
                    {
                        afterResult = ""
                        afterResult += String(sender.tag);
                    }
                    else
                    {
                        afterResult += String(sender.tag);

                    }
                    lbResult.text = afterResult;
                    btnClear.setTitle("C", for: .normal)
                }
                autoFont();
            }
            else
            {
                if simbol == ""
                {
                    cekPersen = false;
                    first = "";
                    if first.prefix(2) == "-0" && !cekKoma
                    {
                        first = "-"
                        first += String(sender.tag);
                    }
                    else if first.prefix(1) == "0" && !cekKoma
                    {
                        first = ""
                        first += String(sender.tag);
                    }
                    else
                    {
                        first += String(sender.tag);

                    }
                    lbResult.text = first;
                    btnClear.setTitle("C", for: .normal);
                }
                else if simbol != "" && !cekResult
                {
                    cekPersen = false;
                    second = "";
                    if second.prefix(2) == "-0" && !cekKoma
                    {
                        second = "-"
                        second += String(sender.tag);
                    }
                    else if second.prefix(1) == "0" && !cekKoma
                    {
                        second = ""
                        second += String(sender.tag);
                    }
                    else
                    {
                        second += String(sender.tag);

                    }
                    lbResult.text = second;
                    btnClear.setTitle("C", for: .normal);
                }
                else if simbol != "" && cekResult
                {
                    cekPersen = false;
                    afterResult = "";
                    if afterResult.prefix(2) == "-0" && !cekKoma
                    {
                        afterResult = "-"
                        afterResult += String(sender.tag);
                    }
                    else if afterResult.prefix(1) == "0" && !cekKoma
                    {
                        afterResult = ""
                        afterResult += String(sender.tag);
                    }
                    else
                    {
                        afterResult += String(sender.tag);

                    }
                    lbResult.text = afterResult;
                    btnClear.setTitle("C", for: .normal);
                }
                autoFont();
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
                btnClear.setTitle("C", for: .normal);
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
                btnClear.setTitle("C", for: .normal);
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
                btnClear.setTitle("C", for: .normal);
            }
        }
    }
    
    @IBAction func plusminus(_ sender: Any) {
        if !cekMinus
        {
            if simbol == ""
            {
                cekMinus = true;
                if first == ""
                {
                    first = "-0";
                }
                else
                {
                    first = "-" + first;
                }
                lbResult.text = first;
                autoFont();
                btnClear.setTitle("C", for: .normal);
                
            }
            else if simbol != "" && !cekResult
            {
                if second == ""
                {
                    second = "-0";
                }
                else
                {
                    second = "-" + second;
                }
                cekMinus = true;
                lbResult.text = second;
                autoFont();
                btnClear.setTitle("C", for: .normal);
                
            }
            else if simbol != "" && cekResult
            {
                if afterResult == ""
                {
                    afterResult = "-0";
                }
                else
                {
                    afterResult = "-" + afterResult;
                }
                cekMinus = true;
                lbResult.text = afterResult;
                autoFont();
                btnClear.setTitle("C", for: .normal);
                
            }
        }
        else
        {
            if simbol == ""
            {
                cekMinus = false;
                first.removeFirst();
                lbResult.text = first;
                autoFont();
                btnClear.setTitle("C", for: .normal);
                
            }
            else if simbol != "" && !cekResult
            {
                cekMinus = false;
                second.removeFirst();
                lbResult.text = second;
                autoFont();
                btnClear.setTitle("C", for: .normal);
                
            }
            else if simbol != "" && cekResult
            {
                cekMinus = false;
                afterResult.removeFirst();
                lbResult.text = afterResult;
                autoFont();
                btnClear.setTitle("C", for: .normal);
                
            }
        }
    }
    
    @IBAction func koma(_ sender: Any) {
        if cekPersen
        {
            if simbol == ""
            {
                cekPersen = false;
                cekMinus = false;
                cekKoma = true;
                first = "0.";
                lbResult.text = first;
                autoFont();
                btnClear.setTitle("C", for: .normal);
                
            }
            else if simbol != "" && !cekResult
            {
                cekPersen = false;
                cekMinus = false;
                cekKoma = true;
                second = "0.";
                lbResult.text = second;
                autoFont();
                btnClear.setTitle("C", for: .normal);
                
            }
            else if simbol != "" && cekResult
            {
                cekPersen = false;
                cekMinus = false;
                cekKoma = true;
                afterResult = "0.";
                lbResult.text = afterResult;
                autoFont();
                btnClear.setTitle("C", for: .normal);
                
            }
        }
        if !cekKoma
        {
            if simbol == ""
            {
                cekKoma = true;
                if first == ""
                {
                    first += "0.";
                }
                else
                {
                    first += ".";
                }
                lbResult.text = first;
                autoFont();
                btnClear.setTitle("C", for: .normal);
                
            }
            else if simbol != "" && !cekResult
            {
                
                cekKoma = true;
                if second == ""
                {
                    second += "0.";
                }
                else
                {
                    second += ".";
                }
                lbResult.text = second;
                autoFont();
                btnClear.setTitle("C", for: .normal);
                
            }
            else if simbol != "" && cekResult
            {
                
                cekKoma = true;
                if afterResult == ""
                {
                    afterResult += "0.";
                }
                else
                {
                    afterResult += ".";
                }
                lbResult.text = afterResult;
                autoFont();
                btnClear.setTitle("C", for: .normal);
                
            }
        }
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
            cekPersen = false;
            cekKoma = false;
            cekMinus = false;
            lbResult.text = "0";
        }
        else
        {
            if simbol == ""
            {
                first = "";
                lbResult.text = "0";
                btnClear.setTitle("AC", for: .normal)
                cekPersen = false;
                cekKoma = false;
                cekMinus = false;
            }
            else if simbol != "" && !cekResult
            {
                second = "";
                lbResult.text = "0";
                btnClear.setTitle("AC", for: .normal)
                cekPersen = false;
                cekKoma = false;
                cekMinus = false;
            }
            else if simbol != "" && cekResult
            {
                afterResult = "";
                lbResult.text = "0";
                btnClear.setTitle("AC", for: .normal)
                cekPersen = false;
                cekKoma = false;
                cekMinus = false;
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        for button in calcButton {
            button.layer.cornerRadius = button.frame.size.height / 2
            
            button.addTarget(self, action: #selector(buttonTapped(_:)), for: .touchUpInside)
        }

        

    }
    
    @objc func buttonTapped(_ sender: UIButton) {
        flashButton(sender);
        print("Button tapped: \(sender.titleLabel?.text ?? "No title")");
    }
    func flashButton(_ button: UIButton) {
        let originalBackgroundColor = button.backgroundColor
        UIView.animate(withDuration: 0.1, animations: {
            button.backgroundColor = UIColor.white
        }) { _ in
            UIView.animate(withDuration: 0.1) {
                button.backgroundColor = originalBackgroundColor
            }
        }
    }
    
    func hitung() -> Double {
        if simbol != "" && first == "" && second == "" && afterResult == ""
        {
            return 0
        }
        if simbol == "+"
        {
            if !cekResult {
                cekResult = true;
                if second == ""
                {
                    btnClear.setTitle("C", for: .normal);
                    return Double(first)! + Double(first)!
                }
                else if first == ""
                {
                    btnClear.setTitle("C", for: .normal);
                    return Double(second)! + Double(second)!
                }
                else
                {
                    return Double(first)! + Double(second)!
                }
                
            }
            else{
                if afterResult == ""
                {
                    if first == ""
                    {
                        btnClear.setTitle("C", for: .normal);
                        return Double(result)! + Double(second)!
                    }
                    else if second == ""
                    {
                        btnClear.setTitle("C", for: .normal);
                        return Double(result)! + Double(first)!
                    }
                    else
                    {
                        btnClear.setTitle("C", for: .normal);
                        return Double(result)! + Double(second)!
                    }
                }
                else
                {
                    return Double(result)! + Double(afterResult)!
                }
            }
        }
        else if simbol == "-"
        {
            if !cekResult {
                cekResult = true;
                if second == ""
                {
                    btnClear.setTitle("C", for: .normal);
                    return Double(first)! - Double(first)!
                }
                else if first == ""
                {
                    btnClear.setTitle("C", for: .normal);
                    return Double(second)! - Double(second)!
                }
                else
                {
                    return Double(first)! - Double(second)!
                }
                
            }
            else{
                if afterResult == ""
                {
                    if first == ""
                    {
                        btnClear.setTitle("C", for: .normal);
                        return Double(result)! - Double(second)!
                    }
                    else if second == ""
                    {
                        btnClear.setTitle("C", for: .normal);
                        return Double(result)! - Double(first)!
                    }
                    else
                    {
                        btnClear.setTitle("C", for: .normal);
                        return Double(result)! - Double(second)!
                    }
                }
                else
                {
                    return Double(result)! - Double(afterResult)!
                }
            }
        }
        else if simbol == "*"
        {
            if !cekResult {
                cekResult = true;
                if second == ""
                {
                    btnClear.setTitle("C", for: .normal);
                    return Double(first)! * Double(first)!
                }
                else if first == ""
                {
                    btnClear.setTitle("C", for: .normal);
                    return Double(second)! * Double(second)!
                }
                else
                {
                    return Double(first)! * Double(second)!
                }
                
            }
            else{
                if afterResult == ""
                {
                    if first == ""
                    {
                        btnClear.setTitle("C", for: .normal);
                        return Double(result)! * Double(second)!
                    }
                    else if second == ""
                    {
                        btnClear.setTitle("C", for: .normal);
                        return Double(result)! * Double(first)!
                    }
                    else
                    {
                        btnClear.setTitle("C", for: .normal);
                        return Double(result)! * Double(second)!
                    }
                }
                else
                {
                    return Double(result)! * Double(afterResult)!
                }
            }
        }
        else if simbol == "/"
        {
            if !cekResult {
                cekResult = true;
                if second == ""
                {
                    btnClear.setTitle("C", for: .normal);
                    return Double(first)! / Double(first)!
                }
                else if first == ""
                {
                    btnClear.setTitle("C", for: .normal);
                    return Double(second)! / Double(second)!
                }
                else
                {
                    return Double(first)! / Double(second)!
                }
                
            }
            else{
                if afterResult == ""
                {
                    if first == ""
                    {
                        btnClear.setTitle("C", for: .normal);
                        return Double(result)! / Double(second)!
                    }
                    else if second == ""
                    {
                        btnClear.setTitle("C", for: .normal);
                        return Double(result)! / Double(first)!
                    }
                    else
                    {
                        btnClear.setTitle("C", for: .normal);
                        return Double(result)! / Double(second)!
                    }
                }
                else
                {
                    return Double(result)! / Double(afterResult)!
                }
            }
        }
        else if simbol == "" && first != ""
        {
            return Double(first)!
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
