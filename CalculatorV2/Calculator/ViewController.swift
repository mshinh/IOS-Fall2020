//
//  ViewController.swift
//  Calculator
//
//  Created by Muskan Shinh on 2020-09-27.
//  Copyright © 2020 Muskan Shinh. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    var equationList = [String]()
    
    @IBOutlet weak var equationTable: UITableView!
    
    private var calculator = Calculator_Brain()
    @IBOutlet weak var resultLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        resultLabel.text = " "
        // Do any additional setup after loading the view.
    }

    //TABLE FUNCTIONS
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return equationList.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell")
        
        cell?.textLabel?.text = equationList[indexPath.row]
        
        return cell!
    }

    
    func numberOfSections(in tableView: UITableView) -> Int {
        
        return 1
    }// Default is 1 if not implemented
    
    // CALCULATO FUNCTIONS
    @IBAction func digit_Pressed(_ sender: Any) {
        
        let digit = sender as! UIButton
        var temp: String
        temp = ""
        switch digit.currentTitle{
        case "1":
            temp = "1"
        case "2":
            temp = ("2")
        case "3":
            temp = ("3")
        case "4":
            temp = ("4")
        case "5":
            temp = ("5")
        case "6":
            temp = ("6")
        case "7":
            temp = ("7")
        case "8":
            temp = ("8")
        case "9":
            temp = ("9")
        case "0":
            temp = ("0")
        default:
            resultLabel.text = ("Wrong input")
        }
        resultLabel.text! += temp
        
    }
    
    @IBAction func operator_Pressed(_ sender: Any) {
        
        let op = sender as! UIButton
        var temp: Double
        temp = 0
       switch op.currentTitle{
        case "/":
            temp = calculator.calculate(op: "/")
        case "*":
            temp = calculator.calculate(op: "*")
        case "-":
            temp = calculator.calculate(op: "-")
        case "+":
            temp = calculator.calculate(op: "+")
        default:
            resultLabel.text = ("Wrong input")
        }
        resultLabel.text = String(temp)
        equationList.append(calculator.getEquation())
        equationTable.reloadData()
    }
    
    @IBAction func enter_Pressed(_ sender: Any) {
        
        let n = (resultLabel.text as! NSString).doubleValue
        calculator.pushItem(num: n)
        resultLabel.text = ""
    }
    
    @IBAction func clear_pressed(_ sender: Any) {
        //resultLabel.text = "Clear pressed"
        resultLabel.text = " "
    }
}
    
    



