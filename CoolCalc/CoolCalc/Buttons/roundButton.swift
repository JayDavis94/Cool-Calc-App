//
//  roundButton.swift
//  CoolCalc
//
//  Created by JaDarius Davis on 6/17/23.
//

import UIKit

@IBDesignable

class roundButton: UIButton {

    override func prepareForInterfaceBuilder() {
        roundButtons()
        
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        roundButtons()
    }

    func roundButtons() {
        layer.cornerRadius = 40.0
    }
    
}
