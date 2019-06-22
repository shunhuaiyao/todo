//
//  UIButtonExtensions.swift
//  todo
//
//  Created by Yao Shun-Huai on 2019/6/22.
//  Copyright © 2019 Yao Shun-Huai. All rights reserved.
//

import UIKit

extension UIButton {

    func createShadowandBorder() {
        backgroundColor = UIColor.white
        layer.borderColor = UIColor.lightGray.cgColor
        layer.borderWidth = 0.35
        layer.cornerRadius = 5
        layer.shadowOpacity = 0.2
        layer.shadowRadius = 1
        layer.shadowOffset = CGSize(width: 0, height: 1)
    }
    
    func createDashedBorder(cornerRadius: CGFloat) {
        let shapeLayer:CAShapeLayer = CAShapeLayer()
        let frameSize = self.frame.size
        let shapeRect = CGRect(x: 0, y: 0, width: frameSize.width, height: frameSize.height)
        shapeLayer.bounds = shapeRect
        shapeLayer.position = CGPoint(x: frameSize.width/2, y: frameSize.height/2)
        shapeLayer.fillColor = UIColor.clear.cgColor
        shapeLayer.strokeColor = UIColor.lightGray.cgColor
        shapeLayer.lineWidth = 0.35
        shapeLayer.lineJoin = CAShapeLayerLineJoin.round
        shapeLayer.lineDashPattern = [4,2]
        shapeLayer.path = UIBezierPath(roundedRect: shapeRect, cornerRadius: cornerRadius).cgPath
        self.layer.addSublayer(shapeLayer)
    }
}
