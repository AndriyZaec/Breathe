//
//  Phase.swift
//  Breathe
//
//  Created by Andrew on 13.11.2019.
//  Copyright © 2019 Andrew Zaiets. All rights reserved.
//

import Foundation
import UIKit

struct Phase: Codable {
    let type: PhaseType
    let duration: Int
    let color: String
    
    var parsedColor: UIColor {
        return UIColor(hexString: color)
    }
}

enum PhaseType: String, Codable {
    case inhale
    case exhale
    case hold
}
