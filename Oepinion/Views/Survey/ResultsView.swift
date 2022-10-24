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
                .font(.title)
                .bold()
                .padding(.bottom)
            
            Text("Das denken deine Mitmenschen zu diesem Thema:")
                .font(.title2)
                .foregroundColor(.secondary)
                .padding(.bottom)
            
            
            HStack{
                Spacer()
                ChartView(survey: survey)
                    .frame(width: 300, height: 400)
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
                
                Button(action: {
                    presentationMode.wrappedValue.dismiss()
                    
                }) {
                    Label("Zurück", systemImage: "arrowshape.turn.up.backward.circle.fill")
                        .symbolRenderingMode(.hierarchical)
                        .padding(.horizontal)
                }
                
                .font(.title2)
                .buttonStyle(.borderedProminent)
                .tint(.red)
                
                Spacer()
            }
            
            
            
            
        }
        .padding()
    }
    
    
}


struct ResultsView_Previews: PreviewProvider {
    static var previews: some View {
        ResultsView(survey: ModelData().surveys.first!)
    }
}
