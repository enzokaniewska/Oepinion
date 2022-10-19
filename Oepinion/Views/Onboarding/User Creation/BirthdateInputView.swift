//
//  BirthdateInputView.swift
//  Oepinion
//
//  Created by Enzo Kaniewska on 11.10.22.
//

import SwiftUI

struct BirthdateInputView: View {
    
    @State var birthdate = Date()
    var body: some View {
        VStack(alignment: .leading){
            Text("Wann wurdest du geboren?")
                .font(.title)
                .bold()
                .padding()
            
            Text("Dein Alter wird benötigt um die Ergebnisse der Umfragen zu verbessern")
                .padding()
              
            
            HStack {
                Spacer()
                DatePicker("Geburtsdatum", selection: $birthdate, displayedComponents: .date)
                    .datePickerStyle(.wheel)
                    .labelsHidden()
                Spacer()
            }
            
        
            
        }
        .padding()
    }
}

struct BirthdateInputView_Previews: PreviewProvider {
    static var previews: some View {
        BirthdateInputView()
    }
}
