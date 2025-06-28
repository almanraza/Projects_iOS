//
//  ResultViewController.swift
//  Tipsy
//
//  Created by Syed Farhan on 27/06/2025.
//  Copyright © 2025 The App Brewery. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController {
    
    var result = "0.0"
    var tip = 0
    var split = 2
    @IBOutlet weak var settingsLabel: UILabel!
    
    @IBOutlet weak var totalLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        totalLabel.text = result
        settingsLabel.text = "Split Between \(split) people, with \(tip) %tip"

    }
    
    @IBAction func recalculatePressed(_ sender: Any) {

        self.dismiss(animated: true, completion: nil)
        
    }
    
    

}
