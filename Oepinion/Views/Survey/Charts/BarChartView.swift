//
//  BarChartView.swift
//  Oepinion
//
//  Created by Enzo Kaniewska on 24.10.22.
//

import SwiftUI
import Charts

struct BarChartView: View {
    
    @State var survey:Survey
    @State var chartRepresantation:ChartRepresentation = .byAge
    
    
    var body: some View {
        
        VStack{
            
            if chartRepresantation == .byGender{
                Chart{
                    ForEach(survey.resultsByGender){ result in
                        BarMark(
                            x: .value("Answer", result.answer),
                            y: .value("Total Count", result.count)
                        )
                        .foregroundStyle(by: .value("Gender", result.gender.rawValue))
                        .cornerRadius(10)
                    }
                }
                .chartForegroundStyleScale(
                    [
                        "Männlich": .teal,
                        "Weiblich": .red
                    ]
                )


            } else {
                if chartRepresantation == .byAge{
                    Chart{
                        ForEach(survey.resultsByAge){ result in
                            BarMark(
                                x: .value("Answer", result.answer),
                                y: .value("Total Count",  result.count)
                            )
                          .foregroundStyle(by: .value("Age", result.ageGroup.rawValue))
                            .cornerRadius(10)
                        }
                    }
                    .chartForegroundStyleScale(
                        [
                            "Gruppe A": .green,
                            "Gruppe B": .orange,
                            "Gruppe C": .red
                        ]
                    )
                
                }
                
            }
            
            HStack{
                Spacer()
                Picker("Representation", selection: $chartRepresantation) {
                    Text("nach Geschlecht").tag(ChartRepresentation.byGender)
                    Text("nach Alter").tag(ChartRepresentation.byAge)
                }
                .tint(.red)
            }
            .padding(.bottom)
            .padding(.horizontal)
            
        }
        .padding(.horizontal)
        
    }
}

struct BarChartView_Previews: PreviewProvider {
    static var previews: some View {
        BarChartView(survey: ModelData().surveys.first!)
            .frame(height: 400)
        
    }
}
