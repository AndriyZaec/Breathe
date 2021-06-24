//
//  MainViewController.swift
//  Breathe
//
//  Created by Andrew on 13.11.2019.
//  Copyright © 2019 Andrew Zaiets. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {
    
    @IBOutlet private weak var breatheView: BreatheView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let dataPath = Bundle.main.path(forResource: "Data", ofType: "json")
        
        let url = URL(fileURLWithPath: dataPath!)
        
        let jsonData = try! Data(contentsOf: url)
        
        let phases = try! JSONDecoder().decode([Phase].self, from: jsonData)
        
        breatheView.config(with: phases)
    }


}

