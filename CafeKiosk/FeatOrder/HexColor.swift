//
//  HexColor.swift
//  CafeKiosk
//
//  Created by s s on 9/17/25.
//

import Foundation
import UIKit

extension UIColor{

    convenience init(hex: Int, a: Int = 0xFF) {
        self.init(
            red: CGFloat((hex >> 16) & 0xFF) / 255.0,
            green: CGFloat((hex >> 8) & 0xFF) / 255.0,
            blue: CGFloat(hex & 0xFF) / 255.0,
            alpha: CGFloat(a) / 255.0
        )
    }
    
    
}
