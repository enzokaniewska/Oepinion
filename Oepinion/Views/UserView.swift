//
//  UserView.swift
//  Oepinion
//
//  Created by Enzo Kaniewska on 30.09.22.
//

import SwiftUI

struct UserView: View {
    
    @Environment(\.dismiss) private var dismiss
    let haptic = UINotificationFeedbackGenerator()
    @Binding var user: User
    @State private var newPictureButtonPressed = false
    
    var image:Image{
        Image(user.imageName)
    }
    
    var body: some View {
        
        
        VStack (alignment: .leading){
            
            HStack{
                Spacer()
                Button("Zurück", action: {
                    dismiss()
                })
            }
            Text("Dein Account")
                .font(.largeTitle)
                .bold()
            
            HStack {
                Spacer()
                image
                    .renderingMode(.original)
                    .resizable()
                    .shadow(radius: 4)
                    .frame(width: 200, height: 200)
                    .overlay{
                        Circle().stroke(.white, lineWidth: 4)
                    }
                    .rotationEffect(.degrees(newPictureButtonPressed ? 360 : 0))
                    .padding()
                    
                Spacer()
            }
            
            HStack {
                Spacer()
                Button(action: {
                    
                    haptic.notificationOccurred(.success)
                    withAnimation(.spring()){
                        user.imageName = "animal\(Int.random(in: 1...50))"
                        newPictureButtonPressed.toggle()
                    }
                    
                    
                    
                }, label: {
                    Label("Neues Profilbild", systemImage: "dice.fill")
                        
                })
                .buttonStyle(.bordered)
                Spacer()
            }
            
            List{
                
                HStack {
                    Text("Alter")
                    .bold()
                    
                    Spacer()
                    
                    Text("\(user.age)")
                }
                
                
                HStack {
                    Text("Bundesland")
                    .bold()
                    
                    Spacer()
                    
                    Text("\(user.region)")
                }
                
                HStack{
                    Text("Benachrichtigungen")
                        .bold()
                    
                    Spacer()
                    
                    Text(user.isNotificationEnabled ? "Ein" : "Aus")
                }
                
                
            }
            .listStyle(.plain)
            
            Spacer()
            
        }
        .padding()
        
        
    }
}

struct UserView_Previews: PreviewProvider {
    static var previews: some View {
        UserView(user: .constant(ModelData.testUser))
    }
}
