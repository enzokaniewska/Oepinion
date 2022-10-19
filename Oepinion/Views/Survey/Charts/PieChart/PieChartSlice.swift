//
//  PieChartSlice.swift
//  Oepinion
//
//  Created by Enzo Kaniewska on 03.10.22.
//

import SwiftUI

struct PieChartSlice: View {
    
    @State var showsPopover = false
    var pieData: PieChartData
    
    var midRadians: Double {
        return Double.pi / 2.0 - (pieData.startAngle + pieData.endAngle).radians / 2.0
    }
    
    var body: some View {
        
        GeometryReader { geometry in
            ZStack {
                Path { path in
                    
                    let radius = geometry.size.width * 0.5
                    let centerX = geometry.size.width/2
                    let centerY = geometry.size.height/2
                    let center = CGPoint(x: centerX, y: centerY)
                    
                    
                    path.move(to: center)
                    path.addArc(
                        center: center,
                        radius: radius,
                        startAngle: .degrees(-90) + pieData.startAngle,
                        endAngle: .degrees(-90) + pieData.endAngle,
                        clockwise: false)
                }
                .fill(pieData.color)
                
                
                
                Text(pieData.text)
                    .position(
                        x: geometry.size.width * 0.5 * CGFloat(1.0 + 0.78 * cos(self.midRadians)),
                        y: geometry.size.height * 0.5 * CGFloat(1.0 - 0.78 * sin(self.midRadians))
                    )
                    .foregroundColor(Color.white)
                    .bold()
            }
            
            
        }
        .aspectRatio(1,contentMode: .fit)
        
        
        
    }
}

struct PieChartSlice_Previews: PreviewProvider {
    static var previews: some View {
        PieChartSlice(pieData: PieChartData(startAngle: .degrees(0), endAngle: .degrees(90), color: .green, text: "60%"))
    }
}
