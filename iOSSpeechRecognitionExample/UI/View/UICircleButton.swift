//
//  UICircleButton.swift
//  iOSSpeechRecognitionExample
//
//  Created by Luiz Fernando Salvaterra on 28/09/17.
//  Copyright © 2017 Luiz Fernando Salvaterra. All rights reserved.
//

import UIKit

@IBDesignable
class UICircleButton: UIButton {
    
    @IBInspectable var borderColor: UIColor = UIColor.clear
    
    override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        self.layer.cornerRadius = self.layer.bounds.width / 2
        self.layer.borderColor = borderColor.cgColor
        self.layer.borderWidth = 2.0
        self.imageView?.contentMode = .scaleAspectFit
        self.imageEdgeInsets = UIEdgeInsetsMake(12, 12, 12, 12)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.layer.cornerRadius = self.layer.bounds.width / 2
        self.layer.borderColor = borderColor.cgColor
        self.layer.borderWidth = 2.0
        self.imageView?.contentMode = .scaleAspectFit
        self.imageEdgeInsets = UIEdgeInsetsMake(12, 12, 12, 12)

    }
}
