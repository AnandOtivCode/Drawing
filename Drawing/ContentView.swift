//
//  ContentView.swift
//  Drawing
//
//  Created by Anand Otiv on 2025-04-12.
//

import SwiftUI

struct ContentView: View {
    struct Triangle: Shape {
        func path(in rect: CGRect) -> Path {
            var path = Path()

            path.move(to: CGPoint(x: rect.midX, y: rect.minY))
            path.addLine(to: CGPoint(x: rect.minX, y: rect.maxY))
            path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY))
            path.addLine(to: CGPoint(x: rect.midX, y: rect.minY))

            return path
        }
    }
    
    struct Arc: InsettableShape {
        var startAngle: Angle
        var endAngle: Angle
        var clockwise: Bool
        var insetAmount = 0.0

        
        

        func path(in rect: CGRect) -> Path {
            let rotationAdjustment = Angle.degrees(90)
                let modifiedStart = startAngle - rotationAdjustment
                let modifiedEnd = endAngle - rotationAdjustment
            var path = Path()
//            path.addArc(center: CGPoint(x: rect.midX, y: rect.midY), radius: rect.width / 2, startAngle: startAngle, endAngle: endAngle, clockwise: clockwise)
//            path.addArc(center: CGPoint(x: rect.midX, y: rect.midY), radius: rect.width / 2, startAngle: modifiedStart, endAngle: modifiedEnd, clockwise: !clockwise)
            path.addArc(center: CGPoint(x: rect.midX, y: rect.midY), radius: rect.width / 2 - insetAmount, startAngle: modifiedStart, endAngle: modifiedEnd, clockwise: !clockwise)


            return path
        }
        func inset(by amount: CGFloat) -> some InsettableShape {
            var arc = self
            arc.insetAmount += amount
            return arc
        }
        
    }
    
    
        var body: some View {
//            Circle()
////                .stroke(.blue, lineWidth: 40)
//                .strokeBorder(.blue, lineWidth: 40)
            
            Arc(startAngle: .degrees(-90), endAngle: .degrees(90), clockwise: true)
                .strokeBorder(.blue, lineWidth: 40)
            
        }
    
    
    
    
    
    
    
    
    

//    var body: some View {
////        Triangle()
//////            .fill(.red)
//////            .frame(width: 300, height: 300)
////            .stroke(.red, style: StrokeStyle(lineWidth: 10, lineCap: .round, lineJoin: .round))
////                .frame(width: 300, height: 300)
//        
//        Arc(startAngle: .degrees(0), endAngle: .degrees(110), clockwise: true)
//            .stroke(.blue, lineWidth: 10)
//            .frame(width: 300, height: 300)
//        
//
//
//
//
//    }
    
    
    
//    var body: some View {
//        Path { path in
//            path.move(to: CGPoint(x: 200, y: 100))
//            path.addLine(to: CGPoint(x: 100, y: 300))
//            path.addLine(to: CGPoint(x: 300, y: 300))
//            path.addLine(to: CGPoint(x: 200, y: 100))
//            path.closeSubpath()
//
//        }
//        //.fill(.blue)
//        //.stroke(.blue, lineWidth: 10)
//        .stroke(.blue, style: StrokeStyle(lineWidth: 10, lineCap: .round, lineJoin: .round))
//
//
//
//    }
}

#Preview {
    ContentView()
}
