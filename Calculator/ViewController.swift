//
//  ViewController.swift
//  Calculator
//
//  Created by LDC on 10/14/15.
//  Copyright © 2015 LDC. All rights reserved.
//

import UIKit

enum modes{
    case NOT_SET
    case ADDITION
    case SUBTRACTION
    case MULTIPLICATION
    case DIVISION
}

class ViewController: UIViewController {
    //initialisation
    var labelString:String = "0"
    var currentMode:modes = modes.NOT_SET
    var savedNum:Int = 0
    var lastButtonWasMode:Bool = false
    @IBOutlet weak var label: UILabel!
    
    //actions
    @IBAction func tapped0(sender: AnyObject) {tappedNumber(0)}
    @IBAction func tapped1(sender: AnyObject) {tappedNumber(1)}
    @IBAction func tapped2(sender: AnyObject) {tappedNumber(2)}
    @IBAction func tapped3(sender: AnyObject) {tappedNumber(3)}
    @IBAction func tapped4(sender: AnyObject) {tappedNumber(4)}
    @IBAction func tapped5(sender: AnyObject) {tappedNumber(5)}
    @IBAction func tapped6(sender: AnyObject) {tappedNumber(6)}
    @IBAction func tapped7(sender: AnyObject) {tappedNumber(7)}
    @IBAction func tapped8(sender: AnyObject) {tappedNumber(8)}
    @IBAction func tapped9(sender: AnyObject) {tappedNumber(9)}
    
    //operations
    @IBAction func tappedPlus(sender: AnyObject) {
        changeMode(modes.ADDITION)
    }
    @IBAction func tappedMinus(sender: AnyObject) {
        changeMode(modes.SUBTRACTION)
    }
    @IBAction func tappedMultiply(sender: AnyObject) {
        changeMode(modes.MULTIPLICATION)
    }
    @IBAction func tappedDivide(sender: AnyObject) {
        changeMode(modes.DIVISION)
    }
    @IBAction func tappedEqual(sender: AnyObject) {
        //handling improper input
        guard let num:Int = Int(labelString) else {
            return
        }
        if currentMode == modes.NOT_SET || lastButtonWasMode {
            return
        }
        //handling opertions
        if currentMode == modes.ADDITION {
            savedNum += num
        } else if currentMode == modes.SUBTRACTION {
            savedNum -= num
        } else if currentMode == modes.MULTIPLICATION {
            savedNum *= num
        } else if currentMode == modes.DIVISION {
            if num == 0 {
                label.text = "输入非法"
                return
            }
            savedNum /= num
        }
        currentMode = modes.NOT_SET
        labelString = "\(savedNum)"
        updateText()
        lastButtonWasMode = true
    }
    @IBAction func tappedClear(sender: AnyObject) {
        savedNum = 0
        labelString = "0"
        label.text = "0"
        lastButtonWasMode = false
        currentMode = modes.NOT_SET
    }
    func tappedNumber(num:Int) {
        if lastButtonWasMode {
            lastButtonWasMode = false
            labelString = "0"
        }
        labelString = labelString.stringByAppendingString("\(num)")
        updateText()
    }
    func updateText() {
        guard let labelInt:Int = Int(labelString) else {
            label.text = "转换失败"
            return
        }
        if currentMode == modes.NOT_SET {
            savedNum = labelInt
        }
        label.text = "\(labelInt)"
    }
    func changeMode(newMode:modes) {
        if savedNum == 0 {
            return
        }
        currentMode = newMode
        lastButtonWasMode = true
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

