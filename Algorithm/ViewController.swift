//
//  ViewController.swift
//  Algorithm
//
//  Created by li.min on 2016/10/26.
//  Copyright © 2016年 li.min. All rights reserved.
//

import UIKit

enum ArrayEvent:Int{
    case Bubble
    case Revert

}

class ViewController: UIViewController,UITextFieldDelegate {

    @IBOutlet weak var number1: UITextField!
    
    @IBOutlet weak var number2: UITextField!
    
    
    @IBOutlet weak var number3: UITextField!
    
    
    @IBOutlet weak var number4: UITextField!
    
    @IBOutlet weak var number5: UITextField!
    
    @IBOutlet weak var number6: UITextField!
    
    
    @IBOutlet weak var resultLabel: UILabel!
    
    @IBOutlet weak var bubbleBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.bubbleBtn.isEnabled = false
        
        number1.delegate = self
        number1.addTarget(self, action: #selector(ViewController.number1Action), for: .editingChanged)
        
        number2.delegate = self
        number2.isEnabled = false
        number2.addTarget(self, action: #selector(ViewController.number2Action), for: .editingChanged)
        
        number3.delegate = self
        number3.isEnabled = false
        number3.addTarget(self, action: #selector(ViewController.number3Action), for: .editingChanged)
        
        number4.delegate = self
        number4.isEnabled = false
        number4.addTarget(self, action: #selector(ViewController.number4Action), for: .editingChanged)
        
        number5.delegate = self
        number5.isEnabled = false
        number5.addTarget(self, action: #selector(ViewController.number5Action), for: .editingChanged)
        
        number6.delegate = self
        number6.isEnabled = false
        number6.addTarget(self, action: #selector(ViewController.number6Action), for: .editingChanged)
    }

    func number1Action(){
        number2.isEnabled = true
        number2.becomeFirstResponder()
    }
    
    func number2Action(){
        number3.isEnabled = true
        number3.becomeFirstResponder()
    }
    
    func number3Action(){
        number4.isEnabled = true
        number4.becomeFirstResponder()
    }
    
    func number4Action(){
        number5.isEnabled = true
        number5.becomeFirstResponder()
    }
    
    func number5Action(){
        number6.isEnabled = true
        number6.becomeFirstResponder()
    }
    
    func number6Action(){
        number6.endEditing(true)
        bubbleBtn.isEnabled = true
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
    @IBAction func bubbleClick(_ sender: AnyObject) {
       arrayAction(event: ArrayEvent.Bubble)
    
    }
    
    @IBAction func revert(_ sender: AnyObject) {
       arrayAction(event: ArrayEvent.Revert)
    }
    
    func getArray()->[Int]{
        var targetArray = [Int]()
        targetArray.append(Int(number1.text!)!)
        targetArray.append(Int(number2.text!)!)
        targetArray.append(Int(number3.text!)!)
        targetArray.append(Int(number4.text!)!)
        targetArray.append(Int(number5.text!)!)
        targetArray.append(Int(number6.text!)!)
        return targetArray
    }
    
    func arrayAction(event:ArrayEvent){
        let targetArray = getArray()
        var eventArray = [Int]()
        switch event {
        case .Bubble:
            eventArray = targetArray.Bubble()
        case .Revert:
            eventArray = targetArray.revert()
        }
        let resultArray = eventArray.map { (element) -> String in
            return "\(element)❤️"
        }
        let resultString = resultArray.reduce("") { (result, element) -> String in
            return  result + element
        }
        self.resultLabel.text = resultString
    }
    
    @IBAction func returnAgain(_ sender: AnyObject) {
        bubbleBtn.isEnabled = false
        number1.text = ""
        number2.text = ""
        number2.isEnabled = false
        number3.text = ""
        number3.isEnabled = false
        number4.text = ""
        number4.isEnabled = false
        number5.text = ""
        number5.isEnabled = false
        number6.text = ""
        number6.isEnabled = false
        self.resultLabel.text = "0❤️0❤️0❤️0❤️0❤️0❤️"
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

