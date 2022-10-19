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
                Chart{
                    BarMark(
                        x: .value("Yes", "Ja"),
                        y: .value("Anzahl", survey.results["yes"]!)
                    )
                    .cornerRadius(10)
                    .foregroundStyle(Color.green)
                    
                    BarMark(
                        x: .value("Nein", "Nein"),
                        y: .value("Anzahl", survey.results["no"]!)
                    )
                    .cornerRadius(10)
                    .foregroundStyle(Color.red)
                    
                    BarMark(
                        x: .value("Neutral", "Neutral"),
                        y: .value("Anzahl", survey.results["neutral"]!)
                    )
                    .cornerRadius(10)
                    .foregroundStyle(Color.orange)
                }
                .frame(width: 300, height: 260)
                
            } else{
                PieChartView(
                    backgroundColor: .white,
                    colors: [.green, .red, .orange],
                    values: [
                        Double(survey.results["yes"]!),
                        Double(survey.results["no"]!),
                        Double(survey.results["neutral"]!)
                    ]
                )
                .frame(width: 260, height: 260)
                
                    
            }
            
            
        }
        
    }
}

struct ChartView_Previews: PreviewProvider {
    static var previews: some View {
        ChartView(survey: ModelData().surveys.first!)
    }
}
