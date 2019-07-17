//
//  BasePieChartView.swift
//  todo
//
//  Created by Yao Shun-Huai on 2019/7/17.
//  Copyright © 2019 Yao Shun-Huai. All rights reserved.
//

import Foundation
import Macaw
class BasePieChartView: MacawView {
    
    private var animations = [Animation]()
    private var animationGroup = Group()
    private let backgroundColors = [
        0.5,
        0.6,
        0.7
        ].map {
            Color.rgba(r: 0, g: 0, b: 0, a: $0)
    }
    private let r = [
        100.0,
        80.0,
        60.0
    ]
    private let extent = [
        2 * .pi,
        2.0,
        1.0
    ]
    private let gradientColors = [
        (top: 0xfc087e, bottom: 0xff6868),
        (top: 0x06dfed, bottom: 0x03aafe),
        (top: 0xffff5c, bottom: 0xffa170)
        ].map {
            LinearGradient(
                degree: 90,
                from: Color(val: $0.top),
                to: Color(val: $0.bottom)
            )
    }
    
    private func createScene() {
        let viewCenterX = Double(self.frame.width / 2)
        let viewCenterY = Double(self.frame.height / 2)
        
        let text = Text(
            text: "Daily",
            font: Font(name: "System", size: 17, weight: "light"),
            fill: Color(val: 0x4B4C4D),
            align: .mid
        )
        text.place = .move(dx: viewCenterX, dy: viewCenterY - text.bounds.size().h/2)
        
        let rootNode = Group(place: .move(dx: viewCenterX, dy: viewCenterY))
        let circle = Shape(
            form: Circle(cx: 0, cy: 0, r: 80),
            stroke: Stroke(fill: Color.rgba(r: 0, g: 0, b: 0, a: 0.5), width: 50)
        )
        rootNode.contents.append(circle)
        
        rootNode.contents.append(animationGroup)
        
        self.node = [text, rootNode].group()
//        self.backgroundColor = UIColor(cgColor: Color(val: 0x4a2e7d).toCG())
    }
    
    private func createArc(_ t: Double, _ i: Int) -> Shape {
        return Shape(
            form: Arc(
                ellipse: Ellipse(cx: 0, cy: 0, rx: 80, ry: 80),
                shift: -.pi/2,
                extent: self.extent[i] * t),
            stroke: Stroke(
                fill: gradientColors[i],
                width: 50,
                cap: .butt
            )
        )
    }
    
    private func createAnimations() {
        animations.removeAll()
        animations.append(
            animationGroup.contentsVar.animation({[unowned self] t in
                var shapes1: [Shape] = []
                for i in 0..<self.extent.count {
                    shapes1.append(self.createArc(t, i))
                }
                return  shapes1
            }, during: 1).easing(Easing.easeInOut)
        )
    }
    
    open func play() {
        createScene()
        createAnimations()
        animations.forEach {
            $0.play()
        }
    }
}
