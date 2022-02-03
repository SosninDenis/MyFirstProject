//
//  CustomTittleView.swift
//  ChatALittle
//
//  Created by Денис Соснин on 03.02.2022.
//

import UIKit

class CustomTittleView: UIView {
    
    private let titleLabel = UILabel()
    private let backView = UIView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        addSubview(backView)
        addSubview(titleLabel)
        backView.backgroundColor = UIColor(white: 0, alpha: 0.5)
        backView.frame = CGRect(x: 0, y: 0, width: 100, height: 20)
        backView.frame = self.bounds
        backView.backgroundColor = .gray
        backView.layer.opacity = 0.5
        
        titleLabel.frame = CGRect(x: 0, y: 0, width: 100, height: 20)
        titleLabel.font = .boldSystemFont(ofSize: 18)
        titleLabel.textColor = .black
        
    }
    
    func setText(_ text:String) {
        titleLabel.text = text
    }
}
