//
//  FriendPorfile.swift
//  ChatALittle
//
//  Created by Денис Соснин on 24.01.2022.
//

import UIKit



class LikeButton: UIControl {

    
    let imageView = UIView (frame: CGRect(x: 0, y: 0, width: 40, height: 35))
    
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        imageView.layer.borderWidth = 2
        imageView.layer.borderColor = UIColor.red.cgColor
        let maskLayer = CAShapeLayer()
        let likePath = UIBezierPath()
        likePath.move(to: CGPoint(x: 5, y: 10))
        likePath.addLine(to: CGPoint(x: 10, y: 5))
        likePath.addLine(to: CGPoint(x: 15, y: 5))
        likePath.addLine(to: CGPoint(x: 20, y: 10))
        likePath.addLine(to: CGPoint(x: 25, y: 5))
        likePath.addLine(to: CGPoint(x: 30, y: 5))
        likePath.addLine(to: CGPoint(x: 35, y: 10))
        likePath.addLine(to: CGPoint(x: 35, y: 15))
        likePath.addLine(to: CGPoint(x: 20, y: 30))
        likePath.addLine(to: CGPoint(x: 5, y: 15))
        likePath.close()
        likePath.stroke()
        maskLayer.fillColor = UIColor.red.cgColor
        maskLayer.path = likePath.cgPath
        imageView.layer.mask = maskLayer
    }
    
      
      public var checked: Bool = false {
        didSet {
            if checked == true {
                imageView.backgroundColor = .red
            } else {
                imageView.backgroundColor = .clear
            }
        }
      }
      
      override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
      }
      
      required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
      }
      
      private func setup() {
        addTarget(self, action: #selector(touchUpInside), for: .touchUpInside)
      }
    
      @objc func touchUpInside() {
        checked = !checked
        sendActions(for: .valueChanged)
      }
    
    
    
    
    
    
    
    

}

    
    
    
    
    
    
    

  

