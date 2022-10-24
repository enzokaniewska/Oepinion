//
//  ChartView.swift
//  Oepinion
//
//  Created by Enzo Kaniewska on 03.10.22.
//

import SwiftUI
import Charts

struct ChartView: View {
    
    var survey: Survey
    @State var chartType: ChartType = .barChart
    
    
    enum ChartType: String, CaseIterable, Identifiable{
        case barChart = "Säulendiagramm"
        case pieChart = "Kreisdiagramm"
        
        var id: Self { self }
    }
    
    var body: some View {
        
        VStack{
            Picker("Diagram", selection: $chartType) {
                ForEach(ChartType.allCases){ type in
                    Text(type.rawValue)
                }
            }
            .padding(.leading, 20)
            .padding(.trailing,20)
            .padding(.bottom)
            .pickerStyle(.segmented)
        
            if chartType == .barChart{
                
                BarChartView(survey: survey)
                    .frame(width: 350, height: 300)
        
            } else{
                PieChartView(
                    backgroundColor: .white,
                    colors: [.green, .red, .orange],
                    values: [
                        Double(survey.resultsByOptions["Yes"] ?? 100),
                        Double(survey.resultsByOptions["No"] ?? 100),
                        Double(survey.resultsByOptions["Neutral"] ?? 100)
                    ]
                )
                .frame(width: 300, height: 300)
                
                    
            }
            
            
        }
        
    }
}

enum ChartRepresentation{
    case byAge
    case byGender
}

struct ChartView_Previews: PreviewProvider {
    static var previews: some View {
        ChartView(survey: ModelData().surveys.first!)
    }
}
