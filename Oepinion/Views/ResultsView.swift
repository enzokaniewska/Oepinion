//
//  ResultsView.swift
//  Oepinion
//
//  Created by Enzo Kaniewska on 27.09.22.
//

import Charts
import SwiftUI

struct ResultsView: View {
    
    var survey:Survey
    
    
    @Environment(\.presentationMode) var presentationMode
    
    
    var body: some View {
        
        VStack(alignment: .leading){
            
            Spacer()
            
            Text("Danke fürs Abstimmen!")
                .font(.largeTitle)
                .bold()
                .padding(.bottom)
            
            Text("Das denken deine Mitmenschen zu diesem Thema:")
                .font(.title2)
                .fontWeight(.regular)
                .padding(.bottom)
                
            
            HStack{
                Spacer()
                ChartView(survey: survey)
                    .frame(width: 300, height: 300)
                Spacer()
            }
            .padding(.bottom)
            
          
            HStack {
                Spacer()
                Text("\(survey.totalParticipants) Menschen haben bei dieser Umfrage teilgenommen")
                    .font(.caption)
                Spacer()
            }
            
            
            Spacer()
            HStack {
                Spacer()
                VStack{
                    Button(action: {
                        
                    }) {
                        Label("Teilen", systemImage: "square.and.arrow.up.circle.fill")
                            .symbolRenderingMode(.hierarchical)
                    }
                    .font(.title)
                    .buttonStyle(.borderedProminent)
                    .tint(.blue)
                    
                    
                    Button(action: {
                        presentationMode.wrappedValue.dismiss()
                        
                    }) {
                        Label("Zurück", systemImage: "arrowshape.turn.up.backward.circle.fill")
                            .symbolRenderingMode(.hierarchical)
                    }
                    .font(.title)
                    .buttonStyle(.borderedProminent)
                    .tint(.red)
                    .scaledToFit()
                    
                }
                Spacer()
            }
            
            
            
            
        }
        .padding()
    }
    
    
}


struct ResultsView_Previews: PreviewProvider {
    static var previews: some View {
        ResultsView(survey: ModelData.testSurveys.first!)
    }
}
