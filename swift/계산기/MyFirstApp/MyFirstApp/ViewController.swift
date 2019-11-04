//
//  ViewController.swift
//  MyFirstApp
//
//  Created by 윤찬우 on 2019/10/28.
//  Copyright © 2019 윤찬우. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var preOperand: String! = nil
    var postOperand: Double! = 0
    var midOperator: String! = nil
    var result: Double! = 0
    var realFlag: Bool! = true
    @IBOutlet weak var viewResult: UITextField!
    
    func AppendString(_ num: String!){
        if preOperand == nil{
            preOperand = num
        }
        else{
            self.preOperand = self.preOperand + num
        }
        viewResult.textColor = UIColor.white
        viewResult.text! = preOperand
    }
    
    func Calculator(_ cal: String!){//계산한후 postOper로 보낸다.
        let tp: Double! = Double(preOperand)
        switch cal{
        case "/":
            midOperator = "/"
            self.postOperand = self.postOperand / tp
            self.preOperand = nil
            self.realFlag = true
            viewResult.text! = String(postOperand)
        case "*":
            midOperator = "*"
            self.postOperand = self.postOperand * tp
            self.preOperand = nil
            self.realFlag = true
            viewResult.text! = String(postOperand)
        case "-":
            midOperator = "-"
            self.postOperand = self.postOperand - tp
            self.preOperand = nil
            self.realFlag = true
            viewResult.text! = String(postOperand)
        case "+":
            midOperator = "+"
            self.postOperand = self.postOperand + tp
            self.preOperand = nil
            self.realFlag = true
            viewResult.text! = String(postOperand)
        case "=":
            self.Calculator(self.midOperator)
            viewResult.text! = String(postOperand)
        case "+-":
            self.preOperand = String(-tp)
            viewResult.text! = preOperand
        case "%":
            self.preOperand = "1879"
        default:
            self.postOperand = tp
        }//전체적으로 preOperand nil로 초기화해야함


    }
    
    @IBAction func B1(_ sender: UIButton) {
        AppendString(sender.currentTitle);
    }
    
    @IBAction func BReset(_ sender: Any) {
        self.preOperand = nil
        self.midOperator = nil
        self.postOperand = 0
    }
    
    @IBAction func BReal(_ sender: Any) {
        if self.realFlag == true  {
            if self.preOperand == nil{
                AppendString("0")
            }
            AppendString(".")
            self.realFlag = false
        }
    }
    
    @IBAction func BConvert(_ sender: Any) {
        Calculator("+-")
    }
    
    @IBAction func BDvide(_ sender: Any) {
        Calculator("/")
    }
    
    @IBAction func BProduction(_ sender: Any) {
        Calculator("*")
    }
    
    @IBAction func BMinus(_ sender: Any) {
        Calculator("-")
    }
    
    @IBAction func BAdd(_ sender: Any) {
        Calculator("+")
    }
    
    @IBAction func BResult(_ sender: Any) {
        Calculator("=")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    
    
    
    
    

}

