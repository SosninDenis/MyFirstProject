//
//  GradientView.swift
//  ChatALittle
//
//  Created by Денис Соснин on 30.01.2022.
//

import UIKit

class GradientView: UIView {
    
    private let gradientLayer = CAGradientLayer()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        addGradient()
    }
    override func layoutSubviews() {
        super.layoutSubviews()
        gradientLayer.frame = bounds
    }
    
    private func addGradient() {
        //Создание градиента
        self.layer.addSublayer(gradientLayer)
        gradientLayer.colors = [UIColor.white.cgColor, UIColor.darkGray.cgColor]
        gradientLayer.locations = [0, 1]
        gradientLayer.startPoint = CGPoint.zero
        gradientLayer.endPoint = CGPoint(x: 0, y: 1)
        
    }
    
}
