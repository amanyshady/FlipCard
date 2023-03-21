//
//  Extenstions.swift
//  FlipCard Memorize
//
//  Created by Amany Shady on 21/03/2023.
//

import Foundation
import UIKit


extension UIButton {
    
    func roundedButn() {
        
        self.layer.cornerRadius = self.frame.height / 2
    }
}

extension UITextField {
    
    func warningBorder() {
        
        self.layer.borderWidth = 2
        self.layer.borderColor = UIColor.red.cgColor
    }
    
    func normalBorder() {
        
        self.layer.borderWidth = 0
    }
}
