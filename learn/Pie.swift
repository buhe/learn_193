//
//  Pie.swift
//  learn
//
//  Created by 顾艳华 on 2022/11/14.
//

import SwiftUI

struct Pie: Shape {
    var startAngle: Angle
    var endAngle: Angle
    func path(in rect: CGRect) -> Path {
        var p = Path()
        let cen = CGPoint(x: rect.midX, y: rect.midY)
        let ra = min(rect.width, rect.height) / 2
        
        p.move(to: cen)
        let start = CGPoint(x: cen.x + ra * CGFloat(cos(startAngle.radians)), y: cen.y + ra * CGFloat(sin(startAngle.radians)))
        
        p.addLine(to: start)
        
        p.addArc(center: cen, radius: ra, startAngle: startAngle, endAngle: endAngle, clockwise: true)
        
        p.addLine(to: cen)
        return p
    }
    
    
}
