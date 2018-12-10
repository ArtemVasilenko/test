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
    @IBOutlet weak var etHeight: UITextField!
    @IBOutlet weak var result: UILabel!
    @IBOutlet weak var buttonResult: UIButton!

    
    override func viewDidLoad() {
       // super.viewDidLoad() --> можно не использовать
        etWeight.keyboardType = .decimalPad
        etWeight.keyboardAppearance = .dark
        etWeight.placeholder = "50.00"
        etHeight.keyboardType = .decimalPad
        result.numberOfLines = 2
        result.isHidden = true
        buttonResult.backgroundColor = UIColor.green //желательно писать в сториборд
       
    }
    
    @IBAction func generateIbm(_ sender: UIButton) { //расчеты надо переместить в отдельный класс
        sender.pulsate()
        var tupB = TupButton()
        tupB.tup(sender: sender)
    }
}

