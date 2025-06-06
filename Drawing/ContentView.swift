//
//  ContentView.swift
//  Drawing
//
//  Created by Anand Otiv on 2025-04-12.
//

import SwiftUI



struct Flower: Shape {
    // How much to move this petal away from the center
    var petalOffset: Double = -20.0

    // How wide to make each petal
    var petalWidth: Double = 100.0

    func path(in rect: CGRect) -> Path {
        // The path that will hold all petals
        var path = Path()

        // Count from 0 up to pi * 2, moving up pi / 8 each time
        for number in stride(from: 0, to: Double.pi * 2, by: Double.pi / 8) {
            // rotate the petal by the current value of our loop
            let rotation = CGAffineTransform(rotationAngle: number)

            // move the petal to be at the center of our view
            let position = rotation.concatenating(CGAffineTransform(translationX: rect.width / 2, y: rect.height / 2))

            // create a path for this petal using our properties plus a fixed Y and height
            let originalPetal = Path(ellipseIn: CGRect(x: petalOffset, y: 0, width: petalWidth, height: rect.width / 2))

            // apply our rotation/position transformation to the petal
            let rotatedPetal = originalPetal.applying(position)

            // add it to our main path
            path.addPath(rotatedPetal)
        }

        // now send the main path back
        return path
    }
}

struct ContentView: View {
    
    @State private var petalOffset = -20.0
    @State private var petalWidth = 100.0

    
    var body: some View {
        VStack {
            Flower(petalOffset: petalOffset, petalWidth: petalWidth)
                //.stroke(.red, lineWidth: 1)
                //.fill(.red)
                .fill(.red, style: FillStyle(eoFill: true))

            Text("Offset")
            Slider(value: $petalOffset, in: -40...40)
                .padding([.horizontal, .bottom])

            Text("Width")
            Slider(value: $petalWidth, in: 0...100)
                .padding(.horizontal)
        }
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
//    struct Triangle: Shape {
//        func path(in rect: CGRect) -> Path {
//            var path = Path()
//
//            path.move(to: CGPoint(x: rect.midX, y: rect.minY))
//            path.addLine(to: CGPoint(x: rect.minX, y: rect.maxY))
//            path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY))
//            path.addLine(to: CGPoint(x: rect.midX, y: rect.minY))
//
//            return path
//        }
//    }
//    
//    struct Arc: InsettableShape {
//        var startAngle: Angle
//        var endAngle: Angle
//        var clockwise: Bool
//        var insetAmount = 0.0
//
//        
//        
//
//        func path(in rect: CGRect) -> Path {
//            let rotationAdjustment = Angle.degrees(90)
//                let modifiedStart = startAngle - rotationAdjustment
//                let modifiedEnd = endAngle - rotationAdjustment
//            var path = Path()
////            path.addArc(center: CGPoint(x: rect.midX, y: rect.midY), radius: rect.width / 2, startAngle: startAngle, endAngle: endAngle, clockwise: clockwise)
////            path.addArc(center: CGPoint(x: rect.midX, y: rect.midY), radius: rect.width / 2, startAngle: modifiedStart, endAngle: modifiedEnd, clockwise: !clockwise)
//            path.addArc(center: CGPoint(x: rect.midX, y: rect.midY), radius: rect.width / 2 - insetAmount, startAngle: modifiedStart, endAngle: modifiedEnd, clockwise: !clockwise)
//
//
//            return path
//        }
//        func inset(by amount: CGFloat) -> some InsettableShape {
//            var arc = self
//            arc.insetAmount += amount
//            return arc
//        }
//        
//    }
//    
//    
//        var body: some View {
////            Circle()
//////                .stroke(.blue, lineWidth: 40)
////                .strokeBorder(.blue, lineWidth: 40)
//            
//            Arc(startAngle: .degrees(-90), endAngle: .degrees(90), clockwise: true)
//                .strokeBorder(.blue, lineWidth: 40)
//            
//        }
//    
//    
//    
//    
//    
//    
//    
//    
//    
//
////    var body: some View {
//////        Triangle()
////////            .fill(.red)
////////            .frame(width: 300, height: 300)
//////            .stroke(.red, style: StrokeStyle(lineWidth: 10, lineCap: .round, lineJoin: .round))
//////                .frame(width: 300, height: 300)
////        
////        Arc(startAngle: .degrees(0), endAngle: .degrees(110), clockwise: true)
////            .stroke(.blue, lineWidth: 10)
////            .frame(width: 300, height: 300)
////        
////
////
////
////
////    }
//    
//    
//    
////    var body: some View {
////        Path { path in
////            path.move(to: CGPoint(x: 200, y: 100))
////            path.addLine(to: CGPoint(x: 100, y: 300))
////            path.addLine(to: CGPoint(x: 300, y: 300))
////            path.addLine(to: CGPoint(x: 200, y: 100))
////            path.closeSubpath()
////
////        }
////        //.fill(.blue)
////        //.stroke(.blue, lineWidth: 10)
////        .stroke(.blue, style: StrokeStyle(lineWidth: 10, lineCap: .round, lineJoin: .round))
////
////
////
////    }
}

#Preview {
    ContentView()
}
