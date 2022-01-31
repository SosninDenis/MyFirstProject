//
//  FriendPorfile.swift
//  ChatALittle
//
//  Created by Денис Соснин on 24.01.2022.
//

import UIKit

class LikeButton: UIView {
    
    public var checked: Bool = true
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        let path = getPath()
        let shapeLayer = CAShapeLayer()
        shapeLayer.path = path.cgPath
        shapeLayer.strokeColor = UIColor.red.cgColor
        
        if checked == true {
            shapeLayer.fillColor = UIColor.gray.cgColor
        } else {
            shapeLayer.fillColor = UIColor.red.cgColor
        }
        shapeLayer.lineWidth = 3
        layer.addSublayer(shapeLayer)
    }
    
    func getPath() ->UIBezierPath {
        let path = UIBezierPath()
        path.move(to: CGPoint(x: 5, y: 10))
        path.addLine(to: CGPoint(x: 10, y: 5))
        path.addLine(to: CGPoint(x: 15, y: 5))
        path.addLine(to: CGPoint(x: 20, y: 10))
        path.addLine(to: CGPoint(x: 25, y: 5))
        path.addLine(to: CGPoint(x: 30, y: 5))
        path.addLine(to: CGPoint(x: 35, y: 10))
        path.addLine(to: CGPoint(x: 35, y: 15))
        path.addLine(to: CGPoint(x: 20, y: 30))
        path.addLine(to: CGPoint(x: 5, y: 15))
        path.close()
        path.fill()
        path.stroke()
        return path
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
}











