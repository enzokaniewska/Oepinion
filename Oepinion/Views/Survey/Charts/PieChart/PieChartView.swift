//
//  PieChartView.swift
//  Oepinion
//
//  Created by Enzo Kaniewska on 03.10.22.
//

import SwiftUI

struct PieChartView: View {
    
    var backgroundColor:Color
    var colors:[Color]
    var values:[Double]
    
    var slices:[PieChartData] {
        
        let sum = values.reduce(0, +)
        var startDeg:Double = 0
        var slicesArr = [PieChartData]()
        
        for (i, value) in values.enumerated(){
            let angle: Double = value / sum * 360.0
            slicesArr.append(PieChartData(startAngle: Angle(degrees: startDeg), endAngle: Angle(degrees: angle + startDeg), color: colors[i], text: String(format: "%.0f%%", value * 100 / sum)))
            startDeg += angle
            
        }
        return slicesArr
    }
    
    
    var body: some View {
        
       
        GeometryReader { geometry in
            ZStack{
                ForEach(0..<self.values.count){ i in
                    PieChartSlice(pieData: self.slices[i])
                       
                }
                .frame(width: geometry.size.width, height: geometry.size.width)
                
                Circle()
                    .fill(Color(UIColor.systemBackground))
                    .frame(width: geometry.size.width * 0.4, height: geometry.size.height * 0.4)
                
                VStack{
                    Image(systemName: "person.3.sequence.fill")
                        .symbolRenderingMode(.hierarchical)
                    
                    Text(String(Int(values.reduce(0, +))))
                        .font(.title)
                        
                }
            }
           
            
        }
            
        
   
    }
    
    
}

struct PieChartData{
    var startAngle: Angle
    var endAngle: Angle
    var color: Color
    var text:String
}

struct PieChartView_Previews: PreviewProvider {
    static var previews: some View {
        PieChartView(backgroundColor: .white, colors: [.red, .orange, .green], values: [100, 320,39])
            .frame(width: 300, height: 300)
    }
}
