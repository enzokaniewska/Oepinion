//
//  RegionInputView.swift
//  Oepinion
//
//  Created by Enzo Kaniewska on 11.10.22.
//

import SwiftUI

struct RegionInputView: View {
    
    let availableLocations = ["Kärnten", "Steiermark", "Wien", "Salzburg", "Niederösterreich", "Oberösterreich", "Burgenland", "Vorarlberg"]
    
    @State var region = ""
    var body: some View {
        
        VStack(alignment: .leading){
            
            Text("In welchen Bundesland bist du wohnhaft?")
                .font(.title)
                .bold()
                .padding()
            
            Text("Mit dieser Information können wir dir örtlich spezifische Umfragen empfehlen")
                .padding()
            
            Picker("Region", selection: $region) {
                ForEach(0..<availableLocations.count){ i in
                    Text(availableLocations[i]).tag(availableLocations[i])
                }
            }
            
            .pickerStyle(.wheel)
            
            
        }
        .padding()
        

    }
}

struct RegionInputView_Previews: PreviewProvider {
    static var previews: some View {
        RegionInputView()
    }
}
