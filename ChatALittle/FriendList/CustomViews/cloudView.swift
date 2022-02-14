//
//  cloudView.swift
//  ChatALittle
//
//  Created by Денис Соснин on 13.02.2022.
//

import UIKit

class cloudView: UIView {

    override func draw(_ rect: CGRect) {
        super.draw(rect)
        
        let cloudPath = getPath()
        let cloudShapeLayer = CAShapeLayer()
        cloudShapeLayer.path = cloudPath.cgPath
        cloudShapeLayer.strokeColor = UIColor.systemTeal.cgColor
        cloudShapeLayer.lineWidth = 7
        layer.addSublayer(cloudShapeLayer)

        let path = getPath()
        let shapeLayer = CAShapeLayer()
        shapeLayer.path = path.cgPath
        shapeLayer.strokeColor = UIColor.blue.cgColor
        shapeLayer.lineWidth = 7
        layer.addSublayer(shapeLayer)
        // анимация
        let strokeStartAnimation = CABasicAnimation(keyPath: "strokeStart")
        strokeStartAnimation.fromValue = 0
        strokeStartAnimation.toValue = 1
        let strokeEndAnimation = CABasicAnimation(keyPath: "strokeEnd")
        strokeEndAnimation.fromValue = 0
        strokeEndAnimation.toValue = 1.2
        let animationGroup = CAAnimationGroup()
        animationGroup.duration = 5
        animationGroup.animations = [strokeStartAnimation, strokeEndAnimation]
        shapeLayer.add(animationGroup, forKey: nil)
        
        
    }

    func getPath() ->UIBezierPath {
        let path = UIBezierPath()
        path.move(to: CGPoint(x: 20, y: 50))
        path.addCurve(to: CGPoint(x: 40, y: 25), controlPoint1: CGPoint(x: 5, y: 40), controlPoint2: CGPoint(x: 40, y: 10))
        path.addCurve(to: CGPoint(x: 70, y: 25), controlPoint1: CGPoint(x: 60, y: 5), controlPoint2: CGPoint(x: 70, y: 10))
        path.addCurve(to: CGPoint(x: 75, y: 60), controlPoint1: CGPoint(x: 95, y: 40), controlPoint2: CGPoint(x: 95, y: 50))
        path.addCurve(to: CGPoint(x: 50, y: 80), controlPoint1: CGPoint(x: 70, y: 90), controlPoint2: CGPoint(x: 60, y: 95))
        path.addCurve(to: CGPoint(x: 20, y: 50), controlPoint1: CGPoint(x: 40, y: 95), controlPoint2: CGPoint(x: 10, y: 70))
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
