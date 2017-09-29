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
    
    @IBInspectable var cornerRadius: CGFloat = 0.0
    
    
    override func prepareForInterfaceBuilder() {
        self.layer.cornerRadius = cornerRadius
    }
    
    override func layoutSubviews() {
        self.layer.cornerRadius = cornerRadius
    }
    
}
