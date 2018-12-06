//
//  ViewController.swift
//  TestIbm
//
//  Created by Артем on 12/2/18.
//  Copyright © 2018 Артем. All rights reserved.
//

import UIKit




class ViewController: UIViewController {
    @IBOutlet weak var etWeight: UITextField!
    @IBOutlet weak var height: UITextField!
    @IBOutlet weak var result: UILabel!
    @IBOutlet weak var buttonResult: UIButton!

    
    
    
    
    
    override func viewDidLoad() {
       // super.viewDidLoad() --> можно не использовать
        etWeight.keyboardType = .decimalPad
        etWeight.placeholder = "50.00"
        height.keyboardType = .decimalPad
        result.numberOfLines = 2
        result.isHidden = true
        buttonResult.backgroundColor = UIColor.green //желательно писать в сториборд
       
    }
    
    
    
    
    @IBAction func generateIbm(_ sender: UIButton) { //расчеты надо переместить в отдельный класс
        sender.pulsate()
        let weight = Double(self.etWeight.text ?? "0") ?? 0.0
        let height = Double(self.height.text ?? "0") ?? 0.0
        let ibm = (weight/(height/100.00*height/100.00))
        
        if result.isHidden {
            if weight == 0 || height == 0 {
            //константа для окна алерт
            let allertController = UIAlertController(title: "Error", message: "Корректно заполните все поля", preferredStyle: .alert)
            //константа для создания кнопки в окне алерт
            let action = UIAlertAction(title: "ok", style: .default) { (_) in } // <--?
           //вызываем окно алерт и в него добавляем кнопку
            allertController.addAction(action)
            //метод, который вызывает окно с алертом
            self.present(allertController, animated: true, completion: nil)
            self.etWeight.text! = ""
            self.height.text! = ""
                } else { 
            switch ibm {
        case 0..<16:
            self.result.text?.append("У Вас выраженный дефицит массы тела")
        case 16..<18.5:
            self.result.text?.append("Недостаточная (дефицит) масса тела")
        case 18.5..<24.99:
            self.result.text?.append("Норма")
        case 24.99..<30:
            self.result.text?.append("Избыточная масса тела (предожирение)")
        case 30..<35:
            self.result.text?.append("Ожирение")
        case 35..<40:
            self.result.text?.append("Ожирение резкое")
        case 40...:
            self.result.text?.append("Очень резкое ожирение")
        default:
            break
        }
            result.isHidden = false
            buttonResult.setTitle("сбросить", for: .normal)
            buttonResult.backgroundColor = UIColor.red
    }
        
        } else {
            buttonResult.backgroundColor = UIColor.green
            self.result.text? = ""
            result.isHidden = true
            self.etWeight.text = nil
            self.height.text = nil
            buttonResult.setTitle("Просчитать индекс массы тела", for: .normal)
        }
    }
    
}

