

import Foundation
import UIKit

class TupButton: ViewController {
    
    func tup(sender: UIButton) {
        
    let weight = Double(etWeight.text ?? "0") ?? 0.0
    let height = Double(etHeight.text ?? "0") ?? 0.0
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
    self.etHeight.text! = ""
        
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
    self.etHeight.text = nil
    buttonResult.setTitle("Просчитать индекс массы тела", for: .normal)
    }
    }
}
