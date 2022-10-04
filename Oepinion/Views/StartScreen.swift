//
//  StartScreen.swift
//  Oepinion
//
//  Created by Enzo Kaniewska on 02.10.22.
//

import SwiftUI

struct StartScreen: View {
    var body: some View {
        
        VStack(alignment: .center){
            
            
            
            Image("austria")
                .renderingMode(.original)
                .resizable()
                .frame(width: 150, height: 150)
                .shadow(radius: 5)
            
            Text("Öpinion")
                .font(.largeTitle)
                .bold()
                .padding()
            
            Text("Das denkt Österreich")
                .font(.title2)
                .padding(.bottom, 100)
            
            HStack{
               Image(systemName: "text.bubble.fill")
                    .padding(.trailing, 10)
               Text("Freie Meinung")
                .bold()
                Spacer()
                
            }.padding()
                .padding(.leading, 70)
            HStack{
               Image(systemName: "person.3.fill")
               Text("Völlige Transparenz")
                .bold()
                Spacer()
                    
                
            }.padding()
                .padding(.leading, 70)
            HStack{
               Image(systemName: "person.3.fill")
               Text("Aktuelle Themen")
                .bold()
                Spacer()
                
            }.padding()
                .padding(.leading, 70)
            
            
            Button("Jetzt Loslegen"){
                
            }
            .tint(.red)
            .font(.title)
            .buttonStyle(.borderedProminent)
            .cornerRadius(10)
            .shadow(radius: 5)
            .padding()
            
        }
        
        
        
    }
}

struct StartScreen_Previews: PreviewProvider {
    static var previews: some View {
        StartScreen()
    }
}
