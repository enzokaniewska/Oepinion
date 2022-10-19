//
//  StartScreen.swift
//  Oepinion
//
//  Created by Enzo Kaniewska on 02.10.22.
//

import SwiftUI

struct StartScreen: View {
    
    @Binding var startButtonPressed:Bool
    
    var iconColor = Color.teal
    var hSpacing : CGFloat = 20
    
    
    var body: some View {
        
        
        VStack(alignment: .center){
            
            Spacer()
            
            Image("austria")
                .renderingMode(.original)
                .resizable()
                .frame(width: 150, height: 150)
               
            
            Text("Öpinion")
                .font(.largeTitle)
                .bold()
                
            
            Text("Das denkt Österreich")
                .font(.title2)
                .padding(.bottom, 100)
            
            
            VStack(spacing: 25){
                
                HStack(spacing: hSpacing){
                    Image(systemName: "person.wave.2.fill")
                        .symbolRenderingMode(.hierarchical)
                        .resizable()
                        .foregroundColor(iconColor)
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 50, height: 50)
                   
                    VStack(alignment: .leading) {
                        Text("Hier steht der Titel")
                            .font(.title3)
                            .bold()
                        
                        Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit")
                            .foregroundColor(.secondary)
                        
                    }
                }
                
                HStack(spacing: hSpacing){
                    Image(systemName: "person.3.fill")
                        .symbolRenderingMode(.hierarchical)
                        .resizable()
                        .foregroundColor(iconColor)
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 50, height: 50)
                   
                    VStack(alignment: .leading) {
                        Text("Hier steht der Titel")
                            .font(.title3)
                            .bold()
                        
                        Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit")
                            .foregroundColor(.secondary)
                        
                    }
                }
                
                HStack(spacing: hSpacing){
                    Image(systemName: "antenna.radiowaves.left.and.right")
                        .symbolRenderingMode(.hierarchical)
                        .resizable()
                        .foregroundColor(iconColor)
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 50, height: 50)
                   
                    VStack(alignment: .leading) {
                        Text("Hier steht der Titel")
                            .font(.title3)
                            .bold()
                        
                        Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit")
                            .foregroundColor(.secondary)
                        
                    }
                }
                
                
            }
            .padding(.horizontal, 25)
            
            Spacer()
            Button {
                startButtonPressed = true
            } label: {
                Label("Jetzt Loslegen", systemImage: "")
                    .padding(.horizontal, 10)
                    .padding(.vertical, 5)
                    .labelStyle(.titleOnly)
                    
            }
                .tint(.red)
                .font(.title)
                .buttonStyle(.borderedProminent)
                .cornerRadius(10)
            

            
            Spacer()
            
            
            
        }
        
        
        
    }
}

struct StartScreen_Previews: PreviewProvider {
    static var previews: some View {
        StartScreen(startButtonPressed: .constant(false), iconColor: .teal)
       
    }
}
