//
//  ViewController.swift
//  Calculator
//
//  Created by 橋本智樹 on 2020/12/08.
//  Copyright © 2020 hasimoto　tomoki. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    var previousNumber: Double = 0 //最初に入力した数字
    var operation: Int = 0 //演算子
    var numberOnScreen: Double = 0 //演算子のあとに入力する数字
    var performingMath: Bool = false //演算に進んで良いのかの判断値
   
    
    
    

    @IBOutlet weak var label: UILabel!
    
    //⑥　⑤で演算がtrueだった時に処理される
    //数字がクリックされた時動く場所
    @IBAction func numbers(_ sender: UIButton) {
        if performingMath == true { //演算がtrueの場合
        label.text = String(sender.tag-1) //labelに数字が代入
        numberOnScreen = Double(label.text!)!
        performingMath = false
        }
        else{
             label.text = label.text! + String(sender.tag-1)//①数字入力
             numberOnScreen = Double(label.text!)!
            
        }
        
        
    }
    //②数字が入力されているかの有無
    @IBAction func buttons(_ sender: UIButton) {
        //入力なし、AC、＝ではなくpreviousNumberに数字が渡されているかどうか
        if label.text != "" && sender.tag != 11 && sender.tag != 16{
            previousNumber = Double(label.text!)!
            
            //③演算子の選択
            if sender.tag == 12{
                label.text = "÷"
            }
            else if sender.tag == 13 {
                label.text = "×"
            }
            else if sender.tag == 14 {
                label.text = "-"
            }
            else if sender.tag == 15{
                label.text = "+"
            }
            operation = sender.tag // ④演算子が選択され計算ができるかの判断true
            performingMath = true
           
        }
        else if sender.tag == 16 // =が押されたときの処理
        {
            if operation == 12{
                label.text = String(previousNumber / numberOnScreen)
            }
            else if operation == 13{
                label.text = String(previousNumber * numberOnScreen)
            }
            else if operation == 14{
                label.text = String(previousNumber - numberOnScreen)
            }
            else if operation == 15{
                label.text = String(previousNumber + numberOnScreen)
            }
        }
        
        else if sender.tag == 11 //ACが押された時の処理
        {
            label.text=""
            numberOnScreen = 0
            previousNumber = 0
            operation = 0
            
        }
        
        
        
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }


}


//17 プロパティがなんで最初からfalseなのか
//31 なんでpreviousNumber = falseなのか
//42 Double(label.text!)! ()外の！の意味
//55 performingMathのあとイコール　== ではないのか

