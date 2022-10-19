//
//  CreateUserView.swift
//  Oepinion
//
//  Created by Enzo Kaniewska on 11.10.22.
//

import SwiftUI

struct CreateUserView: View {
    var body: some View {
        
        VStack(alignment: .leading){
            
            Text("Möchtest du jetzt deinen Account erstellen?")
                .bold()
                .font(.title)
               
            
            Text("Alles was wir wissen, sind dein Geburtsdatum und dein Bundesland. Dein Konto bleibt völlig anonym. Versprochen.")
                .padding(.bottom)
            
            HStack {
                Spacer()
                Button {
                    
                } label: {
                    Label("Konto erstellen", systemImage: "person.fill.badge.plus")
                }
                .buttonStyle(.borderedProminent)
                .font(.title)
                Spacer()
            }
            

            
        }
        .padding()
        
            
    }
}

struct CreateUserView_Previews: PreviewProvider {
    static var previews: some View {
        CreateUserView()
    }
}
