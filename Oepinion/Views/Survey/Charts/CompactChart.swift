//
//  CompactChart.swift
//  Oepinion
//
//  Created by Enzo Kaniewska on 18.10.22.
//

import SwiftUI

struct CompactChart: View {
    
    @State var value1:CGFloat
    @State var value2:CGFloat
    @State var value3:CGFloat
    
    var sum:CGFloat {
        return CGFloat(value1) + CGFloat(value2) + CGFloat(value3)
    }
    
    var body: some View {
        
        
        GeometryReader { proxy in
            
            let relativeVal1 = CGFloat(value1) / sum
            let relativeVal2 = CGFloat(value2) / sum
            let relativeVal3 = CGFloat(value3) / sum
            
            Path { path in
                
                path.move(to: CGPoint(x: 0, y: 0))
                
                path.addLine(to: CGPoint(x: proxy.size.width/3, y: 0))
            }
            .stroke(lineWidth: 4.0)
            .foregroundColor(.green)
            
            Path { path in
                
                path.move(to: CGPoint(x: proxy.size.width/3, y: 0))
                
                path.addLine(to: CGPoint(x: 2 * proxy.size.width/3, y: 0))
            }
            .stroke(lineWidth: 4.0)
            .foregroundColor(.red)
            
            Path { path in
                
                path.move(to: CGPoint(x: proxy.size.width/3, y: 0))
                
                path.addLine(to: CGPoint(x: 2 * proxy.size.width/3, y: 0))
            }
            .stroke(lineWidth: 4.0)
            .foregroundColor(.red)
        }
        .frame(height: 400)
        
    }
}

struct CompactChart_Previews: PreviewProvider {
    static var previews: some View {
        CompactChart(value1: 200, value2: 100, value3: 50)
    }
}
